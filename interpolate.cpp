/* interpolate.cpp
 * Lori (Sunshyne) Pickering, July 29, 2004
 * The numa_lib documentation contains more information about this class.
 */

#include "interpolate.h"
#include "tridiagonalSolver.h"
#include <iostream>
#include <iomanip>
using std::setw;
using std::cout;

double interpolate::Neville(double x, bool retSeq/* = false */){
  double** q = new double*[n];
  for (int i = 0; i < n; i++)
    	q[i] = new double[i+1];
  q[0][0] = pts[0][1];
  for (int i = 1; i <= n-1; i++){
    q[i][0] = pts[i][1];
    for (int j = 1; j <= i; j++)
 	q[i][j] = ((x - pts[i-j][0])*q[i][j-1] - (x - pts[i][0])*q[i-1][j-1])/(pts[i][0] - pts[i-j][0]);
  }
  if (retSeq) retTab = q;
  return q[n-1][n-1];
}

double* interpolate::Hermite(double* der /*= 0*/){
  return interpolate::Hermite(der, false);
}

double* interpolate::Hermite(bool retSeq){
  return interpolate::Hermite(0, true);
}

double* interpolate::Hermite(double* der, bool retSeq){
  double** q = new double*[2*n+2];
  for (int i = 0; i <= 2*n+1; i++)
	q[i] = new double[i+1];
  if (der)
    for (int i = 0; i <= n; i++){
	q[2*i][0] = pts[i][1];
	q[2*i+1][0] = pts[i][1];
	q[2*i+1][1] = der[i];
    }
  else
    for (int i = 0; i <= n; i++){
	q[2*i][0] = pts[i][1];
	q[2*i+1][0] = pts[i][1];
	q[2*i+1][1] = pts[i][2];
    }
  for (int i = 1; i <= n; i++){
	q[2*i][1] = (q[2*i][0] - q[2*i-1][0])/(pts[i][0] - pts[i-1][0]);
}
  for (int i = 2; i <= 2*n+1; i++)
    for (int j = 2; j <= i; j++)
	q[i][j] = (q[i][j-1] - q[i-1][j-1])/(pts[i/2][0] - pts[(i-j)/2][0]);
  if (retSeq) retTab = q;
  double* coef = new double[2*n+2];
  for (int i = 0; i <= 2*n+1; i++)
	coef[i] = q[i][i];
  return coef;
}

double** interpolate::freeCubicSpline(){
  double* h = new double[n];
  for (int i = 0; i < n-1; i++)
	h[i] = pts[i+1][0] - pts[i][0];
  double** a = new double*[n];
  a[0] = new double[4];
  a[0][1] = 1;
  a[0][0] = a[0][2] = a[0][3] = 0;
  for (int i = 1; i <= n-1; i++){
	a[i] = new double[4];
	a[i][0] = h[i-1];
	a[i][1] = 2.0*(h[i-1] + h[i]);
	a[i][2] = h[i];
	a[i][3] = (3.0/h[i])*(pts[i+1][1] - pts[i][1]) - (3.0/h[i-1])*(pts[i][1] - pts[i-1][1]);
  }
  a[n-1] = new double[4];
  a[n-1][0] = a[n-1][2] = a[n-1][3] = 0;
  a[n-1][1] = 1;
  tridiagonalSolver sol(a, n);
  double* c = sol.solution();
  for (int i = n-1; i >= 0; i--){
	a[i][0] = pts[i][1];
 	a[i][1] = (pts[i+1][1] - pts[i][1])/h[i] - h[i]*(c[i+1] + 2.0*c[i])/3.0;
	a[i][2] = c[i];
	a[i][3] = (c[i+1] - c[i])/(3.0*h[i]);
  }
  return a;
}