# LauraeRcpp

High Performance R by Laurae

# me = wants download

Requires `Rcpp` (CRAN download) and `parallel` (preinstalled) packages.

```r
devtools::install_github("Laurae2/LauraeRcpp", upgrade_dependencies = FALSE)
```

Dependencies:

```r
install.packages("Rcpp")
```

# Functions included

| Function | Parameters | Effect |
| :--- | :--- | :------ |
| meanLp_num | nthread | Parallel mean on numeric vector (< smaller than 2^31 - 1) |
