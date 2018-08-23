//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CalculateGain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "AdvEdit"
#pragma resource "*.dfm"

extern float g_dDesiredUnits;
TCalculateGainForm *CalculateGainForm;
//---------------------------------------------------------------------------
__fastcall TCalculateGainForm::TCalculateGainForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall
TCalculateGainForm::CancelGainClick(TObject *Sender)
{
	Close();
    g_dDesiredUnits = -999.9f;
}
//---------------------------------------------------------------------------
void __fastcall
TCalculateGainForm::OKGainClick(TObject *Sender)
{
	Close();
}
//---------------------------------------------------------------------------
void __fastcall
TCalculateGainForm::DesiredUnitsEdValueValidate(TObject *Sender, AnsiString value, bool &IsValid)
{
	g_dDesiredUnits = value.ToDouble();
}
//---------------------------------------------------------------------------
