#' Relaxed Parallel Division
#'
#' A parallel version of A / B where A and B are both integers or numerics (and returns a numeric).
#'
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' In addition, integer division is not really existing here. The base numeric function handles everything.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{divLp.numeric}}{ for numeric}
#' }
#'
#' @param x The first vector to compute the division per element on.
#' @param y The second vector to compute the division per element on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return \code{x / y}.
#'
#' @aliases divLp.numeric Rcpp_divLp_num
#'
#' @examples
#'
#' # Random data
#' set.seed(1)
#' x <- runif(50000000, min = -0.5, max = 1)
#' y <- runif(50000000, min = -0.5, max = 1)
#'
#' # Base version
#' system.time({
#'   z0 <- x / y
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- divLp(x = x, y = y, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- divLp(x = x, y = y, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(z0, z2), all.equal(z0, z2))
#' rm(x, y, z0, z1, z2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 32GB RAM free
#' # Not advised to run on Windows, will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' y <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' system.time({
#'   z1 <- x / y
#' })
#' system.time({
#'   z2 <- divLp(x = x, y = y, nthread = parallel::detectCores())
#' })
#' stopifnot(all.equal(z1, z2))
#' rm(x, z1, z2)
#' }
#'
#' @export

divLp <- function(x, y, nthread = parallel::detectCores()) {

  if ((class(x) == "integer") & (class(y) == "integer")) {
    return(Rcpp_divLp_num(x, y, nthread))
  } else if ((class(x) == "numeric") & (class(y) == "numeric")) {
    return(Rcpp_divLp_num(x, y, nthread))
  } else {
    stop(paste0("Class of object x or y are incorrect: ", class(x), " and ", class(y)))
  }

}

divLp.numeric <- function(x, y, nthread = parallel::detectCores()) {

  return(Rcpp_divLp_num(x, y, nthread))

}
