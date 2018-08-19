# LauraeRcpp

High Performance R by Laurae

**Please use Linux, because Windows CAN NOT BENEFIT WELL at all from performance gains** using parallelization without compiling R with a Windows-native toolchain (not MinGW).

# me = wants download

Requires `Rcpp` (CRAN download) and `parallel` (preinstalled) packages.

```r
devtools::install_github("Laurae2/LauraeCpp", upgrade_dependencies = FALSE)
```

Dependencies:

```r
install.packages("Rcpp")
```

# Performance Show

Example of a parallel mean on a 10,000,000,000 length numeric vector (10 billion and 80GiB !!!).

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

On a 80GiB (74.5GB) vector (10,000,000,000 elements), parallel mean:

```r
> set.seed(1)
> my_vec <- runif(n = 1e10, min = -0.5, max = 1)
> object.size(my_vec)
80000000048 bytes
```

Repeats per number of threads from 1 to 64:

```r
# Approx 4521.241 seconds total
> ceiling(20 * log(seq_len(64) + 1))
 [1] 14 22 28 33 36 39 42 44 
 [9] 47 48 50 52 53 55 56 57
[17] 58 59 60 61 62 63 64 65
[25] 66 66 67 68 69 69 70 70
[33] 71 72 72 73 73 74 74 75
[41] 75 76 76 77 77 78 78 78
[49] 79 79 80 80 80 81 81 81
[57] 82 82 82 83 83 83 84 84
```

Results of the parallel mean:

| What | Threads | Elapsed Time | CPU Time | Throughput | Speedup vs R | Information |
| --- | ---: | ---: | ---: | ---: | ---: | ------ |
| R | 1 | 33.235s | 33.235s | 0.3 bn/s | 1x | Handles NA. |
| C++ | 1 | 16.139s | 16.141s | 0.6 bn/s | 2.06x | No checks on data. |
| C++ | 2 | 7.985s | 15.527s | 1.3 bn/s | 4.16x | No checks on data. |
| C++ | 4 | 4.024s | 15.674s | 2.5 bn/s | 8.26x | No checks on data. |
| C++ | 8 | 2.101s | 16.188s | 4.8 bn/s | 15.82x | No checks on data. |
| C++ | 16 | 1.097s | 16.782s | 9.1 bn/s | 30.30x | No checks on data. |
| C++ | 32 | 0.814s | 24.112s | 12.3 bn/s | 40.83x | No checks on data. |
| C++ | 63 | 0.721s | 43.887s | 13.9 bn/s | 46.10x | No checks on data. Optimal run. |
| C++ | 64 | 0.733s | 43.322s | 13.6 bn/s | 45.34x | No checks on data. |

![image](https://user-images.githubusercontent.com/9083669/44313489-1b553f80-a40a-11e8-9a7f-9c26e64b059b.png)

![image](https://user-images.githubusercontent.com/9083669/44313512-74bd6e80-a40a-11e8-84e2-118d85cf0b86.png)

![image](https://user-images.githubusercontent.com/9083669/44313493-214b2080-a40a-11e8-948c-36be89924a32.png)

![image](https://user-images.githubusercontent.com/9083669/44313496-27410180-a40a-11e8-9aec-f49ff15a79c2.png)

![image](https://user-images.githubusercontent.com/9083669/44313499-31fb9680-a40a-11e8-81f7-b53525cc8ad7.png)

# Functions included

| Function | Parameters | Effect |
| :--- | :--- | :------ |
| meanLp_num | nthread | Relaxed parallel mean on numeric vector (< smaller than 2^31 - 1) |
| sumLp_num | nthread | Relaxed parallel sum on numeric vector (< smaller than 2^31 - 1) |

