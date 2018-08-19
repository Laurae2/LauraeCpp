# LauraeRcpp

High Performance R by Laurae

**Please use Linux, because Windows CAN NOT BENEFIT WELL at all from performance gains** using parallelization without compiling R with a Windows-native toolchain (not MinGW).

# me = wants download

Requires `Rcpp` (CRAN download) and `parallel` (preinstalled) packages.

```r
devtools::install_github("Laurae2/LauraeRcpp", upgrade_dependencies = FALSE)
```

Dependencies:

```r
install.packages("Rcpp")
```

# Performance Show

Server:

* Dual Xeon Gold 6130 (2x 16 cores / 32 threads, 2.8 GHz all turbo, 3.7 GHz singlethread)
* 384GB RAM (12 x 32GB RAM, 2666 MHz)
* R 3.5.0 compiled using gcc-5.4, `-O3 -mtune=native` flags
* Linux Subsystem for Windows, Ubuntu 16.04

On a 16GB vector (2^31 - 1 elements), parallel mean:

| What | Threads | Elapsed Time | CPU Time | Information |
| --- | ---: | ---: | ---: | ------ |
| R | 1 | 6.137s | 6.141s | Handles NA. Handles more than 2^31 - 1 elements.
| C++ | 1 | 3.147s | 3.147s | No checks on data. |
| C++ | 61 | 0.152s | 9.102s | No checks on data. Optimal run. |
| C++ | 64 | 0.165s | 9.791s | No checks on data. |

![image](https://user-images.githubusercontent.com/9083669/44307446-2032d880-a3a3-11e8-891b-d7f1d53e17d3.png)

![image](https://user-images.githubusercontent.com/9083669/44307476-73a52680-a3a3-11e8-9421-4773221f1537.png)

![image](https://user-images.githubusercontent.com/9083669/44307479-7738ad80-a3a3-11e8-8529-c236d95891a2.png)

![image](https://user-images.githubusercontent.com/9083669/44307480-7acc3480-a3a3-11e8-9bb4-42a0c72c08f6.png)

# Functions included

| Function | Parameters | Effect |
| :--- | :--- | :------ |
| meanLp_num | nthread | Parallel mean on numeric vector (< smaller than 2^31 - 1) |

