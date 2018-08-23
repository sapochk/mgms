#ifndef _ADCData_h_
#define _ADCData_h_

#include "togms_data.h"

#pragma pack(push, 1)

class TADC	// NB fixed structure, DO NOT CHANGE
{
private:
public:
	char 			msgStart[4];
	unsigned short 	msgID;
	unsigned short 	count;
	unsigned short 	transactonNo;
	double			userTime;

	float			HGLeft1;
	float 			HGRight1;
	float			HGTotal1;
	float			HeightLeft1;
	float			HeightRight1;

	float			HGLeft2;
	float 			HGRight2;
	float			HGTotal2;
	float			HeightLeft2;
	float			HeightRight2;

	short			pad;
	unsigned short 	checksum;
	char			msgEnd[2];
public:
	int Count()
    {
    	return transactonNo;
    }
	double Time()
    {
    	return userTime;
    }

	void setBadValues()	// 10/14/10
	{
		HGTotal1 	= 9.0e9;
		HGTotal2 	= 9.0e9;

		HGRight1 	= 9.0e9;
		HGLeft1 	= 9.0e9;
		HGRight2 	= 9.0e9;
		HGLeft2 	= 9.0e9;
	}

	void setOGMSData(TOGMSData &data)
	{
		setBadValues();	// Back again

		HGLeft1 	= data.Channels[1];
		HGRight1 	= data.Channels[2];

		HGLeft2 	= data.Channels[3];
		HGRight2 	= data.Channels[4];

		HGTotal1 	= HGRight1+HGLeft1;
		HGTotal2 	= HGRight2+HGLeft2;

		transactonNo++;

		userTime = (double)data.adcTimeTotal.QuadPart/1000000.0;	// in mks=>secs
		calcChecksum();
	}

	TADC()
	{
		msgStart[0] = '$';
		msgStart[1] = 'M';
		msgStart[2] = 'S';
		msgStart[3] = 'G';
		userTime 	= 0.0;
		msgID 		= 320;
		count 		= 56;

		HeightLeft1 	= 9.0e9;
		HeightRight1 	= 9.0e9;
		HeightLeft2 	= 9.0e9;
		HeightRight2 	= 9.0e9;
		HGTotal1 		= 9.0e9;
		HGTotal2 		= 9.0e9;
		pad 			= 0;

		msgEnd[0] 	= '$';
		msgEnd[1] 	= '#';
	}
private:
#pragma warn -8027
	void calcChecksum()
	{
		checksum = 0;
		unsigned short *p;
		unsigned short sum=0;
		p = (unsigned short *)this;
		for(int i=0; i<32;i++)
			sum += p[i];
		checksum = ~sum+1;
	}
#pragma warn .8027
};
#pragma pack(pop)
#endif // _ADCData_h_

