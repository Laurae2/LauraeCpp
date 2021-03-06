// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// Rcpp_addLp_int
Rcpp::IntegerVector Rcpp_addLp_int(Rcpp::IntegerVector x, Rcpp::IntegerVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_addLp_int(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_addLp_int(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_addLp_num
Rcpp::NumericVector Rcpp_addLp_num(Rcpp::NumericVector x, Rcpp::NumericVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_addLp_num(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_addLp_num(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_diffLp_int
Rcpp::IntegerVector Rcpp_diffLp_int(Rcpp::IntegerVector x, int lag, int differences, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_diffLp_int(SEXP xSEXP, SEXP lagSEXP, SEXP differencesSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type lag(lagSEXP);
    Rcpp::traits::input_parameter< int >::type differences(differencesSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_diffLp_int(x, lag, differences, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_diffLp_num
Rcpp::NumericVector Rcpp_diffLp_num(Rcpp::NumericVector x, int lag, int differences, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_diffLp_num(SEXP xSEXP, SEXP lagSEXP, SEXP differencesSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type lag(lagSEXP);
    Rcpp::traits::input_parameter< int >::type differences(differencesSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_diffLp_num(x, lag, differences, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_diffLp_simd_int
Rcpp::IntegerVector Rcpp_diffLp_simd_int(Rcpp::IntegerVector x, int lag, int differences, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_diffLp_simd_int(SEXP xSEXP, SEXP lagSEXP, SEXP differencesSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type lag(lagSEXP);
    Rcpp::traits::input_parameter< int >::type differences(differencesSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_diffLp_simd_int(x, lag, differences, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_diffLp_simd_num
Rcpp::NumericVector Rcpp_diffLp_simd_num(Rcpp::NumericVector x, int lag, int differences, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_diffLp_simd_num(SEXP xSEXP, SEXP lagSEXP, SEXP differencesSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type lag(lagSEXP);
    Rcpp::traits::input_parameter< int >::type differences(differencesSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_diffLp_simd_num(x, lag, differences, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_divLp_num
Rcpp::NumericVector Rcpp_divLp_num(Rcpp::NumericVector x, Rcpp::NumericVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_divLp_num(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_divLp_num(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_meanLp_int
double Rcpp_meanLp_int(Rcpp::IntegerVector x, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_meanLp_int(SEXP xSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_meanLp_int(x, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_meanLp_num
double Rcpp_meanLp_num(Rcpp::NumericVector x, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_meanLp_num(SEXP xSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_meanLp_num(x, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_mulLp_int
Rcpp::IntegerVector Rcpp_mulLp_int(Rcpp::IntegerVector x, Rcpp::IntegerVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_mulLp_int(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_mulLp_int(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_mulLp_num
Rcpp::NumericVector Rcpp_mulLp_num(Rcpp::NumericVector x, Rcpp::NumericVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_mulLp_num(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_mulLp_num(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_subLp_int
Rcpp::IntegerVector Rcpp_subLp_int(Rcpp::IntegerVector x, Rcpp::IntegerVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_subLp_int(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_subLp_int(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_subLp_num
Rcpp::NumericVector Rcpp_subLp_num(Rcpp::NumericVector x, Rcpp::NumericVector y, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_subLp_num(SEXP xSEXP, SEXP ySEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type y(ySEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_subLp_num(x, y, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_sumLp_int
int Rcpp_sumLp_int(Rcpp::IntegerVector x, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_sumLp_int(SEXP xSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::IntegerVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_sumLp_int(x, nthread));
    return rcpp_result_gen;
END_RCPP
}
// Rcpp_sumLp_num
double Rcpp_sumLp_num(Rcpp::NumericVector x, int nthread);
RcppExport SEXP _LauraeCpp_Rcpp_sumLp_num(SEXP xSEXP, SEXP nthreadSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type nthread(nthreadSEXP);
    rcpp_result_gen = Rcpp::wrap(Rcpp_sumLp_num(x, nthread));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_LauraeCpp_Rcpp_addLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_addLp_int, 3},
    {"_LauraeCpp_Rcpp_addLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_addLp_num, 3},
    {"_LauraeCpp_Rcpp_diffLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_diffLp_int, 4},
    {"_LauraeCpp_Rcpp_diffLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_diffLp_num, 4},
    {"_LauraeCpp_Rcpp_diffLp_simd_int", (DL_FUNC) &_LauraeCpp_Rcpp_diffLp_simd_int, 4},
    {"_LauraeCpp_Rcpp_diffLp_simd_num", (DL_FUNC) &_LauraeCpp_Rcpp_diffLp_simd_num, 4},
    {"_LauraeCpp_Rcpp_divLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_divLp_num, 3},
    {"_LauraeCpp_Rcpp_meanLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_meanLp_int, 2},
    {"_LauraeCpp_Rcpp_meanLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_meanLp_num, 2},
    {"_LauraeCpp_Rcpp_mulLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_mulLp_int, 3},
    {"_LauraeCpp_Rcpp_mulLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_mulLp_num, 3},
    {"_LauraeCpp_Rcpp_subLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_subLp_int, 3},
    {"_LauraeCpp_Rcpp_subLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_subLp_num, 3},
    {"_LauraeCpp_Rcpp_sumLp_int", (DL_FUNC) &_LauraeCpp_Rcpp_sumLp_int, 2},
    {"_LauraeCpp_Rcpp_sumLp_num", (DL_FUNC) &_LauraeCpp_Rcpp_sumLp_num, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_LauraeCpp(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
