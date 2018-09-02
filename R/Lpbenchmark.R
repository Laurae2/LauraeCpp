#' Benchmarking Suite
#'
#' Runs the integrated benchmarking suite.
#'
#' @param size The size of the benchmark. If you don't know what value to use. Defaults to \code{1e8} (approximately 750MB, requires at least 750MB x 4 = 3GB).
#' @param test_threads The number of threads to test, to provide as a vector. Defaults to \code{seq_len(parallel::detectCores())} which means try from 1 to all threads.
#' @param repeats The number of times to retry benchmarking to average out results. Defaults to \code{5}.
#' @param seed The random number generator seed. It should not have any impact on performance. Defaults to \code{1}.
#' @param html_out Should the benchmark be done using a markdown file for HTML output? Defaults to \code{TRUE}.
#' @param output_file The output file. Defaults to \code{"benchmark.html"}.
#' @param output_dir The output directory for the output file. Defaults to \code{"./"}.
#' @param open_file Open the file at the end of the benchmark. Defaults to \code{FALSE}.
#'
#' @return A markdown file.
#'
#' @examples
#' \dontrun{
#' # Output benchmark results with 1 to 2 threads in console
#' Lpbenchmark(size = 1e7, test_threads = 1:2, repeats = 1, html_out = FALSE)
#'
#' # Output benchmark repeated 5 times using 1 to all threads in HTML file and opens it immediately
#' Lpbenchmark(size = 1e7, repeats = 5, html_out = TRUE,
#'             output_file = tempdir(), output_dir = tempdir(), open_file = TRUE)
#' }
#'
#' @export

Lpbenchmark <- function(size = 1e8, test_threads = seq_len(parallel::detectCores()), repeats = 5, seed = 1, html_out = TRUE, output_file = "benchmark.html", output_dir = "./", open_file = FALSE) {

  if (html_out) {

    rmarkdown::render(input = system.file("/inst/extra/benchmark.rmd", package = "LauraeCpp"),
                      output_file = output_file,
                      output_dir = output_dir,
                      params = list(size = size, test_threads = test_threads, repeats = repeats, seed = seed))

    if (open_file == TRUE) {
      report_path <- file.path(output_dir, output_file)
      utils::browseURL(report_path)
    }

  } else {



  }

  return(TRUE)

}
