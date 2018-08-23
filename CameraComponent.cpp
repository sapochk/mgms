/*
	$Revision$
	$Log$
*/

//---------------------------------------------------------------------------
#pragma hdrstop

#include "CameraComponent.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)

#define STATUS_INVALID_PARAMETER         (0xC000000DL)
#define STATUS_SUCCESS                   (0x00000000L)

__fastcall
TCameraComponent::TCameraComponent(TComponent* Owner, HANDLE pevent)
	: 	TComponent(Owner),
		thread(NULL),
	  	event(pevent)
{
	Open();
}
//---------------------------------------------------------------------------

void
TCameraComponent::Open()
{
	if(!event)
	{
		event = OpenEvent(EVENT_ALL_ACCESS,false,"MGMS_DATA");
		if(!event) // In program isn't working
		{
			event = CreateEvent( 0, true, false, "MGMS_DATA");
		}
		if(!event)
		{
			throw Exception("Cannot create MGMS event");
		}
	}
	SetupThread();	// Start the thread
}
//---------------------------------------------------------------------------

void
TCameraComponent::SetupThread()	// NB: User thread
{
	try
    {
		thread = new TCameraComponentThread(event);	// Create real thread in suspensed state
    }
    catch(...)
    {
    	throw;
    }
}
//---------------------------------------------------------------------------

__fastcall
TCameraComponent::~TCameraComponent()
{
	Close();
}
//---------------------------------------------------------------------------

void 
TCameraComponent::Close()
{
    if(thread)
    {
		thread->Terminate();	// Signal the thread to terminate
		SetEvent(event);  		// Signal event for HW to wake up the thread
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

TDeviceNotification __fastcall
TCameraComponent::getPacketReceived(void)
{
	if(thread)
    	return thread->OnPacketReceived;
    else return 0;
}
//---------------------------------------------------------------------------

void __fastcall
TCameraComponent::setPacketReceived(TDeviceNotification notify)
{
	if(thread)
    	thread->OnPacketReceived = notify;
}
//---------------------------------------------------------------------------

void __fastcall
TCameraComponent::NotifyThreadEvent()
{
	SetEvent(event);
}

DWORD
TCameraComponent::Start()
{
	return STATUS_SUCCESS;
}
//---------------------------------------------------------------------------

DWORD
TCameraComponent::Stop()
{
	return STATUS_SUCCESS;
}
//---------------------------------------------------------------------------

DWORD
TCameraComponent::GetCameraReading(TOGMSData &data)
{
/*
	Obtain data from the source - driver/shared VME memory
*/
	return STATUS_SUCCESS;
}
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

__fastcall
TCameraComponentThread::TCameraComponentThread(HANDLE pevent)
	: 	TThread(true), 			// Create suspended to prepare HW if need
		event(pevent)
{
	FreeOnTerminate = false;
	Priority = tpTimeCritical; // tpHigher;
	Resume();
}
//---------------------------------------------------------------------------

void __fastcall
TCameraComponentThread::DoPacketNotify(void)
{
	if( packetNotify && !Terminated)
	{
		try
		{
			packetNotify(this,0);
		}
		catch (...)
		{
		}			
    }
}
//---------------------------------------------------------------------------

void __fastcall
TCameraComponentThread::Execute()
{
	while(!Terminated)
	{
		Listen();
	}
}
//---------------------------------------------------------------------------

void __fastcall
TCameraComponentThread::Listen(void)	// Default processing, if we did
{
	DWORD status;
	status = WaitForSingleObject(event, INFINITE);
	if(status == WAIT_OBJECT_0)
	{
		GetCameraReading(data);
//		Synchronize(DoPacketNotify); // Safe way of syncronization
		DoPacketNotify();
		ResetEvent(event); // reset when finished

	}
	else
	{
		Terminate();
	}
}
//---------------------------------------------------------------------------

DWORD
TCameraComponentThread::GetCameraReading(TOGMSData &data)
{
	/*
		Read physical data from driver into data (sizeof(TOGMSData))
	*/
	return STATUS_SUCCESS;
}
//---------------------------------------------------------------------------


