#' Relaxed Parallel Lagged Differences
#'
#' A parallel version of \code{base::diff}, working only on vectors.
#'
#' Make sure there is no NA value inside the vector, or the result becomes unexpected.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{diffLp.integer}}{ for integer}
#' \item{\code{diffLp.numeric}}{ for numeric}
#' }
#'
#' @param x The vector to compute the lagged differences on.
#' @param lag Integer value indicating the lag value for the lagged differences.
#' @param differences Integer value indicating the order of the differences.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return The same as \code{base::diff(x, lag, differences)}.
#'
#' @aliases diffLp.integer diffLp.numeric Rcpp_diffLp_int Rcpp_diffLp_num
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
#'   z1 <- diffLp(x = x, lag = 1, differences = 1, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- diffLp(x = x, lag = 1, differences = 1, nthread = 2)
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
#'   z1 <- diffLp(x, lag = 3, differences = 3, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- diffLp(x, lag = 3, differences = 3, nthread = 2)
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
#'   z2 <- diffLp(x = x, lag = 1, differences = 1, nthread = n_cores)
#' })
#' stopifnot(all.equal(z1, z2))
#' rm(x, z1, z2)
#' }
#'
#' @export

diffLp <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  if (class(x) == "integer") {
    return(Rcpp_diffLp_int(x, lag, differences, nthread))
  } else if (class(x) == "numeric") {
    return(Rcpp_diffLp_num(x, lag, differences, nthread))
  } else {
    stop(paste0("Class of object x is incorrect: ", class(x)))
  }

}

diffLp.integer <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  return(Rcpp_diffLp_int(x, lag, differences, nthread))

}

diffLp.numeric <- function(x, lag = 1, differences = 1, nthread = parallel::detectCores()) {

  return(Rcpp_diffLp_num(x, lag, differences, nthread))

}
