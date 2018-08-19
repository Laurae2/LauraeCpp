#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double Rcpp_sumLp_num(Rcpp::NumericVector x, Rcpp::NumericVector nthread) {
  
  double sum = 0.0;
  int nthreads = nthread[0];
  
  #pragma omp parallel for shared(x) reduction(+:sum) num_threads(nthreads)
  for (int i = 0; i < x.size(); i++) {
    sum += x[i];
  }
    
  return sum;
}
