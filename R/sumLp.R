#' Relaxed Parallel Sum
#'
#' A parallel version of the sum function.
#'
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{sumLp.integer}}{ for integer}
#' \item{\code{sumLp.numeric}}{ for numeric}
#' }
#'
#' @param x The integer or numeric vector to compute the sum on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return The sum of the integer or numeric vector.
#'
#' @aliases sumLp.integer sumLp.numeric Rcpp_sumLp_int Rcpp_sumLp_num
#'
#' @examples
#'
#' # Random data
#' set.seed(1)
#' x <- runif(n = 50000000, min = -0.5, max = 1)
#'
#' # Base version
#' system.time({
#'   z0 <- sum(x)
#' })
#'
#' # Singlethreaded version
#' system.time({
#'   z1 <- sumLp(x, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   z2 <- sumLp(x, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(z0, z1), all.equal(z0, z2))
#' rm(x, z0, z1, z2)
#'
#' \dontrun{
#' # "BIG DATAish": Requires at least 16GB RAM free
#' # Not advised to run on Windows as it will explode RAM on many core systems
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' n_cores <- parallel::detectCores()
#' system.time({
#'   z1 <- sum(x)
#' })
#' system.time({
#'   z2 <- sumLp(x, nthread = n_cores)
#' })
#' stopifnot(all.equal(z1, z2))
#' rm(x, z1, z2)
#' }
#'
#' @export

sumLp <- function(x, nthread = parallel::detectCores()) {

  if (class(x) == "integer") {
    return(Rcpp_sumLp_int(x, nthread))
  } else if (class(x) == "numeric") {
    return(Rcpp_sumLp_num(x, nthread))
  } else {
    stop(paste0("Class of object x is incorrect: ", class(x)))
  }

}

sumLp.integer <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_sumLp_int(x, nthread))

}

sumLp.numeric <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_sumLp_num(x, nthread))

}
