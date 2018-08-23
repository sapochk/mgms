/*
	$Log$
*/

#ifndef MgmsWinH
#define MgmsWinH

#include "AdvSplitter.hpp"
#include "AdvPanel.hpp"
#include <Buttons.hpp>
#include <Classes.hpp>
#include <ComCtrls.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <ExtCtrls.hpp>

#include "AdvEdit.hpp"
#include "AdvSpin.hpp"
#include <Mask.hpp>
#include "LED.hpp"
#include <ScktComp.hpp>
#include <NMUDP.hpp>
#include "AdvGrid.hpp"
#include "BaseGrid.hpp"
#include <Grids.hpp>
#include "AsgLinks.hpp"
#include "ALed.hpp"
#include <ImgList.hpp>
#include <ToolWin.hpp>
#include "TransBtn.hpp"
#include "AppEvent.hpp"

//---------------------------------------------------------------------------
#include <string>
using namespace std;

#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>

#include "Defs.h"

#include "PlasserNet.h"
#include "togms_data.h"
#include "PPSData.h"
#include "ADCData.h"
#include "EM1ADCData.h"
#include "CommandStrings.h"
#include "CameraComponent.h"

#include "MgmsMessages.h"

#include "AggsIoCls.h"
#include "aggs_5000.h"

enum enConnection  {cNotConnected, cConnected, cForward, cReverse, cSetup, cSending, cLost};


//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TServerSocket *EM1Connection;
	TClientSocket *Applanix12;
	TClientSocket *Applanix320;
	TTimer *ADCTimer;
	TTimer *PPSTimer;
	TTimer *SimulationTimer;
	TPageControl *MainControl;
	TTabSheet *MeasurementSheet;
	TTabSheet *CalibrationSheet;
	TPanel *MsgPanel;
	TMemo *MsgMemo;
	TPanel *FrontPanel;
	TGroupBox *LGageBox1;
	TAdvEdit *LFilteredGage;
	TAdvEdit *LInstantGage;
	TGroupBox *GageBox1;
	TAdvEdit *TotalGage0;
	TGroupBox *RGageBox1;
	TAdvEdit *RFilteredGage;
	TAdvEdit *RInstantGage;
	TPanel *RearPanel;
	TGroupBox *LGageBox2;
	TAdvEdit *LFilteredGage1;
	TAdvEdit *LInstantGage1;
	TGroupBox *GageBox2;
	TAdvEdit *TotalGage1;
	TGroupBox *RGageBox2;
	TAdvEdit *RFilteredGage1;
	TAdvEdit *RInstantGage1;
	TPanel *StatusPanel;
	TGroupBox *EM1ConnectionBox;
	TLEDLabel *EM1ConnectionLabel;
	TButton *ClearMessagesBtn;
	TGroupBox *ApplanixConnectionBox;
	TLEDLabel *ADCConnectionLabel;
	TLEDLabel *PPSConnectionLabel;
	TGroupBox *adcDataBreaksBox;
	TLabel *adcInterrupt;
	TAdvEdit *MissingADCDatabreaksEd;
	TGroupBox *ppsDataBreakBox;
	TLabel *ppsInterrupt;
	TAdvEdit *MissingPPSDatabreaksEd;
	TGroupBox *DisplayDataBox;
	TCheckBox *DisplayCountersCB;
	TTimer *ADTimer;
	TPanel *CalibrationControlPanel;
	TAdvEditEditLink *AdvEditEditLink;
	TButton *CalibrateBtn;
	TButton *EndCalibrationBtn;
	TToolBar *CalibrateToolBar;
	TToolButton *SaveBtn;
	TToolButton *ToolButton2;
	TToolButton *ReadBtn;
	TToolButton *ToolButton4;
	TToolButton *ToolButton5;
	TToolButton *ToolButton6;
	TToolButton *CalculateZeroBtn;
	TImageList *ToolIcons;
	TToolButton *ToolButton8;
	TToolButton *ToolButton9;
	TToolButton *ToolButton10;
	TToolButton *CalculateGainBtn;
	TToolButton *ToolButton12;
	TToolButton *StartPollingBtn;
	TToolButton *ToolButton14;
	TToolButton *StopPollingBtn;
	TToolButton *ToolButton16;
	TToolButton *EnableEditBtn;
	TToolButton *ToolButton18;
	TToolButton *ToolButton19;
	TToolButton *ToolButton20;
	TToolButton *ToolButton21;
	TALed *EditLed;
	TPanel *GridPanel;
	TAdvStringGrid *Grid;
	TPanel *Panel2;
	TTransparentButton *RetractAxleBtn;
	TTransparentButton *ExtractAxleBtn;
	TTransparentButton *DifferenceInMMBtn;
	TAdvEdit *DiffInMMEd;
	TTransparentButton *GageOnAxleBtn;
	TStaticText *RetractAxleLab;
	TStaticText *ExtractAxleLab;
	TAdvEdit *GageOnTrackMMEd;
	TStaticText *VoltsPerMMLab;
	TRadioButton *FrontSide;
	TRadioButton *RearSide;
	TStaticText *GageInMM;
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall EM1ConnectionClientRead(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall EM1ConnectionClientDisconnect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall EM1ConnectionClientError(TObject *Sender,
          TCustomWinSocket *Socket, TErrorEvent ErrorEvent,
          int &ErrorCode);
	void __fastcall EM1ConnectionThreadEnd(TObject *Sender,
          TServerClientThread *Thread);
	void __fastcall EM1ConnectionClientConnect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall ClearMessagesBtnClick(TObject *Sender);
	void __fastcall Applanix12Connect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall Applanix320Connect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall Applanix320Disconnect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall Applanix12Disconnect(TObject *Sender,
          TCustomWinSocket *Socket);
	void __fastcall Applanix320Error(TObject *Sender,
          TCustomWinSocket *Socket, TErrorEvent ErrorEvent,
          int &ErrorCode);
	void __fastcall Applanix12Error(TObject *Sender, TCustomWinSocket *Socket,
          TErrorEvent ErrorEvent, int &ErrorCode);
	void __fastcall ADCTimerTimer(TObject *Sender);
	void __fastcall PPSTimerTimer(TObject *Sender);
	void __fastcall SimulationTimerTimer(TObject *Sender);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall ADTimerTimer(TObject *Sender);
	void __fastcall QueryBtnClick(TObject *Sender);
	void __fastcall GridGetEditorProp(TObject *Sender, int ACol, int ARow,
          TEditLink *AEditLink);
	void __fastcall GridGetEditorType(TObject *Sender, int ACol, int ARow,
          TEditorType &AEditor);
	void __fastcall GridSelectCell(TObject *Sender, int ACol, int ARow,
          bool &CanSelect);
	void __fastcall CalibrateBtnClick(TObject *Sender);
	void __fastcall EndCalibrationBtnClick(TObject *Sender);
	void __fastcall StartPollingBtnClick(TObject *Sender);
	void __fastcall StopPollingBtnClick(TObject *Sender);
	void __fastcall EnableEditBtnClick(TObject *Sender);
	void __fastcall CalculateGainBtnClick(TObject *Sender);
	void __fastcall CalculateZeroBtnClick(TObject *Sender);
	void __fastcall GridCellValidate(TObject *Sender, int ACol, int ARow,
          AnsiString &Value, bool &Valid);
	void __fastcall MainControlChanging(TObject *Sender, bool &AllowChange);
	void __fastcall SaveBtnClick(TObject *Sender);
	void __fastcall RetractAxleBtnClick(TObject *Sender);
	void __fastcall ExtractAxleBtnClick(TObject *Sender);
	void __fastcall DifferenceInMMBtnClick(TObject *Sender);
	void __fastcall GageOnAxleBtnClick(TObject *Sender);
	void __fastcall FrontSideClick(TObject *Sender);
	void __fastcall RearSideClick(TObject *Sender);
private:	// User declarations
	TCameraComponent		*camera;
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);

	void __fastcall MSG(AnsiString msg);
	void __fastcall MSG(const char *msg);
	void __fastcall MSG(string msg);

	void __fastcall initApplication();
	void __fastcall finishApplication();
	void __fastcall initControls();

	void __fastcall CreateThreads();
	void __fastcall GotCamera(TObject *, PVOID data);
	void __fastcall DisplayWorkPage(void);
private:
    TAdvEdit	*FilteredGage[4];
    TAdvEdit	*InstantGage[4];
    TAdvEdit	*TotalGage[2];
private:
	void __fastcall AppException(System::TObject *Sender, Sysutils::Exception *E);
    void __fastcall SetConnection(enum enConnection connState);
	bool __fastcall SendACK(TCustomWinSocket *Socket);
	bool __fastcall SendEM1ADCData();
	int __fastcall GetDelay();
	void __fastcall SendApplanixADCData();
    void __fastcall SendApplanixPPSData();
	void PerformSimulate(unsigned short SimulationLevel);

    bool ReadConfigINI();
	void readConfigs();

	void ConnectADC();
	void ConnectPPS();
	void AssignTitles();
private:
    int 				FReadCount[2];
    long 				FAccCamera[2];
    long 				FAccGalvo[2];
    int 				FMaxReads;
    enum enConnection  	FConnection;
	unsigned long 		FPacketNumber;
    bool  				FReadyToSendData;
	double 				FConvFactor;

	TOGMSData 			OGMSFrame;
	EM1ADCData 			FADCData;
    TPPS            	FPPSDataPTG;
    TADC            	FADCDataPTG;
	long 				missingADCInterrupts;
	long 				missingPPSInterrupts;
    FILE				*FLogFile;
	int					FFastHits;
	TProgMessages		*Titles;
public:
    __property enum enConnection Connection = {read = FConnection, write = SetConnection};
public:
	void DisplayChannels(int section=1);
    void SetControlsOnCalibration();
    void ReCalculateGain();
    void ReCalculateZero();
    void StartDataQuery();
    void StopDataQuery();
	void SetEditMode(bool edit);
	void SaveCalibrationData();
	void SetCalibrationControls();
	void ReadChannels();
	void SimulateInputs();
	void CalculateGageForSubsystems(float	*Channels);


public:
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
