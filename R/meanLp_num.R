#' Parallel Mean
#'
#' A parallel version of the mean function.
#' Does not handle vectors larger than 2^31 - 1 elements (2,147,483,647 elements).
#' Make sure there is no NA value inside the vector, or the result becomes NA.
#'
#' @param x The numeric vector to compute the mean.
#' @param nthread The number of threads to use for parallelization. Defaults to \code{parallel::detectCores()}
#'
#' @return The mean of the numeric vector.
#'
#' @aliases Rcpp_meanLp_num
#'
#' @examples
#'
#' # Singlethreaded version
#' system.time({
#'   y1 <- meanLp_num(x = runif(n = 10000, min = -0.5, max = 1), nthread = 1)
#' })
#'
#' # Multithreaded version
#' system.time({
#'   y2 <- meanLp_num(x = runif(n = 10000, min = -0.5, max = 1), nthread = 2)
#' })
#'
#' # Proof check
#' all.equal(y1, y2)
#'
#' \dontrun{
#' # Requires at least 16GB RAM free
#' x <- runif(n = 2^31 - 1, min = -0.5, max = 1)
#' system.time({
#'   y1 <- mean(x = x, nthread = parallel::detectCores())
#' })
#' system.time({
#'   y2 <- meanLp_num(x = x, nthread = parallel::detectCores())
#' })
#' all.equal(y1, y2)
#' }
#'
#' @export

meanLp_num <- function(x, nthread = parallel::detectCores()) {

  return(Rcpp_meanLp_num(x, nthread))

}
