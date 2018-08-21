#' Relaxed Parallel Addition of Integers
#'
#' A parallel version of A + B where A and B are integers.
#'
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' @param x The first vector to compute the sum per element on.
#' @param y The second vector to compute the sum per element on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return \code{x + y}.
#'
#' @aliases Rcpp_addLp_int
#'
#' @examples
#'
#' # Random data
#' set.seed(1)
#' x <- sample(-5:10, size = 50000000, replace = TRUE)
#' y <- sample(-5:10, size = 50000000, replace = TRUE)
#'
#' # Base version
#' system.time({
#'   z0 <- x + y
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- addLp_int(x = x, y = y, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- addLp_int(x = x, y = y, nthread = 2)
#' })
#'
#' # Proof check
#' all.equal(z0, z2)
#' all.equal(z1, z2)
#' rm(x, y, z0, z1, z2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 16GB RAM free
#' # Not advised to run on Windows, will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' system.time({
#'   z1 <- x + y
#' })
#' system.time({
#'   z2 <- addLp_int(x = x, y = y, nthread = parallel::detectCores())
#' })
#' all.equal(z1, z2)
#' rm(x, z1, z2)
#' }
#'
#' @export

addLp_int <- function(x, y, nthread = parallel::detectCores()) {

  return(Rcpp_addLp_int(x, y, nthread))

}
