#ifndef _EM1ADCData_h_
#define _EM1ADCData_h_

#pragma pack(push,2)
#	include "kldgms.h"
#pragma pack(pop)

#include "togms_data.h"

class EM1ADCData : public tykldOGMS01NET
{
public:
	EM1ADCData()
    {
    	ID = 3;
//    	setBadValues();
    }

    void setOGMSData(TOGMSData &OGMSFrame, double convFactor )
    {
    	// ID = 3;
    	setBadValues();

		dwBreak = OGMSFrame.adcInterruptCount;

		fxHGL1U = (short)(OGMSFrame.Channels[1] * convFactor + 0.5);
		fxHGL1F = (short)(OGMSFrame.Channels[1] * convFactor + 0.5);

		fxHGR1U = (short)(OGMSFrame.Channels[2] * convFactor + 0.5);
		fxHGR1F = (short)(OGMSFrame.Channels[2] * convFactor + 0.5);

		fxGAU1 = fxHGR1U+fxHGL1U;

		fxHGL2U = (short)(OGMSFrame.Channels[3] * convFactor + 0.5);
		fxHGL2F = (short)(OGMSFrame.Channels[3] * convFactor + 0.5);
		fxHGR2U = (short)(OGMSFrame.Channels[4] * convFactor + 0.5);
		fxHGR2F = (short)(OGMSFrame.Channels[4] * convFactor + 0.5);

		fxGAU2 = fxHGR2U+fxHGL2U;
	}
private:
	void setBadValues(void)
	{
		fxHGL1U = 0x8000;
		fxHGL1F = 0x8000;
		fxHGR1U = 0x8000;
		fxHGR1F = 0x8000;
		fxSP0 = 0x8000;
		fxGAU1 = 0x8000;
		fxSP1 = 0x8000;
		fxSP2 = 0x8000;
		fxSP3 = 0x8000;
		fxSP4 = 0x8000;
		fxSP5 = 0x8000;
		fxSP6 = 0x8000;
		fxHGL2U = 0x8000;
		fxHGL2F = 0x8000;
		fxHGR2U = 0x8000;
		fxHGR2F = 0x8000;
		fxSP7 = 0x8000;
		fxGAU2 = 0x8000;
	}
};

#endif
