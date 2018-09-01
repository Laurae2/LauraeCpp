#' Relaxed Parallel Subtraction
#'
#' A parallel version of A - B where A and B are both integers or numerics.
#'
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{subLp.integer}}{ for integer}
#' \item{\code{subLp.numeric}}{ for numeric}
#' }
#'
#' @param x The first vector to compute the subtraction per element on.
#' @param y The second vector to compute the subtraction per element on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return \code{x - y}.
#'
#' @aliases subLp.integer subLp.numeric Rcpp_subLp_int Rcpp_subLp_num
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
#'   z0 <- x - y
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- subLp(x, y, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- subLp(x, y, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(z0, z2), all.equal(z0, z2))
#' rm(x, y, z0, z1, z2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 32GB RAM free
#' # Not advised to run on Windows as it will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' y <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' n_cores <- parallel::detectCores()
#' system.time({
#'   z1 <- x - y
#' })
#' system.time({
#'   z2 <- subLp(x, y, nthread = n_cores)
#' })
#' stopifnot(all.equal(z1, z2))
#' rm(x, y, z1, z2)
#' }
#'
#' @export

subLp <- function(x, y, nthread = parallel::detectCores()) {

  if ((class(x) == "integer") & (class(y) == "integer")) {
    return(Rcpp_subLp_int(x, y, nthread))
  } else if ((class(x) == "numeric") & (class(y) == "numeric")) {
    return(Rcpp_subLp_num(x, y, nthread))
  } else {
    stop(paste0("Class of object x or y are incorrect: ", class(x), " and ", class(y)))
  }

}

subLp.integer <- function(x, y, nthread = parallel::detectCores()) {

  return(Rcpp_subLp_int(x, y, nthread))

}

subLp.numeric <- function(x, y, nthread = parallel::detectCores()) {

  return(Rcpp_subLp_num(x, y, nthread))

}
