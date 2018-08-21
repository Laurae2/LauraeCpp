#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
Rcpp::IntegerVector Rcpp_addLp_int(Rcpp::IntegerVector x, Rcpp::IntegerVector y, Rcpp::NumericVector nthread) {

  R_xlen_t max_size = x.size();
  Rcpp::IntegerVector z(max_size);
  int nthreads = nthread[0];

  #pragma omp parallel for shared(x, y) num_threads(nthreads)
  for (R_xlen_t i=0; i<max_size; i++) {
    z[i] = x[i] + y[i];
  }

  return z;
}
