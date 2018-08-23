#ifndef _camera_thread_h_
#define _camera_thread_h_

#include <SysUtils.hpp>
#include <Controls.hpp>
#include <Classes.hpp>
#include <Forms.hpp>

#include "CameraComponentThread.h"

class PACKAGE TCameraComponent : public TComponent
{
protected:
	TCameraComponentThread *thread;  // holds the TThread derived class
	HANDLE					event;
protected:
	void __fastcall setPacketReceived(TDeviceNotification notify); // Set callback function
    TDeviceNotification __fastcall getPacketReceived(void);        //

protected:
	void SetupThread();
	void Init();	//	HW initialization, if any

public:
	DWORD GetCameraReading(TOGMSData &data);

	DWORD Start();
	DWORD Stop();
	DWORD SetDistanceEvent();
	char *GetDriverVersion();


    virtual __fastcall TCameraComponent(TComponent* Owner, HANDLE pevent=0);
	virtual __fastcall ~TCameraComponent();
	void Close();	//	HW shutdown
	void Open();  //  Logical open by user
	void __fastcall NotifyThreadEvent();

	TOGMSData*		getOGMSData() {return thread->getOGMSData();}
__published:
		// Callback function
	__property TDeviceNotification OnPacketReceived = {read=getPacketReceived, write=setPacketReceived};
};

//---------------------------------------------------------------------------
#endif


