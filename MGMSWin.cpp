const char *programName="Mechanical Gage Measurement System";
//static char programVersion[]="$Revision$";
static char programVersion[]="1.0.2";
static char *id="$Id$";

#define DEBUG_APPLANIX 		0
#define TIMER_RECONNECT		1
#define SEND_GAGE_ON_PPS	1
#define SEND_PPS_TO_IN		1

#ifndef _DEBUG	// Force all debug code to none if we have a release version
#	define DEBUG_APPLANIX	0
#	define DEBUG_MISSING_DB	0
#endif

/*
	Revision History:
	$Log$
    1.0.2 - new libraties for the whole VME memory
*/

//---------------------------------------------------------------------------
#include <vcl.h>
#include <vcl/registry.hpp>
#include <stdlib.h>
#include <stddef.h>
#include <io.h>
#pragma hdrstop

#include "MgmsWin.h"
#include "CalculateGain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

#pragma link "AdvSplitter"
#pragma link "AdvPanel"
#pragma link "AdvEdit"
#pragma link "AdvSpin"
#pragma link "LED"
#pragma link "AdvGrid"
#pragma link "BaseGrid"
#pragma link "AsgLinks"
#pragma link "ALed"
#pragma link "TransBtn"
#pragma link "AppEvent"
#pragma resource "*.dfm"

#include "MgmsMessages.cpp"


#pragma pack(push,2)
extern "C"
{
#define _WINDOWS	// Hunt down these useless constants.
#include <codes.h>
#include <configs.h>
#include <wstdlib.h>
}
#pragma pack(pop)

const maxChannels=5;
CONFIGS 		*g_pConfigs;
INPUT_REC		g_Input[32];
INPUT_REC		g_SInput[32];

bool gNewCalibrationFormat;
bool gCalibrated; // based on date
double voltsPerMM=0;
double minVolts;
double maxVolts;

unsigned short	g_nRVolts[32]; 	// Raw, unscaled volts, shorts
double			g_dRVolts[32];	// Raw volts floats
double			g_dCVolts[32];	// Intermediate volts
double			g_Gages[32];	// Final gages values

int FLoops;
int CalChannel;	// Channel for calibration
int g_nPollCounter;
float g_dVoltageSum;
float g_dDesiredUnits;
bool MakeNewCalibration=false;
bool bCalculateZero=false;
bool bCalculateGain=false;
int XRow=0;
int XCol=0;
bool bDirtyConf=false;

unsigned short SimulationLevel = 0x0;

int lastCode320=0;
int lastCode12=0;

bool LogData = false;
bool MetricUnits = true;
double FVoltsToUnits=1.00;
char mess_buffer[132];

#if 0 // Leave it here for testing
int adcCounter=0;
int ppsCounter=0;

void VmeADCCallback(GEF_CALLBACK_HDL callback_hdl, GEF_VME_INT_INFO int_info, void *arg)
{
	adcCounter++;
}
//---------------------------------------------------------------------------
void VmePPSCallback(GEF_CALLBACK_HDL callback_hdl, GEF_VME_INT_INFO int_info, void *arg)
{
	ppsCounter++;
}
//---------------------------------------------------------------------------
#endif

bool DirtyCalibratedData()
{
	for( int n = 0 ; n < 32 ; n++ )
    {
		if(memcmp(&g_SInput[ n ], &g_Input[ n ], sizeof( INPUT_REC )))
        	return true;
    }
    return false;
}
//---------------------------------------------------------------------------

void
CopyCalibratedData()
{
	// Simplity access to config parameters
	for( int n = 0 ; n < 32 ; n++ )
    {
		memcpy( &g_Input[ n ], &g_pConfigs->inputs[ n ], sizeof( INPUT_REC ));
		memcpy( &g_SInput[ n ], &g_pConfigs->inputs[ n ], sizeof( INPUT_REC )); // For comparison
	}
}
//---------------------------------------------------------------------------

void
TMainForm::SaveCalibrationData()
{
	static char buffer[132];
	g_pConfigs->aggs.unused2=1;
	for( int n = 0 ; n < 32 ; n++ )
	{
		memcpy( &g_pConfigs->inputs[ n ], &g_Input[ n ], sizeof( INPUT_REC ) );
		memcpy( &g_SInput[ n ], &g_pConfigs->inputs[ n ], sizeof( INPUT_REC )); // For comparison
	}

	GetPrivateProfileString("ConfigurationFile", "FILENAME", "aggs.cfg", buffer, sizeof(buffer), ".\\em.ini");
	con_write(buffer);
	SetCalibrationControls();
}
//---------------------------------------------------------------------------


void TMainForm::SetCalibrationControls()
{
//	RetractAxleBtn->Enabled = true;
//	ExtractAxleBtn->Enabled = false;
//	DifferenceInMMBtn->Enabled = false;
//	GageOnAxleBtn->Enabled = false;

//	DiffInMMEd->Enabled = false;
//	GageOnTrackMMEd->Enabled = false;
	DiffInMMEd->Text="0";
	GageOnTrackMMEd->Text="0";

	RetractAxleLab->Caption="0.0";
	ExtractAxleLab->Caption="0.0";
	VoltsPerMMLab->Caption="0.0";
	GageInMM->Caption="0";
}
//---------------------------------------------------------------------------
void ReadCalibrationData()
{
	char buffer[256];
	GetPrivateProfileString("ConfigurationFile", "FILENAME", "aggs.cfg", buffer, sizeof(buffer), ".\\em.ini");
	if(access(buffer, 0) != 0)
	{
//		sprintf(msgBuffer,"%s: %s",PM(43),buffer);
//		MSG(msgBuffer);
		return;
	}

	alloc_configs(MAXCONFIGS);
	con_read (buffer);
	ReadCodes(buffer);
	g_pConfigs = configs[0];
}

#define _NEGATIVE_   ((unsigned short)(0))
#define _POSITIVE_   ((unsigned short)(1))

void AdjustInputs()
{
	double dPolarity;
	int nChannel;

	// Input - g_dRVolts, output - g_Gages;
	for( nChannel = 0 ; nChannel < maxChannels; nChannel++ )
	{
		if(g_Input[nChannel].UnitsPerVolt==0.0)
		{
			g_nRVolts[ nChannel ] = 0x8000;
			g_dRVolts[ nChannel ] = 0.0;
			g_dCVolts[ nChannel ] = 0.0;
			g_Gages[ nChannel ] = 0.0;
		}
		else
		{
			dPolarity = ( g_Input[ nChannel ].polarity == _NEGATIVE_ ) ? -1.0 : 1.0;
			g_dCVolts[ nChannel ] = (g_dRVolts[ nChannel ] - g_Input[ nChannel ].zero) * g_Input[ nChannel ].gain;
			g_dCVolts[ nChannel ] *= dPolarity;

			// Technically this is Gage
			g_Gages[ nChannel ] =  (g_dCVolts[ nChannel ] / g_Input[ nChannel ].UnitsPerVolt);
			g_Gages[ nChannel ] += g_Input[ nChannel ].LastCalTime; // Zero Adjustment Gages
		}
	}
}
//---------------------------------------------------------------------------

float toMM(float v)
{
	if(MetricUnits)
		return v;
	else
		return v*25.4;
}
//---------------------------------------------------------------------------

float toInches(float v)
{
	if(MetricUnits)
		return v;
	else
		return v/25.4;
}
//---------------------------------------------------------------------------

unsigned short vTt(double v)
{
	double vv;
	unsigned short Result;
	vv = v;

	if(v<1.0)
		vv = 1.0;
	if(v>8.0)
		vv = 8.0;
	Result = (unsigned char)(vv*17.00);	// 1v == 21 units
	return Result;
}
//---------------------------------------------------------------------------

double tTv(unsigned short t)
{
	double Result;

	Result = t*0.058823;	// 1/17
	if(Result<1.0)
		Result = 1.0;
	if(Result>8.0)
		Result = 8.0;
	return Result;
}
//---------------------------------------------------------------------------

TMainForm *MainForm;

void
TMainForm::ReadChannels()
{
	int nChannel;
	//
	// Get data directly from A/D converter without help of NIOS daemon or simulate
	//
	for( nChannel = 0 ; nChannel < maxChannels ; nChannel++ )
	{
		if(SimulationLevel != SIM_ALL_HARDWARE)
		{
			// Real data aquisition;
			g_nRVolts[nChannel] = (short)IP_48AD_readData(0, nChannel); // reading short data
			g_dRVolts[ nChannel ] = getVolts(g_nRVolts[ nChannel ]);	// Output Array
		}
		else
		{
			SimulateInputs();
		}
	}
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{
	initControls();
	initApplication();
#if 0
	if(SimulationLevel != SIM_ALL_HARDWARE)
	{
		if (!RunDaemon())
		{
			::MessageBox( GetFocus(), "Cannot Start Device Service Daemon", "MGMS", MB_APPLMODAL | MB_ICONHAND );
			Application->Terminate();
		}
	}
#endif		
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::MSG(AnsiString msg)
{
	if(!MsgPanel->Visible)
	{
//		MainForm->Height = MainForm->Height+MsgPanel->Height;;
		MsgPanel->Visible = true;
		ClearMessagesBtn->Visible = true;
	}
	MsgMemo->Lines->Add(msg);
#if 0
	if(FLogFile)
		fprintf(FLogFile, "%s\n", msg.c_str());
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::MSG(const char *msg)
{
	if(!MsgPanel->Visible)
	{
//		MainForm->Height = MainForm->Height+MsgPanel->Height;
		MsgPanel->Visible = true;
		ClearMessagesBtn->Visible = true;
	}
	MsgMemo->Lines->Add(AnsiString(msg));
#if 0
	if(FLogFile)
		fprintf(FLogFile, "%s\n", msg);
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::MSG(string msg)
{
	if(!MsgPanel->Visible)
	{
//		MainForm->Height = MainForm->Height+MsgPanel->Height;
		MsgPanel->Visible = true;
		ClearMessagesBtn->Visible = true;
	}
	MsgMemo->Lines->Add(AnsiString(msg.c_str()));

#if 0
	if(FLogFile)
		fprintf(FLogFile, "%s\n", msg.c_str());
#endif
}
//---------------------------------------------------------------------------

void
TMainForm::AssignTitles()
{
	Titles = new TProgMessages("MGMS.TRN", MGMSMessages,sizeof(MGMSMessages)/sizeof(MGMSMessages[0]));

	EM1ConnectionBox->Caption = DM(0);
	EM1ConnectionLabel->Caption = DM(1);
	ApplanixConnectionBox->Caption = DM(8);
	ADCConnectionLabel->Caption = DM(9);
	PPSConnectionLabel->Caption = DM(12);

    MeasurementSheet->Caption = DM(15);
    CalibrationSheet->Caption = DM(16);
    SaveBtn->Hint = DM(17);
    CalculateZeroBtn->Hint = DM(18);
    CalculateGainBtn->Hint = DM(19);
    StartPollingBtn->Hint = DM(20);
    StopPollingBtn->Hint = DM(21);
	EnableEditBtn->Hint = DM(22);


	ClearMessagesBtn->Caption = DM(24);
	adcDataBreaksBox->Caption = DM(26);
	MissingADCDatabreaksEd->LabelCaption = DM(27);
	ppsDataBreakBox->Caption = DM(28);
	MissingPPSDatabreaksEd->LabelCaption = DM(27);
//	DisplayDataCB->Caption = DM(30);
	DisplayCountersCB->Caption = DM(31);

	// Tab captions
	LGageBox1->Caption = DM(45);
	LFilteredGage->LabelCaption = DM(46);
	LInstantGage->LabelCaption = DM(47);
	RFilteredGage->LabelCaption = DM(46);
	RInstantGage->LabelCaption = DM(47);
	TotalGage0->LabelCaption = DM(50);
	RGageBox1->Caption = DM(51);

	LGageBox2->Caption = DM(45);
	LFilteredGage1->LabelCaption = DM(46);
	LInstantGage1->LabelCaption = DM(47);
	RFilteredGage1->LabelCaption = DM(46);
	RInstantGage1->LabelCaption = DM(47);

	TotalGage1->LabelCaption = DM(50);
	RGageBox2->Caption = DM(51);
#if 0
	CalculateGainForm = new TCalculateGainForm(0);
	CalculateGainForm->DesiredUnitsEd->LabelCaption = DM(40);
	CalculateGainForm->OKGain->Caption = DM(41);
	CalculateGainForm->CancelGain->Caption = DM(42);
#endif

	// ->Caption = DM();
	// ->LabelCaption = DM();
}
//---------------------------------------------------------------------------

bool
TMainForm::ReadConfigINI()
{
	static char parBuffer[132];
	AnsiString par;
    int factor;
	char *filename = ".\\MGMS_Configuration.ini";

	if(access(filename,0)<0)
		return false;

	SimulationLevel = 0;

	//
	// See what is possible with regular config files, which info is extra.
	//
	GetPrivateProfileString("PROGRAM", "UNITS","METRIC",parBuffer,sizeof(parBuffer),filename);
	if(strcmpi(parBuffer,"METRIC") == 0)
		MetricUnits = true;
	else
		MetricUnits = false;

	GetPrivateProfileString("PROGRAM", "CONVERT FROM VOLTS","100",parBuffer,sizeof(parBuffer),filename);
    try
    {
		sscanf(parBuffer,"%d",&factor);
    }
    catch(...)
    {
    	factor = 100;
    }
    if(factor==0)
    	factor = 100;

    FVoltsToUnits = factor/100.0;


	//
	// New section: [Simulate Hardware]
	//


    GetPrivateProfileString("Simulate Hardware", "SIMULATE_APPLANIX_PPS","NO",parBuffer,sizeof(parBuffer),filename);
    if(strcmpi(parBuffer,"YES") == 0)	// Yes, simulate all
        SimulationLevel |= SIM_APPLANIX_12;

	GetPrivateProfileString("Simulate Hardware", "SIMULATE_APPLANIX_ADC","NO",parBuffer,sizeof(parBuffer),filename);
	if(strcmpi(parBuffer,"YES") == 0)	// Yes, simulate all
		SimulationLevel |= SIM_APPLANIX_320;

	GetPrivateProfileString("Simulate Hardware", "SIMULATE_APPLANIX","NO",parBuffer,sizeof(parBuffer),filename);
    if(strcmpi(parBuffer,"YES") == 0)	// Yes, simulate all
		SimulationLevel |= SIM_APPLANIX;

    GetPrivateProfileString("Simulate Hardware", "SIMULATE_ALL_HARDWARE","NO",parBuffer,sizeof(parBuffer),filename);
	if(strcmpi(parBuffer,"YES") == 0)
		SimulationLevel |= SIM_ALL_HARDWARE;

	GetPrivateProfileString("DEBUG", "LOG_DATA","NO",parBuffer,sizeof(parBuffer),filename);
	if(strcmpi(parBuffer,"YES") == 0)
		LogData = true;
	else
		LogData = false;

	return true;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::initControls()
{
	AssignTitles();

    FilteredGage[0] = RFilteredGage;
	FilteredGage[1] = LFilteredGage;
    FilteredGage[2] = RFilteredGage1;
    FilteredGage[3] = LFilteredGage1;

	InstantGage[0] = RInstantGage;
	InstantGage[1] = LInstantGage;
	InstantGage[2] = RInstantGage1;
	InstantGage[3] = LInstantGage1;

	TotalGage[0] = TotalGage0;
	TotalGage[1] = TotalGage1;
}
//---------------------------------------------------------------------------

void
TMainForm::readConfigs()
{
	char buffer[256];
	char msgBuffer[256];
	int nChannel;

	ReadCalibrationData();
	CopyCalibratedData(); // Make local copy into g_Input

	// Use unused fields to display date/time vs ZeroPoint...
	gNewCalibrationFormat = g_pConfigs->aggs.unused2;

	if(!gNewCalibrationFormat)
	{
		// disregards previous calibration and set values to some defaults:
		for(nChannel = 1; nChannel<5; nChannel++)
		{
			g_Input[ nChannel ].zero = 0;
			g_Input[ nChannel ].gain = 1;
			g_Input[ nChannel ].UnitsPerVolt = 1;
			g_Input[ nChannel ].polarity = _POSITIVE_;

			g_Input[ nChannel ].LastCalTime=0;

			MakeNewCalibration=true;
		}
		SaveCalibrationData();
	}
	else
	{
		// New format,
		if(g_Input[ 2 ].LastCalTime == 0 || g_Input[ 4 ].LastCalTime == 0)
			MakeNewCalibration=true;
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::initApplication()
{
	FLogFile = 0;

	readConfigs();
	if(!ReadConfigINI())
	{
		Application->MessageBox(AnsiString( AnsiString(PM(88)) + " \"MGMS_Configuration.ini\" " + PM(89) ).c_str(),PM(90));
		throw Exception(PM(90));
	}
	
	if(SimulationLevel != SIM_ALL_HARDWARE)
		CreateThreads();

	//
	// Get ready to receive data (one more sync method)
	//
	Caption = AnsiString(programName) + "   " + programVersion;

	if(SimulationLevel)
		Caption = Caption + DM(34);

	// "Regular Height
//	MainForm->Height = 694-248-MsgPanel->Height;
#if DEBUG_APPLANIX
	LogFileBox->Checked = true;
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::finishApplication()
{
#if TIMER_RECONNECT
	PPSTimer->Enabled = false;
	ADCTimer->Enabled = false;
#endif

	if(FLogFile)
		fclose(FLogFile);
	try
	{
		Applanix12->Close();
		Applanix320->Close();
	}
	catch(...)
	{
	}
	delete camera;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::DisplayWorkPage(void)
{
	int iSide;
	static AnsiString scrText;
	char buf[32];

	for(iSide=0;iSide<4;iSide++)
	{
		if(OGMSFrame.Channels[iSide+1] == 0)
			FilteredGage[iSide]->Text = 0.0;
		else
		{
			sprintf(buf,"%.1f", OGMSFrame.Channels[iSide+1]); // standard gage
			FilteredGage[iSide]->Text = buf;
		}
	}

	sprintf(buf, "%6.1f", OGMSFrame.Channels[1]+OGMSFrame.Channels[2]);	// sttandard gage
	TotalGage0->Text = buf;

	sprintf(buf, "%6.1f", OGMSFrame.Channels[3]+OGMSFrame.Channels[4]);	// standard gage
	TotalGage1->Text = buf;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::CreateThreads()
{
	// TODO: To prevent this event created incorrectly, integrate event creation inside the component
	HANDLE		event;

	OpenAggsDevice(); // Get Access to VME Device

#if 0 // Leave it here for testing
	SetVmeHandler(VmeADCCallback,1, GEF_VME_INT_VIRQ1,0x56, 0);
//    SetVmeHandler(VmePPSCallback,11,GEF_VME_INT_VIRQ1,0x57, 0);
#endif

	delete camera;
	camera = 0;

	try
	{
		event = 0;
		// Constructor creates event "MGMS_DATA"
		camera = new TCameraComponent(this, event);
		camera->OnPacketReceived = GotCamera;
	}
	catch(Exception *e)
	{
		MSG(AnsiString(PM(20)) + e->Message);
	}
	catch(...)
	{
		MSG(PM(21));
	}
}
//---------------------------------------------------------------------------

void
TMainForm::SimulateInputs()
{
	static double simVoltage=0.0;
	for( int nChannel = 0 ; nChannel < maxChannels ; nChannel++ )
	{
		// Simulate

		if(FrontSide->Checked)
			g_dRVolts[ nChannel ] = sin(nChannel+simVoltage)+0.9360; //
		else
			g_dRVolts[ nChannel ] = sin(nChannel+simVoltage)+0.671;
		simVoltage += 0.1;
	}
}
//---------------------------------------------------------------------------

void
TMainForm::PerformSimulate(unsigned short SimulationLevel)
{
//	static double x=0;
//	unsigned short c_mask;

	if(SimulationLevel == 0)
		return;

	if(SimulationLevel == SIM_ALL_HARDWARE)
	{
		OGMSFrame.missingADCInterrupts = 0;
		OGMSFrame.missingPPSInterrupts = 0;
		OGMSFrame.adcInterruptCount++;
		OGMSFrame.InterruptReason = 0x2;

		if(OGMSFrame.adcInterruptCount%2==0)
		{
			OGMSFrame.InterruptReason |= 0x4;
			OGMSFrame.ppsInterruptCount++;
		}
		OGMSFrame.ppsTimeTotal.QuadPart += 500000;
		OGMSFrame.adcTimeTotal = OGMSFrame.ppsTimeTotal;
	}
	else
	{
		return;	// 10/28/10
	}

	SimulateInputs();
	CalculateGageForSubsystems(OGMSFrame.Channels);

/*
//	c_mask = 0x1;
	for(int i=0;i<5;i++)
	{
		sin_result = sin(x);
		x = x + 0.01;
		OGMSFrame.Channels[i+1] = 25 + 25 * sin_result;
//		c_mask <<= 1;
	}
*/
}
//---------------------------------------------------------------------------

void
TMainForm::CalculateGageForSubsystems(float	*Channels)
{
	int nChannel;
	float dPolarity;

	for(nChannel=0;nChannel<maxChannels;nChannel++)
		g_dRVolts[nChannel] = Channels[nChannel]; // Prepare array

	AdjustInputs();

	for(nChannel=0;nChannel<maxChannels;nChannel++)
	{
		if(g_Input[nChannel].UnitsPerVolt==0.0)
		{
			// Logically should be "-g_pConfigs->StandardGage"
			Channels[nChannel] = 0.0;
		}
		else
		{
			// Specific for MGMS/OGMS - sending only difference with standard gage.
			Channels[nChannel] = g_Gages[ nChannel ] - g_pConfigs->StandardGage;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::GotCamera(TObject *, PVOID data)
{
	static bool inProcess=false;

	if(inProcess)
	{
		FFastHits++;
		return;
	}
	inProcess = true;

	try
	{
        ogms_buffer->read();

        memcpy(&OGMSFrame, ogms_buffer,sizeof(OGMSFrame));

		// OGMSFrame.Channels[i] contain float data. Not yet normalized.
		CalculateGageForSubsystems(OGMSFrame.Channels);

        // Fill OGMSFrame.Channels with sim data and interrupt reason
		PerformSimulate(SimulationLevel);

        if(OGMSFrame.InterruptReason)
        {
            if(OGMSFrame.InterruptReason & 0x2)	// Counter ADC
            {
                if(DisplayCountersCB->Checked)
                    adcInterrupt->Caption = OGMSFrame.adcInterruptCount;

                // Send data to Applanix
				FADCDataPTG.setOGMSData(OGMSFrame);
				SendApplanixADCData();

                // Send data to in.exe
				FADCData.setOGMSData(OGMSFrame, FConvFactor);

#if SEND_PPS_TO_IN
                FADCData.fxSP1 = (short) FPPSDataPTG.userTime;
#endif
				if(!SendEM1ADCData())
                    Connection = cLost;
            } // ADC

            if(OGMSFrame.InterruptReason & 0x4) // PPS
            {
                if(DisplayCountersCB->Checked)
                    ppsInterrupt->Caption =	OGMSFrame.ppsInterruptCount;
#if SEND_GAGE_ON_PPS
				FADCDataPTG.setOGMSData(OGMSFrame);
                SendApplanixADCData();
#endif
				FPPSDataPTG.setOGMSData(OGMSFrame);
                SendApplanixPPSData();
            } // PPS
        }

        // Update screen ...
#ifndef _DEBUG
        static unsigned refresh=0;
        if((++refresh % 7) == 0)
#endif
        {
            DisplayWorkPage();
        }
	}
	__finally
	{
		inProcess = false;
	}

}
//---------------------------------------------------------------------------


void __fastcall
TMainForm::FormClose(TObject *Sender, TCloseAction &Action)
{
	int answer;
	if (FLogFile) // 3/25/15
	{
		fclose(FLogFile);
		FLogFile = 0;
	}

	if(FReadyToSendData)
	{
//		MSG("Cannor Exit. Please Stop IN.EXE Server First.");
		MSG(PM(40));
		Action = caNone;
        return;
	}

    if(SaveBtn->Enabled)
    {
//		answer = Application->MessageBox("Do you want to save calibration data?", "Warning", MB_YESNOCANCEL);
        answer = Application->MessageBox(PM(44), PM(42), MB_YESNOCANCEL);
        switch(answer)
        {
            case IDYES:
                SaveCalibrationData();
                break;
            case IDNO:
                break;
            case IDCANCEL:
                Action = caNone;
                return;
        }
    }
	finishApplication();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::AppException(System::TObject *Sender, Sysutils::Exception *E)
{
	MSG(E->Message);
	Application->ProcessMessages();	// Network error could be here!
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::FormCreate(TObject *Sender)
{
	Application->OnException = AppException;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EM1ConnectionClientRead(TObject *Sender, TCustomWinSocket *Socket)
{
	int res;
	int nBytes;
	tykldGMS01Cfg *conf;
	static char buffer[4096];

	nBytes = Socket->ReceiveBuf(buffer, sizeof(buffer));	// Get Command first

	if(nBytes < 0)
		return;
	res = buffer[0]*100+buffer[1];

	switch (res)
	{
		case 166:	// FLUSH
			if(!SendACK(Socket))
				Connection = cLost;
			else
				FReadyToSendData = true;
			break;

		case 110:	// STOP
			FReadyToSendData = false;
			if(!SendACK(Socket))
				Connection = cLost;
			Sleep(300);
			Connection = cNotConnected;
			break;

		case 182:	// REVERSE
			if(!SendACK(Socket))
				Connection = cLost;
			else
			{
				FReadyToSendData = true;
				Connection = cReverse;
			}
			break;

		case 170:	// FORWARD
			if(!SendACK(Socket))
				Connection = cLost;
			else
			{
				FReadyToSendData = true;
				Connection = cForward;
			}
			break;

		case 299:	// SETUP -- get parameters
			if(!SendACK(Socket))
				Connection = cLost;
			else
			{
				FReadyToSendData = true;
				Connection = cSetup;
				conf = (tykldGMS01Cfg *)buffer;
				if(conf->iUnitType == 1)	// Metric
                {
					FConvFactor = 25.6;
//                    FConvFactor = 1.0;
				}
				else
					FConvFactor = 256.0/25.4;		// English/Stations
			}
			break;

		case 301:	// Prepare to send
			if(!SendACK(Socket))
				Connection = cLost;
			else
			{
				FReadyToSendData = true;
				triggerNiosMailbox(MEASURE_PARAMETER, COUNTER_RESET, 0);
				Sleep(100);
				Connection = cSending;
			}
			break;
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::SetConnection(enum enConnection connState)
{
	switch (connState)
	{
		case cNotConnected:
			FReadyToSendData = false;
            CalibrateBtn->Visible = true;

//			EM1ConnectionLabel->Caption="Not Connected";
			EM1ConnectionLabel->Caption = DM(1);
            EM1ConnectionLabel->Color = lcYellow;
			break;

		case cConnected:
//			EM1ConnectionLabel->Caption="Connected";
			EM1ConnectionLabel->Caption = DM(2);
			EM1ConnectionLabel->Color = lcGreen;
			missingADCInterrupts = 0;
			MissingADCDatabreaksEd->Text = missingADCInterrupts;
			missingPPSInterrupts = 0;
			MissingPPSDatabreaksEd->Text = missingADCInterrupts;
			break;

		case cLost:
            FReadyToSendData = false;
            CalibrateBtn->Visible = true;
//			EM1ConnectionLabel->Caption="Connection Lost";
			EM1ConnectionLabel->Caption = DM(3);
            EM1ConnectionLabel->Color = lcRed;
			break;

		case cForward:
//			EM1ConnectionLabel->Caption="Forward";
			EM1ConnectionLabel->Caption = DM(4);
			EM1ConnectionLabel->Color = lcGreen;
			break;

		case cReverse:
//			EM1ConnectionLabel->Caption="Reverse";
			EM1ConnectionLabel->Caption = DM(5);
			EM1ConnectionLabel->Color = lcGreen;
			break;

		case cSetup:
//			EM1ConnectionLabel->Caption="Setup";
			EM1ConnectionLabel->Caption = DM(6);
			EM1ConnectionLabel->Color = lcGreen;
			break;

		// Stop calibration with a brute force.
        // TODO: Deny connection when we in calibrate mode by setting up socket state            
		case cSending:
			StopPollingBtnClick(this);
			CalibrateBtn->Visible = false;
			CalibrationSheet->TabVisible = false;

//			EM1ConnectionLabel->Caption="Sending ...";
			EM1ConnectionLabel->Caption = DM(7);
			EM1ConnectionLabel->Color = lcGreen;
			break;
	}

	FConnection = connState;

	if(!ServerConnectionActive(EM1Connection))
	try
	{
		EM1Connection->Close();
		Sleep(1000);
		EM1Connection->Open();
	}
	catch(...)
	{
//		MSG("Cannot reconnect IN Server");
		MSG(PM(45));
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EM1ConnectionClientDisconnect(TObject *Sender,   TCustomWinSocket *Socket)
{
	Connection = cNotConnected;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EM1ConnectionClientError(TObject *Sender, TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
    Connection = cLost;
//	MSG(AnsiString(ErrorCode) + " : Socket Error");
	MSG(AnsiString(ErrorCode) + PM(50));
	ErrorCode = 0;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EM1ConnectionThreadEnd(TObject *Sender, TServerClientThread *Thread)
{
	Connection = cLost;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::SendApplanixADCData()
{
	if(Applanix320->Socket->Connected)
    {
        try
        {
            Applanix320->Socket->SendBuf((void *)&FADCDataPTG, sizeof(FADCDataPTG));
        }
        catch(...)
        {
        }
    }
    else
    {
#if DEBUG_APPLANIX
//		MSG("Writing to closed GAGE Socket");
		lastCode320 = lastCode320;	// Just to set up breakpoint
#endif
    }
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::SendApplanixPPSData()
{
	if(Applanix12->Socket->Connected)
    {
        try
        {
            Applanix12->Socket->SendBuf((void *)&FPPSDataPTG, sizeof(FPPSDataPTG));
        }
        catch(...)
        {
        }
    }
    else
    {
#if DEBUG_APPLANIX
//		MSG("Writing to closed PPS Socket");	// Doesn't like it here.
	lastCode12 = lastCode12;	// Just to set up breakpoint
#endif
    }
}
//---------------------------------------------------------------------------

bool __fastcall
TMainForm::SendEM1ADCData()
{
    TCustomWinSocket *Socket;
    DWORD Result;

	if(!ServerConnectionActive(EM1Connection))
	{
		// 4/20/15 -- In the event of pulses and server not being connected,
		// just fake 'success'.
		// Otherwise seting status to cLost causes problems with connections
		// later when in.exe is active and we need to connect.
		return true;
//		return false;
	}
	Socket = GetActiveSocket(EM1Connection);
    Result = ::SendDATA(Socket, &FADCData, sizeof(FADCData));
	// 6/23/10 -- back to condition when WSAEWOULDBLOCK means Error
    if(WSAEWOULDBLOCK == Result || Result == 0)
    	return false;
    else
    	return true;
}
//---------------------------------------------------------------------------

bool __fastcall
TMainForm::SendACK(TCustomWinSocket *Socket)
{
	bool Result=true;
    int res;
    static char buffer[sizeof(EM1ADCData)];

    if(0 == Socket)
    {
//		MSG("Using NULL socket");
		MSG(PM(51));
		return false;
	}

    buffer[0]='\x0';
    buffer[1]='\x0';
    buffer[2]='\x0';
    buffer[3]=(char)0x80;

    Swap16(buffer+4,0x0001);	// 1000 points

	res = Socket->SendBuf(buffer,sizeof(EM1ADCData));
    if(res != sizeof(EM1ADCData))
    {
//		MSG("Socket Send Error. Bytes Sent: " + AnsiString(res));
		MSG(PM(52) + AnsiString(res));
		Result = false;
	}
    Application->ProcessMessages();
    return Result;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EM1ConnectionClientConnect(TObject *Sender, TCustomWinSocket *Socket)
{
	Connection = cConnected;
	FFastHits = 0;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::ClearMessagesBtnClick(TObject *Sender)
{
	MsgMemo->Lines->Clear();
	ClearMessagesBtn->Visible = false;
	if(MsgPanel->Visible)
    {
		MsgPanel->Visible = false;
//    	MainForm->Height = MainForm->Height-MsgPanel->Height;
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix12Connect(TObject *Sender, TCustomWinSocket *Socket)
{
	static BOOL nodelay=1;
    setsockopt(Socket->SocketHandle, IPPROTO_TCP, TCP_NODELAY, (const char *)&nodelay,sizeof(nodelay));

//	PPSConnectionLabel->Caption="PPS Connected";
	PPSConnectionLabel->Caption=DM(13);
	PPSConnectionLabel->Color = lcGreen;

	TLinger lin;
	lin.l_onoff = 0;
	lin.l_linger = 0;
	setsockopt(Socket->SocketHandle, SOL_SOCKET, SO_LINGER, (const char *)&lin, sizeof(lin));
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix12Disconnect(TObject *Sender,TCustomWinSocket *Socket)
{
#if DEBUG_APPLANIX
	MSG(PM(70));	//
#endif
	PPSConnectionLabel->Caption=DM(14);	// "PPS Disconnected";
	lastCode12 = 0;
	PPSConnectionLabel->Color = lcYellow;

#if TIMER_RECONNECT
	PPSTimer->Enabled = true;
#else
	ConnectPPS();
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix12Error(TObject *Sender, TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
	switch(ErrorCode)
    {
    	case WSAHOST_NOT_FOUND:
			if(lastCode12 != ErrorCode)
				MSG(PM(71)); // "Host \"Applanix1\" not found. Check \"HOST\" file"
			lastCode12 = ErrorCode;
			ErrorCode = 0;
			break;

        case WSAENETUNREACH:	// Applanix is off, 10051
		case WSAECONNABORTED:	// When Applanix is down, 10053
			PPSConnectionLabel->Caption=DM(14);	// "PPS Disconnected"
			PPSConnectionLabel->Color = lcYellow;
			ErrorCode = 0;
        	break;

		case WSAEHOSTUNREACH:	// Applanix not listening
		case WSAECONNREFUSED:	// Applanix actively refuses connection
		case WSAETIMEDOUT:		// 4/3/12 do not close the connection

			if(lastCode12 != ErrorCode && PPSConnectionLabel->Color == lcGreen)
			{
#ifdef _DEBUG
				sprintf(mess_buffer,PM(72),ErrorCode); // "PPS Error Code %d"
				MSG(mess_buffer);
#endif
			}

			Applanix12->Close();
			lastCode12 = ErrorCode;
			PPSConnectionLabel->Caption=DM(14);	// "PPS Disconnected"
			PPSConnectionLabel->Color = lcYellow;
			ErrorCode = 0;
        	break;

		case WSAEADDRNOTAVAIL:
        	if(SimulationLevel == SIM_APPLANIX || SimulationLevel == SIM_ALL_HARDWARE)
        		ErrorCode = 0;
        	break;
    }
#if TIMER_RECONNECT
	PPSTimer->Enabled = true;	// 11/23/10
#else
	ConnectPPS();
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix320Connect(TObject *Sender,TCustomWinSocket *Socket)
{
	static BOOL nodelay=1;
    setsockopt(Socket->SocketHandle, IPPROTO_TCP, TCP_NODELAY, (const char *)&nodelay,sizeof(nodelay));

	ADCConnectionLabel->Caption=DM(10);	// "GAGE Data Connected"
	ADCConnectionLabel->Color = lcGreen;

	TLinger lin;
	lin.l_onoff = 0;
	lin.l_linger = 0;
	setsockopt(Socket->SocketHandle, SOL_SOCKET, SO_LINGER, (const char *)&lin, sizeof(lin));
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix320Disconnect(TObject *Sender, TCustomWinSocket *Socket)
{
#if DEBUG_APPLANIX
	MSG(PM(73));	// "GAGE Connection Lost"
#endif
	lastCode320 = 0;
	ADCConnectionLabel->Caption=DM(11);	// "GAGE Data Disconnected"
	ADCConnectionLabel->Color = lcYellow;

#if TIMER_RECONNECT
   	ADCTimer->Enabled = true;	// 11/23/10
#else
	ConnectADC();
#endif
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::Applanix320Error(TObject *Sender,TCustomWinSocket *Socket, TErrorEvent ErrorEvent, int &ErrorCode)
{
	switch(ErrorCode)
	{
		case WSAHOST_NOT_FOUND:
			if(lastCode320 != ErrorCode)
				MSG(PM(74));	// "Host \"Applanix2\" not found. Check \"HOST\"
			lastCode320 = ErrorCode;
			ErrorCode = 0;
			break;

        case WSAENETUNREACH:	// Applanix is off, 10051
		case WSAECONNABORTED:	// When Applanix is down, 10053
			ADCConnectionLabel->Caption=DM(11);	// "GAGE Data Disconnected"
			ADCConnectionLabel->Color = lcYellow;
			ErrorCode = 0;
        	break;

		case WSAEHOSTUNREACH:	// Applanix nox listening
		case WSAECONNREFUSED:	// Applanix nox listening
		case WSAETIMEDOUT:
			if(lastCode320 != ErrorCode && ADCConnectionLabel->Color == lcGreen)
			{
#ifdef _DEBUG
				sprintf(mess_buffer,PM(75),ErrorCode);	// "GAGE Data Error Code %d"
				MSG(mess_buffer);
#endif
			}
			Applanix320->Close();
			lastCode320 = ErrorCode;
			ADCConnectionLabel->Caption=DM(11);	// "GAGE Data Disconnected"
			ADCConnectionLabel->Color = lcYellow;
			ErrorCode = 0;
			break;

		case WSAEADDRNOTAVAIL:
			if(SimulationLevel == SIM_APPLANIX || SimulationLevel == SIM_ALL_HARDWARE)
				ErrorCode = 0;
			break;
	}
#if TIMER_RECONNECT
	ADCTimer->Enabled = true;	// 11/23/10
#else
	ConnectADC();
#endif
}
//---------------------------------------------------------------------------

void
TMainForm::ConnectADC()
{
	if((SimulationLevel & SIM_APPLANIX) == SIM_APPLANIX)
    	return;
	if((SimulationLevel & SIM_APPLANIX) == SIM_APPLANIX_320)
    	return;
    if(ADCConnectionLabel->Color == lcYellow)
    {
        try
        {
            Applanix320->Open();
#if TIMER_RECONNECT
            ADCTimer->Enabled = false;	// 11/23/10
#endif
        }
        catch(...)
        {
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::ADCTimerTimer(TObject *Sender)
{
	ConnectADC();
}
//---------------------------------------------------------------------------

void
TMainForm::ConnectPPS()
{
	if((SimulationLevel & SIM_APPLANIX) == SIM_APPLANIX)
    	return;
	if((SimulationLevel & SIM_APPLANIX) == SIM_APPLANIX_12)
    	return;

	if(PPSConnectionLabel->Color == lcYellow) 	// Not yet connected
	{
		try
		{
    		Applanix12->Open();
#if TIMER_RECONNECT
			PPSTimer->Enabled = false;	// 11/23/10
#endif
    	}
    	catch(...)
        {
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::PPSTimerTimer(TObject *Sender)
{
	ConnectPPS();
}
//---------------------------------------------------------------------------


void __fastcall
TMainForm::SimulationTimerTimer(TObject *Sender)
{
	camera->NotifyThreadEvent();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::FormShow(TObject *Sender)
{
	EM1Connection->Open();
	FConvFactor = 25.6;
	if(SimulationLevel != SIM_ALL_HARDWARE)
		triggerNiosMailbox(MEASURE_PARAMETER, COUNTER_RESET, 0);
	Sleep(100);

#if TIMER_RECONNECT
	ADCTimer->Enabled = true;
	PPSTimer->Enabled = true;
#else
	ConnectADC();
	ConnectPPS();
#endif

	CalibrationSheet->TabVisible = false;

	DisplayChannels(1);
	CalChannel = 0;
	if(MakeNewCalibration)
	{
		MSG("Please Calibrate System");
		CalibrateBtnClick(this);
	}

}
//---------------------------------------------------------------------------


void TMainForm::SetEditMode(bool edit)
{
	if(edit)
    {
		Grid->Options >> goRowSelect;   // No Line
        Grid->Options << goEditing; 	// Disable editing
    }
    else
    {
        Grid->Options >> goEditing; 	// Disable editing
        Grid->Options << goRowSelect;   // Show line
    }
}
//---------------------------------------------------------------------------

void TMainForm::StartDataQuery()
{
    g_nPollCounter = 0;
    g_dVoltageSum = 0.0f;

    StartPollingBtn->Enabled = false;
    StopPollingBtn->Enabled = true;
    CalculateZeroBtn->Enabled = false;
    CalculateGainBtn->Enabled = false;
    EndCalibrationBtn->Enabled = false;
	EnableEditBtn->Enabled = false;

    if(EditLed->Value) // enabled editing
		EnableEditBtnClick(this);

	if(!ADTimer->Enabled)
    	ADTimer->Enabled = true;
}
//---------------------------------------------------------------------------

void TMainForm::StopDataQuery()
{
	if(ADTimer->Enabled)
    	ADTimer->Enabled = false;

    FLoops = 0;

    StartPollingBtn->Enabled = true;
    StopPollingBtn->Enabled = false;
    CalculateZeroBtn->Enabled = true;
    CalculateGainBtn->Enabled = true;
	EndCalibrationBtn->Enabled = true;
	EnableEditBtn->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::QueryBtnClick(TObject *Sender)
{
	ADTimer->Enabled = !ADTimer->Enabled;

	if(ADTimer->Enabled)
		StartDataQuery();
	else
		StopDataQuery();
}
//---------------------------------------------------------------------------

void TMainForm::ReCalculateGain()
{
    float dVoltageMean;
    float dDesiredGain;

    bCalculateGain = false;
    dVoltageMean = g_dVoltageSum / g_nPollCounter;

    if(fabs(dVoltageMean)<0.1)
    {
//    	MSG("Inadequate feeler displacement");
    	MSG(PM(46));
    }
    else
    {
    	dDesiredGain = fabs( ( g_dDesiredUnits * ( g_Input[ CalChannel ].UnitsPerVolt / dVoltageMean ) ) );

    	g_Input[ CalChannel ].gain = dDesiredGain;
    	g_Input[ CalChannel ].LastCalDate = sys_date( );
//    	g_Input[ CalChannel ].LastCalTime = sys_time( );
	}

	AdjustInputs(); // see what is the result
	DisplayChannels(1);
	SaveBtn->Enabled = DirtyCalibratedData();
}
//---------------------------------------------------------------------------

void TMainForm::ReCalculateZero()
{
    float dVoltageMean;

    bCalculateZero = false;
    dVoltageMean = g_dVoltageSum / g_nPollCounter;


	g_Input[ CalChannel ].LastCalDate = sys_date( );
//	g_Input[ CalChannel ].LastCalTime = sys_time( );

	g_Input[ CalChannel ].zero = dVoltageMean;

	AdjustInputs(); // see what is the result
	DisplayChannels(1);
    SaveBtn->Enabled = DirtyCalibratedData();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::ADTimerTimer(TObject *Sender)
{
	if(FLoops > 0) 		// We make zero or gain calibration
    	FLoops--;
    else if(FLoops==0)	// End of calibration
    {
        if(bCalculateZero)
        	ReCalculateZero();
    	if(bCalculateGain)
        	ReCalculateGain();
    	StopPollingBtnClick(this);
    }
    // FLoops with -1 : continuous reading
	DisplayChannels(0); // Voltage only
}
//---------------------------------------------------------------------------

void TMainForm::DisplayChannels(int section)
{
	// section:
	// 0-data channel only
	// 1-all
	int nChannel;
	char b[132];
	float	dPolarity;


	// Read channels first
	// Rechnically I can read channels one more time in addition to GotCamera

	g_nPollCounter++;

	ReadChannels();
	AdjustInputs();

	// Display channels
	for( nChannel = 1 ; nChannel < maxChannels ; nChannel++ )
	{
		if(CalChannel == nChannel)
		{
			dPolarity = g_Input[ nChannel ].polarity == _NEGATIVE_ ? -1.0f : 1.0f;
			g_dVoltageSum +=  getVolts(g_nRVolts[nChannel]) * dPolarity;
		}

		if(section==0)
		{
			if(bCalculateGain || bCalculateZero) // update only one line on calculations)
			{
				if(CalChannel == nChannel)
				{
					sprintf(b,"%.3f",getVolts(g_nRVolts[ nChannel]));
					Grid->Cells[3][nChannel] = b;
				}
			}
			else
			{
				sprintf(b,"%.3f",g_dRVolts[ nChannel] );
				Grid->Cells[3][nChannel] = b;

				sprintf(b,"%.3f",g_dCVolts[ nChannel ]);
				Grid->Cells[7][nChannel] = b;

				sprintf(b,"%.3f",g_Gages[ nChannel ]/* + g_pConfigs->StandardGage*/);
				Grid->Cells[8][nChannel] = b;
			}
		}
		else
		{
			// [C][R]
			Grid->Cells[0][nChannel] = nChannel;
			Grid->Cells[1][nChannel] = g_Input[ nChannel ].polarity == _NEGATIVE_ ? '-' : '+';;
			Grid->Cells[2][nChannel] = g_Input[ nChannel ].name;

			sprintf(b,"%.3f",g_dRVolts[ nChannel ] );
			Grid->Cells[3][nChannel] = b;

            sprintf(b,"%.3f",g_Input[ nChannel ].zero);
			Grid->Cells[4][nChannel] = b;

            sprintf(b,"%.3f",g_Input[ nChannel ].gain);
			Grid->Cells[5][nChannel] = b;

			sprintf(b,"%.3f",g_Input[ nChannel ].UnitsPerVolt);
			Grid->Cells[6][nChannel] = b;

			sprintf(b,"%.3f",g_dCVolts[ nChannel ]);
			Grid->Cells[7][nChannel] = b;

			if(g_Input[ nChannel ].UnitsPerVolt)
			{
				sprintf(b,"%.3f",g_Gages[nChannel]);
				Grid->Cells[8][nChannel] = b;
			}
			else
				Grid->Cells[8][nChannel] = "";

			if(g_Input[ nChannel ].UnitsPerVolt)
			{
				sprintf(b,"%d",g_Input[ nChannel ].LastCalTime); // Zero Gage
				Grid->Cells[9][nChannel] = b;
			}
			else
				Grid->Cells[9][nChannel] = "";

			dtoc( b,g_Input[ nChannel ].LastCalDate, TRUE  );
			if(b[0] == ' ')
				Grid->Cells[10][nChannel] = DM(35);//"N/A";
			else
				Grid->Cells[10][nChannel] = b;
		}
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::GridCellValidate(TObject *Sender, int ACol, int ARow, AnsiString &Value, bool &Valid)
{
	switch(ACol)
    {
    	case 1:
        	if(Value == "+")
            	g_Input[ ARow/*-1*/ ].polarity = _POSITIVE_;
            else if(Value == "-")
				g_Input[ ARow/*-1*/ ].polarity = _NEGATIVE_;
            else
            	Valid=false;
			break;

		case 2:
			strncpy(g_Input[ ARow/*-1*/ ].name,Value.c_str(),sizeof(g_Input[ ARow/*-1*/ ].name)-1);
			break;

		case 4:
			g_Input[ ARow/*-1*/ ].zero = Value.ToDouble();
            // Adjust zero by hand
			g_Input[ ARow/*-1*/ ].LastCalDate = sys_date( );
			break;

		case 5:
			// Adjust gain by hand
			g_Input[ ARow/*-1*/ ].gain = Value.ToDouble();
			g_Input[ ARow/*-1*/ ].LastCalDate = sys_date( );
			break;

		case 6:
			g_Input[ ARow/*-1*/ ].UnitsPerVolt = Value.ToDouble();
			break;
	}


	SaveBtn->Enabled = DirtyCalibratedData(); // Strictly speaking we can think that conf has been changed
}
//---------------------------------------------------------------------------


void __fastcall
TMainForm::GridGetEditorProp(TObject *Sender, int ACol, int ARow, TEditLink *AEditLink)
{
	TAdvEdit *edit;

	edit = dynamic_cast<TAdvEdit *>(AEditLink->GetEditControl());

    switch(ACol)
    {
    	case 1: // Plus/Minus
			edit->EditType = Advedit::etString;
			edit->LengthLimit = 1;
        	break;
        case 2:	// Name
			edit->EditType = Advedit::etString;
//			edit->LengthLimit = sizeof(FConfigs.calcs[0].name)-1;
			break;
		case 3: // Get volts, no edit
        	break;
    	case 4:
        case 5:
        case 6:
			edit->EditType = Advedit::etFloat;
			edit->Precision = 3;
			edit->Signed = true;
			break;
		case 7:	// Cannot edit
		case 8: // Cannot edit
		case 9: // Date
		case 10: // Time
        	break;
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::GridGetEditorType(TObject *Sender, int ACol, int ARow, TEditorType &AEditor)
{
    switch(ACol)
    {
    	case 4:
        case 5:
        case 6:
            Grid->EditLink=AdvEditEditLink;
            AEditor=edCustom;
			break;
    }
}
//---------------------------------------------------------------------------


// Can use single control. But it is propietary

void __fastcall
TMainForm::GridSelectCell(TObject *Sender, int ACol,   int ARow, bool &CanSelect)
{
	//
	// Save last click for SelectRows when we return from direct edit mode.
    //
	XRow = ARow;
	CalChannel = ARow-1;

    if(ACol == 3)
    {
        if(EditLed->Value)
            CanSelect = false;
        XCol = 2;
    }
    if(ACol >= 7)
    {
        if(EditLed->Value)
            CanSelect = false;
        XCol = 6;
    }
}
//---------------------------------------------------------------------------


void __fastcall
TMainForm::CalibrateBtnClick(TObject *Sender)
{
	CalibrationSheet->TabVisible = true;
    MainControl->ActivePage = CalibrationSheet;
	MeasurementSheet->TabVisible = false;
}
//---------------------------------------------------------------------------


void __fastcall
TMainForm::EndCalibrationBtnClick(TObject *Sender)
{
	StopDataQuery();

    MainControl->ActivePage = MeasurementSheet;
	CalibrationSheet->TabVisible = false;
    MeasurementSheet->TabVisible = true;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::StartPollingBtnClick(TObject *Sender)
{
	ADTimer->Enabled = true;
    if(FLoops == 0)
		FLoops = -1;
	StartDataQuery();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::StopPollingBtnClick(TObject *Sender)
{
	ADTimer->Enabled = false;
	StopDataQuery();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::EnableEditBtnClick(TObject *Sender)
{
	EditLed->Value = !EditLed->Value;
    if(!EditLed->Value)
    	Grid->SelectRows(XRow,1);
    else
    	Grid->SelectRange(XCol, XCol, XRow, XRow);

	SetEditMode(EditLed->Value);
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::CalculateGainBtnClick(TObject *Sender)
{
	/* What this parameter means. Can I use it for  Zero Gage? */
	g_dDesiredUnits = g_Input[ CalChannel ].BlockSize;
/*
	CalculateGainForm->DesiredUnitsEd->Text = g_dDesiredUnits;
	CalculateGainForm->ShowModal();
	if(g_dDesiredUnits > -999.0f)
	{
		FLoops = 10;
		bCalculateGain = true;
		StartPollingBtnClick(this);
	}
*/	
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::CalculateZeroBtnClick(TObject *Sender)
{
/*
	Can use this logic to get data for min/max gages
	FLoops = 10;
	bCalculateZero = true;
	StartPollingBtnClick(this);
*/
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::MainControlChanging(TObject *Sender, bool &AllowChange)
{
	if(MainControl->ActivePage == CalibrationSheet && ADTimer->Enabled)
	{
    	AllowChange = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::SaveBtnClick(TObject *Sender)
{
	SaveCalibrationData();
	SaveBtn->Enabled = DirtyCalibratedData();
}
//---------------------------------------------------------------------------

char vbuffer[32];

void __fastcall
TMainForm::RetractAxleBtnClick(TObject *Sender)
{
	if(SimulationLevel != SIM_ALL_HARDWARE)
	{
		ReadChannels();
		// AdjustInputs(); No need to adjust, need raw voltage value.

		if(FrontSide->Checked)	// Get "Raw" voltage
			minVolts = g_dRVolts[2];
		else
			minVolts = g_dRVolts[4];
	}
	else
	{
		if(FrontSide->Checked)
			minVolts = -0.542;
		else
			minVolts = -0.72;
	}
	sprintf(vbuffer,"Volts = %.2f",minVolts);

	RetractAxleLab->Caption =  vbuffer;
	//
//	RetractAxleBtn->Enabled = false;
//	ExtractAxleBtn->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::ExtractAxleBtnClick(TObject *Sender)
{
	if(SimulationLevel != SIM_ALL_HARDWARE)
	{
		if(FrontSide->Checked)
			maxVolts = g_dRVolts[2];
		else
			maxVolts = g_dRVolts[4];
	}
	else
	{
		if(FrontSide->Checked)
			maxVolts = 5.48;
		else
			maxVolts = 5.334;
	}

	sprintf(vbuffer,"Volts = %.2f",maxVolts);
	ExtractAxleLab->Caption = vbuffer;

//	ExtractAxleBtn->Enabled = false;
//	DifferenceInMMBtn->Enabled = true;
//	DiffInMMEd->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::DifferenceInMMBtnClick(TObject *Sender)
{
	double mmDiff;
	mmDiff = DiffInMMEd->Text.ToDouble();
	if(mmDiff>=10)
	{
		VoltsPerMMLab->Caption = mmDiff;

//		DifferenceInMMBtn->Enabled = false;
//		DiffInMMEd->Enabled = false;

//		GageOnAxleBtn->Enabled = true;
//		GageOnTrackMMEd->Enabled = true;

		voltsPerMM = (maxVolts-minVolts)/mmDiff;
		sprintf(vbuffer,"Volts per mm = %.2f",voltsPerMM);
		VoltsPerMMLab->Caption = vbuffer;
	}
	else
	{
		VoltsPerMMLab->Caption = "Difference Too Small";
	}
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::GageOnAxleBtnClick(TObject *Sender)
{
	double currentGageVolts;
	int gageInMM;
	int offsetInMM;
	if(SimulationLevel != SIM_ALL_HARDWARE)
	{
		if(FrontSide->Checked)
			currentGageVolts = g_dRVolts[2];
		else
			currentGageVolts = g_dRVolts[4];
	}
	else
		currentGageVolts = 0.671;
	try
	{
		gageInMM = GageOnTrackMMEd->Text.ToInt();
		if(gageInMM<900)
			GageInMM->Caption = "Value Too Low";

	}
	catch(...)
	{
	}
	currentGageVolts -= minVolts; 			// correct with minimum value
	offsetInMM=currentGageVolts/voltsPerMM; //
	gageInMM = gageInMM - offsetInMM; 		// This is zero for gage.

	GageInMM->Caption = AnsiString("Zero Gage Set To: ")+gageInMM;
	if(FrontSide->Checked)
	{
		g_Input[ 1 ].UnitsPerVolt = 0;//voltsPerMM;
		g_Input[ 2 ].UnitsPerVolt = voltsPerMM;

		g_Input[ 1 ].LastCalTime=0;//gageInMM;	// will use date for
		g_Input[ 2 ].LastCalTime=gageInMM;	// will use date for

		g_Input[ 1 ].zero = minVolts;
		g_Input[ 2 ].zero = minVolts;
	}
	else
	{
		g_Input[ 3 ].UnitsPerVolt = 0;//voltsPerMM;
		g_Input[ 4 ].UnitsPerVolt = voltsPerMM;

		g_Input[ 3 ].LastCalTime=0;//gageInMM;	// will use date for
		g_Input[ 4 ].LastCalTime=gageInMM;	// will use date for

		g_Input[ 3 ].zero = minVolts;
		g_Input[ 4 ].zero = minVolts;
	}
	/*
		now we should take
		(v - v0)*gain/UnitsPerVolt + LastCalTime
	*/
	SaveBtn->Enabled = DirtyCalibratedData();
	DisplayChannels(-1);
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::FrontSideClick(TObject *Sender)
{
	SetCalibrationControls();
}
//---------------------------------------------------------------------------

void __fastcall
TMainForm::RearSideClick(TObject *Sender)
{
	SetCalibrationControls();
}
//---------------------------------------------------------------------------

