//---------------------------------------------------------------------------

#ifndef CalculateGainH
#define CalculateGainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "AdvEdit.hpp"
//---------------------------------------------------------------------------
class TCalculateGainForm : public TForm
{
__published:	// IDE-managed Components
	TAdvEdit *DesiredUnitsEd;
	TButton *OKGain;
	TButton *CancelGain;
	void __fastcall CancelGainClick(TObject *Sender);
	void __fastcall OKGainClick(TObject *Sender);
	void __fastcall DesiredUnitsEdValueValidate(TObject *Sender,
          AnsiString value, bool &IsValid);
private:	// User declarations
public:		// User declarations
	__fastcall TCalculateGainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCalculateGainForm *CalculateGainForm;
//---------------------------------------------------------------------------
#endif
