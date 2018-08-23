//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#pragma package(smart_init)
#include "DeviceComponent.h"
//
// 10/8/04 K&O Delay vs unfinitive loop waiting for Alive to be false in Close().
//

//
// ValidCtrCheck is used to assure that the components created do not have
// any pure virtual functions.
//

__fastcall
TDeviceComponent::TDeviceComponent(TComponent* Owner, HANDLE pevent, THandle pmwhandle)
	: 	TComponent(Owner),
    	mwhandle(pmwhandle),
		thread(NULL),
	  	event(pevent)
{
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::Open()
{
	try
	{
		Init();		// setup HW parameters
	}
	catch(...)
	{
    	throw;	// rethrow exception
	}
	if(event == 0 || event == INVALID_HANDLE_VALUE)	// If we need special kind of event, create it outside
	{
		event = CreateEvent( 0, true, false, 0); // Default event to notify device
        if(event == INVALID_HANDLE_VALUE || event == 0)
        {
        	throw Exception("Cannot Create Event");
        }
	}
	SetupThread();	// Start the thread
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::SetupThread()
{
	thread = new TDeviceComponentThread(event, mwhandle);	// Create real thread in suspensed state
}
//---------------------------------------------------------------------------

__fastcall TDeviceComponent::
~TDeviceComponent()
{
	Close();
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::Close()
{
    if(thread)
    {
		thread->Terminate();	   // Signal the thread to terminate
		SetEvent(event);  // Signal event for HW to wake up the thread
        Sleep(100);
    	try
    	{
    		CloseHandle(event);
    	}
    	catch(...)
    	{
    	}
    }
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::Init()
{
	// Init the device, set up Device access members
}
//---------------------------------------------------------------------------

TDeviceNotification __fastcall
TDeviceComponent::getPacketReceived(void)
{
	if(thread)
    	return thread->OnPacketReceived;
    else return 0;
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::setPacketReceived(TDeviceNotification notify)
{
	if(thread)
    	thread->OnPacketReceived = notify;
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponent::NotifyThreadEvent()
{
	SetEvent(event);
}

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
// TDeviceComponentThread : TThread routines
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
__fastcall
TDeviceComponentThread::TDeviceComponentThread(HANDLE pevent, THandle pmwhandle)
	: 	TThread(true), // Create suspended to prepare HW if need
    	mwhandle(pmwhandle),
		event(pevent)
{
	FreeOnTerminate = false;
	Priority = tpHigher;
	Resume();
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponentThread::Execute()
{
	while(!Terminated)
    {
		Listen();
    }
}
//---------------------------------------------------------------------------

void __fastcall
TDeviceComponentThread::DoPacketNotify(void)
{
	if( packetNotify && !Terminated)
		packetNotify(this,NULL);        // pass data to the main window sync way
}
//---------------------------------------------------------------------------


void __fastcall
TDeviceComponentThread::Listen(void)
{
	DWORD status;

    /*
    	Function responsible for activating HW and, as a result, setting
        'event' after external processing finished,
        located in the TDeviceComponent.
    */
    status = WaitForSingleObject(event, INFINITE);
    if(status == WAIT_OBJECT_0)
    {
        if(mwhandle /* && IsWindow*/ /* && mwhandle != INVALID_HANDLE_VALUE*/ )
        {
            ; // PostMessage(mwhandle,....);
        }
        else
        {
            Synchronize(DoPacketNotify);	// Call main program
        }
	}
    else
    {
    	Terminate();
    }
    ResetEvent(event);
}
//---------------------------------------------------------------------------

