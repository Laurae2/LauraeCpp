#' Relaxed Parallel Mean
#'
#' A parallel version of the mean function.
#'
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' On Windows, the parallel version requires more RAM than the singlethreaded version.
#' The memory requirements scales linearly with the number of threads requested on Windows.
#'
#' Use the following functions if you already know the input types: \itemize{
#' \item{\code{meanLp.integer}}{ for integer}
#' \item{\code{meanLp.numeric}}{ for numeric}
#' }
#'
#' @param x The integer or numeric vector to compute the mean on.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}.
#'
#' @return The mean of the integer or numeric vector.
#'
#' @aliases meanLp.integer meanLp.numeric Rcpp_meanLp_int Rcpp_meanLp_num
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
#'   y1 <- meanLp(x = x, nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   y2 <- meanLp(x = x, nthread = 2)
#' })
#'
#' # Proof check
#' stopifnot(all.equal(y0, y1), all.equal(y0, y2))
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
#'   y2 <- meanLp(x = x, nthread = parallel::detectCores())
#' })
#' stopifnot(all.equal(y1, y2))
#' rm(x, y1, y2)
#' }
#'
#' @export

meanLp <- function(x, nthread = parallel::detectCores()) {

  if (class(x) == "integer") {
    return(Rcpp_meanLp_int(x, nthread))
  } else if (class(x) == "numeric") {
    return(Rcpp_meanLp_num(x, nthread))
  } else {
    stop(paste0("Class of object x is incorrect: ", class(x)))
  }

}

meanLp.integer <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_meanLp_int(x, nthread))

}

meanLp.numeric <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_meanLp_num(x, nthread))

}
