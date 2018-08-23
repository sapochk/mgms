#ifndef _camera_component_thread_h_
#define _camera_component_thread_h_

#include "togms_data.h"

#define READ_ON_THREAD	1	// if 1, make read as soon as possible

/*
	Bare bone include file for thread processing
*/

typedef void __fastcall (__closure *TDeviceNotification)(System::TObject* Sender, PVOID data);

class TCameraComponentThread : public TThread
{
protected:
	HANDLE  			event;
	TDeviceNotification packetNotify;
	TOGMSData 			data;
protected:
	virtual void __fastcall Execute(void);
	virtual void __fastcall Listen(void);
	virtual void __fastcall DoPacketNotify(void);
public:
	virtual __fastcall TCameraComponentThread(HANDLE pevent);
	DWORD GetCameraReading(TOGMSData &data);
	TOGMSData	*getOGMSData()
	{
		return &data;
	}
public:
	__property TDeviceNotification OnPacketReceived = {read=packetNotify, write=packetNotify};
};
#endif // _camera_component_thread_h_
 