#' Relaxed Parallel Mean
#'
#' A parallel version of the mean function.
#'
#' Does not handle vectors larger than 2^31 - 1 elements (2,147,483,647 elements).
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' @param x The numeric vector to compute the mean on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return The mean of the numeric vector.
#'
#' @aliases Rcpp_meanLp_num
#'
#' @examples
#'
#' # Random data
#' set.seed(1)
#' x <- runif(n = 50000000, min = -0.5, max = 1)
#'
#' # Base version
#' system.time({
#'   y0 <- mean(x)
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   y1 <- meanLp_num(x = x, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   y2 <- meanLp_num(x = x, nthread = 2)
#' })
#'
#' # Proof check
#' all.equal(y0, y1)
#' all.equal(y0, y2)
#' rm(x, y0, y1, y2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 16GB RAM free
#' # Not advised to run on Windows, will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' system.time({
#'   y1 <- mean(x)
#' })
#' system.time({
#'   y2 <- meanLp_num(x = x, nthread = parallel::detectCores())
#' })
#' all.equal(y1, y2)
#' rm(x, y1, y2)
#' }
#'
#' @export

meanLp_num <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_meanLp_num(x, nthread))

}
