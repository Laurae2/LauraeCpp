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
* BIOS additional settings: UMA mode (not NUMA)

CPU frequency:

| Frequency | CPU loaded |
| :--- | ---: |
| 3.7 GHz | 1, 2 |
| 3.5 GHz | 3, 4 |
| 3.4 GHz | 5, 6, 7, 8 |
| 3.1 GHz | 9, 10, 11, 12 |
| 2.8 GHz | 13, 14, 15, 16 |
| 2.8 GHz | 17-32 |

On a 16GB vector (2^31 - 1 elements), parallel mean:

| What | Threads | Elapsed Time | CPU Time | Throughput | Information |
| --- | ---: | ---: | ---: | ---: | ------ |
| R | 1 | 6.137s | 6.141s | 0.3 bn/s | Handles NA. Handles more than 2^31 - 1 elements.
| C++ | 1 | 3.147s | 3.147s | 0.7 bn/s | No checks on data. |
| C++ | 2 | 1.613s | 3.206s | 1.3 bn/s | No checks on data. |
| C++ | 4 | 0.832s | 3.304s | 2.6 bn/s | No checks on data. |
| C++ | 8 | 0.432s | 3.432s | 5.0 bn/s | No checks on data. |
| C++ | 16 | 0.229s | 3.664s | 9.4 bn/s | No checks on data. |
| C++ | 32 | 0.172s | 5.241s | 12.4 bn/s | No checks on data. |
| C++ | 61 | 0.152s | 9.102s | 14.0 bn/s | No checks on data. Optimal run. |
| C++ | 64 | 0.165s | 9.791s | 13.0 bn/s | No checks on data. |

![image](https://user-images.githubusercontent.com/9083669/44307446-2032d880-a3a3-11e8-891b-d7f1d53e17d3.png)

![image](https://user-images.githubusercontent.com/9083669/44307995-478ea300-a3ad-11e8-8d8e-988078faae5a.png)

![image](https://user-images.githubusercontent.com/9083669/44307997-4f4e4780-a3ad-11e8-8e7d-8220c9b00e4e.png)

![image](https://user-images.githubusercontent.com/9083669/44307479-7738ad80-a3a3-11e8-8529-c236d95891a2.png)

![image](https://user-images.githubusercontent.com/9083669/44307480-7acc3480-a3a3-11e8-9bb4-42a0c72c08f6.png)

# Functions included

| Function | Parameters | Effect |
| :--- | :--- | :------ |
| meanLp_num | nthread | Parallel mean on numeric vector (< smaller than 2^31 - 1) |

