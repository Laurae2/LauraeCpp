#' Relaxed Parallel Lagged Differences [SIMD Version]
#'
#' A SIMD-ized parallel version of \code{base::diff}, working only on vectors.
#'
#' [SIMD Specific Warnings]: \itemize{
#' \item{Compilation:}{ Make sure to compile with \code{-mtune=native} (requires a change in \code{R\\etc\\x64\\Makeconf}).}
#' \item{Compilation in Windows:}{ You will get warnings (\code{warning: ignoring #pragma ivdep omp}), they can be safely ignored.}
#' }
#'
#' [SIMD Specific Recommendations]: \itemize{
#' \item{Threads:}{ Uses a lot the RAM bandwidth, please use \code{nthread = 1} as it is plenty fast already.}
#' \item{AVX: }{ With AVX, it literally saturates the bandwidth of a Dual Xeon setup (approx 130 Gbps with DDR4-2666).}
#' \item{Avoid: }{ Avoid using SIMD unless you have a small machine (not too many cores). Otherwise, it is (usually) inefficient past 1 thread.}
#' }
#'
#' Make sure there is no NA value inside the vector, or the result becomes unexpected.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{diffLp_simd.integer}}{ for integer}
#' \item{\code{diffLp_simd.numeric}}{ for numeric}
#' }
#'
#' @param x The vector to compute the lagged differences on.
#' @param lag Integer value indicating the lag value for the lagged differences.
#' @param differences Integer value indicating the order of the differences.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return The same as \code{base::diff(x, lag, differences)}.
#'
#' @aliases diffLp_simd.integer diffLp_simd.numeric Rcpp_diffLp_simd_int Rcpp_diffLp_simd_num
#'
#' @examples
#'
#' # Random data
#' set.seed(1)
#' x <- sample(-5:10, size = 5000000, replace = TRUE)
#'
#' # Base version
#' system.time({
#'   z0 <- diff(x, lag = 1, differences = 1)
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- diffLp_simd(x = x, lag = 1, differences = 1, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- diffLp_simd(x = x, lag = 1, differences = 1, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(z0, z2), all.equal(z0, z2))
#'
#' # A bit more complicated
#'
#' # Base version
#' system.time({
#'   z0 <- diff(x, lag = 3, differences = 3)
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- diffLp_simd(x, lag = 3, differences = 3, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- diffLp_simd(x, lag = 3, differences = 3, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(z0, z2), all.equal(z0, z2))
#'
#' rm(x, z0, z1, z2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 32GB RAM free
#' # Not advised to run on Windows as it will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' n_cores <- parallel::detectCores()
#' system.time({
#'   z1 <- diff(x, lag = 1, differences = 1)
#' })
#' system.time({
#'   z2 <- diffLp_simd(x = x, lag = 1, differences = 1, nthread = n_cores)
#' })
#' stopifnot(all.equal(z1, z2))
#' rm(x, z1, z2)
#' }
#'
#' @export

diffLp_simd <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  if (class(x) == "integer") {
    return(Rcpp_diffLp_simd_int(x, lag, differences, nthread))
  } else if (class(x) == "numeric") {
    return(Rcpp_diffLp_simd_num(x, lag, differences, nthread))
  } else {
    stop(paste0("Class of object x is incorrect: ", class(x)))
  }

}

diffLp_simd.integer <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  return(Rcpp_diffLp_simd_int(x, lag, differences, nthread))

}

diffLp_simd.numeric <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  return(Rcpp_diffLp_simd_num(x, lag, differences, nthread))

}
