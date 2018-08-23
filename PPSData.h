#ifndef _PPSData_h_
#define _PPSData_h_
#pragma pack(push, 1)
class TPPS
{
public:
	char 			msgStart[4];
    unsigned short 	msgID;
    unsigned short 	count;
    unsigned short 	transactonNo;
    double			userTime;
    double 			userTimeConversion;
    short			pad;
    unsigned short 	checksum;
    char			msgEnd[2];
public:
    int Count() {return transactonNo;}
    double Time() {return userTime;}

	void setOGMSData(TOGMSData &data)
    {
    	userTime = (double)data.ppsTimeTotal.QuadPart/1000000.0;	// in mks=>secs
        transactonNo++;
        calcChecksum();
    }

	TPPS()
    {
        msgStart[0] = '$';
        msgStart[1] = 'M';
        msgStart[2] = 'S';
        msgStart[3] = 'G';

        msgID = 12;
        count = 24;
        userTime = 0.0;
        userTimeConversion = 1.0;
        transactonNo = 0;
        msgEnd[0] = '$';
        msgEnd[1] = '#';
    }
private:
#pragma warn -8027
    void calcChecksum()
	{
    	checksum = 0;
        unsigned short *p;
        unsigned short sum=0;
        p = (unsigned short *)this;
    	for(int i=0; i<16;i++)
        	sum += p[i];
		checksum = ~sum+1;
    }
#pragma warn .8027
};
#pragma pack(pop)
#endif // _PPSData_h_
