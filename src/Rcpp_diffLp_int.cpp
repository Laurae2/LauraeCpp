#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
Rcpp::IntegerVector Rcpp_diffLp_int(Rcpp::IntegerVector x, int lag, int differences, int nthread) {
  
  if (differences == 1) {
    
    R_xlen_t max_size = x.size() - lag;
	R_xlen_t i = 0;
    Rcpp::IntegerVector y(max_size);
    #pragma omp parallel for shared(x, y) num_threads(nthread)
    for (i = 0; i < max_size; i++) {
      y[i] = x[i + lag] - x[i];
    }
    
    return y;

  } else {
  
    R_xlen_t max_size = x.size() - lag;
    Rcpp::IntegerVector y(max_size);
    R_xlen_t i = 0;
    R_xlen_t j = 0;
    
    #pragma omp parallel for shared(x, y) num_threads(nthread)
    for (i = 0; i < max_size; i++) {
      y[i] = x[i + lag] - x[i];
    }
    
    for (j = 2; j <= differences; j++) {
      
      max_size = max_size - lag;
      
      // #pragma omp parallel for ordered shared(y) num_threads(nthread)
      for (i = 0; i < max_size; i++) {
        y[i] = y[i + lag] - y[i];
      }
      
    }
    
    return y[Range(0, max_size - 1)];
  
  }
}
