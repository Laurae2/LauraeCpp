#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;

// [[Rcpp::export]]
Rcpp::IntegerVector Rcpp_subLp_int(Rcpp::IntegerVector x, Rcpp::IntegerVector y, int nthread) {

  R_xlen_t max_size = x.size();
  Rcpp::IntegerVector z(max_size);

  #pragma omp parallel for shared(x, y) num_threads(nthread)
  for (R_xlen_t i=0; i<max_size; i++) {
    z[i] = x[i] - y[i];
  }

  return z;
}
