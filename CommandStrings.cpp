//---------------------------------------------------------------------------
#include <vcl.h>
#include <locale>
#include <iostream>

#pragma hdrstop

#include "CommandStrings.h"

bool
IsParam(const AnsiString& param)
{
	//
	// Check do we have parameter `param' in the parameter list
	//
	int i;
	static AnsiString s;
	int nParam=ParamCount();

    for(i=1;i<=nParam;i++)
    {
        s = ParamStr(i);
        if(s.AnsiCompareIC(param) == 0)
            return true;
    }
	return false;
}

bool
IsParam(const AnsiString& param, AnsiString &Value)
{
	int i,j;
	static AnsiString paramValue;
    bool ok;
    bool valueReqiured;

	int nParam=ParamCount();

    for(i=1;i<=nParam;i++)
	{
		if(ParamStr(i)[1] == '-')	// Key
        {
        	ok = true;
            valueReqiured=false;

        	for(j=2;j<=ParamStr(i).Length(); j++)
            {
            	if(param.Length()<j)
                {
                	// check for -Lxxxx=yyyy
                    if(ParamStr(i)[j] == '=')
                    	valueReqiured = true;
                    else
                		ok = false;
                    break;
                }
            	else if(tolower(param[j]) != tolower(ParamStr(i)[j]))
                {
                	ok = false;
                    break;
                }
            }

            if(!ok)
            	continue;
            if(valueReqiured)
            {
            	try
                {
                	Value = ParamStr(i).SubString(j+1,ParamStr(i).Length());
                }
                catch(...)
                {
               		return true;	// No Value actual parameter supplied
                }
            }
            return true;
        }
	}
	return false;
}

//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
#pragma package(smart_init)
