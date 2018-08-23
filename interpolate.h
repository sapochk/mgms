/* interpolate.h
 * Lori (Sunshyne) Pickering, July 22, 2004.
 * The numa_lib documentation contains more information about this class.
 */

#ifndef INTERPOLATE_H
#define INTERPOLATE_H

class interpolate{
  private:
	double** pts; //input data; x,f(x), f'(x)-optional
	int m;//number of data points
	int n; //number of data points minus one
	double** retTab; //return table obtained from approximating function
  public:
	interpolate(double** data, int numPts): pts(data), m(numPts)
		{retTab = 0; n = m - 1;}
	double** returnSequence(){return retTab;}

	double Neville(double x /*approximation point*/, 
			bool retSeq = false /*return table of approximations?-optional*/);
	double* Hermite(double* der /*derivatives--if not included in pts*/,
			bool retSeq /*return table of approximations?-optional*/);
	double* Hermite(double* der = 0 /*derivatives--if not included in pts*/);
	double* Hermite(bool retSeq /*return table of approximations?-optional*/);
	double** freeCubicSpline(); 
};

#endif

/********************************************************************************************
Hermite:
  The return pointer q for this function contains the coefficients for the Hermite polynomial
  H(x) = q[0] + q[1]*(x-x[0]) + q[2]*(x-x[0])^2 + q[3]*(x-x[0])^2*(x-x[1]) 
         + q[4]*(x-x[0])^2*(x-x[1])^2 + ...
         + q[2*n-1]*(x-x[0])^2*(x-x[1])^2*...*(x-x[n-2])^2*(x-x[n-1])^2
  where n = number of data points.

freeCubicSpline:
  The return matrix for this function contains the coefficients a[i], b[i], c[i], and d[i]
  for the cubic spline polynomial
  S(x) = S[i](x) = a[i] + b[i]*(x-x[i]) + c[i]*(x-x[i])^2 + d[i]*(x-x[i])^3
  for x[i] <= x <= x[i+1], where i = 0, 1, ... , N and N-1 = n = number of data points. 
*********************************************************************************************/