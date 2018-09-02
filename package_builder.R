setwd("E:/Performance/Package")
# Rcpp::Rcpp.package.skeleton("LauraeCpp")
# file.create("LauraeCpp/.Rbuildignore") # Windows can't do this!!!
# setwd("E:/Performance/Package/LauraeCpp")
# devtools::use_vignette("benchmark")

Rcpp::compileAttributes("LauraeCpp")

desc <- readLines("LauraeCpp/DESCRIPTION")
desc[4] <- paste0("Version: 0.", format(Sys.Date(), format = "%Y%m%d"))
desc[5] <- paste0("Date: ", format(Sys.Date(), format = "%Y-%m-%d"))
writeLines(desc, "LauraeCpp/DESCRIPTION")

file.remove("LauraeCpp/vignettes/benchmark.html")
unlink("LauraeCpp/vignettes/benchmark_files", recursive = TRUE, force = TRUE)
unlink("Document", recursive = TRUE, force = TRUE)
dir.create("Document")
file.copy("LauraeCpp", "Document", recursive = TRUE)
unlink("Document/LauraeCpp/man", recursive = TRUE, force = TRUE)
dir.create("Document/LauraeCpp/man")
devtools::document("Document/LauraeCpp")
unlink("LauraeCpp/man", recursive = TRUE, force = TRUE)
dir.create("LauraeCpp/man")
file.copy("Document/LauraeCpp/man", "LauraeCpp", recursive = TRUE)

# dll must be removed by hand...
# for (i in list.files("Document/LauraeCpp/src")) {
#   if (substr(i, start = nchar(i) - 1, stop = nchar(i)) %in% c(".o", ".dll")) {
#     file.remove(file.path("Document", "LauraeCpp", "src", i))
#   }
# }

# Will it break? install.packages("https://cran.r-project.org/src/contrib/Archive/Rcpp/Rcpp_0.12.16.tar.gz")
unlink("Compile", recursive = TRUE, force = TRUE)
dir.create("Compile")
file.copy("LauraeCpp", "Compile", recursive = TRUE)

devtools::build_vignettes("Compile/LauraeCpp")
file.copy("Compile/LauraeCpp/inst/doc", "LauraeCpp/inst", recursive = TRUE)

unlink("Compile", recursive = TRUE, force = TRUE)
dir.create("Compile")
file.copy("LauraeCpp", "Compile", recursive = TRUE)

devtools::check("Compile/LauraeCpp", run_dont_test = FALSE)
devtools::install("Compile/LauraeCpp", upgrade_dependencies = FALSE)
