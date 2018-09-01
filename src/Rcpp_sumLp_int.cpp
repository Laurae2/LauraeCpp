#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int Rcpp_sumLp_int(Rcpp::IntegerVector x, int nthread) {
  
  int sum = 0.0;
  
  #pragma omp parallel for shared(x) reduction(+:sum) num_threads(nthread)
  for (R_xlen_t i = 0; i < x.size(); i++) {
    sum += x[i];
  }
    
  return sum;
}
