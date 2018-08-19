setwd("E:/Performance/Package")
# Rcpp::Rcpp.package.skeleton("LauraeCpp")
# file.create("LauraeCpp/.Rbuildignore") # Windows can't do this!!!

Rcpp::compileAttributes("LauraeCpp")

unlink("Document", recursive = TRUE, force = TRUE)
dir.create("Document")
file.copy("LauraeCpp", "Document", recursive = TRUE)
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

devtools::check("Compile/LauraeCpp", run_dont_test = FALSE)
devtools::install("Compile/LauraeCpp", upgrade_dependencies = FALSE)
