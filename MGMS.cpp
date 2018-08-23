//---------------------------------------------------------------------------

#include <vcl.h>
#include "waggsio.h"
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("MGMSWin.cpp", MainForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
    	if(::OpenSemaphore(SEMAPHORE_ALL_ACCESS, FALSE, "MGMS"))
        	return 0;
    	::CreateSemaphore(NULL, 0, 1, "MGMS");
		Application->Initialize();
		Application->CreateForm(__classid(TMainForm), &MainForm);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------


