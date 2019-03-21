
## concatenate

When referring to strings, concatenate means to paste them together using the function `paste` (adds a space between strings) or `paste0` (doesn't add anything between strings). 


```r
subject_name <- "Lisa"
paste("Hello,", subject_name)
```

```
## [1] "Hello, Lisa"
```


When referring to other types of variables, concatenate can mean to create a vector with those variables, usually using the `c` function. For example, you could concatenate the numbers 1, 3, 6, and 10 like this: `c(1, 3, 6, 10)`. You can concatenate two [vector](#vector)s as well:


```r
v1 <- 1:5
v2 <- 11:15
c(v1, v2)
```

```
##  [1]  1  2  3  4  5 11 12 13 14 15
```

<p class="alert alert-warning">Remember, a [vector](#vector) can only have one [data type](#data_type). So if you concatenate a [string](#string) vector and a [numeric](#numeric) vector, the numbers will get turned into their string versions. If you concatenate an [integer](#integer) and a [double](#integer) vector, the integers will be converted to doubles.</p>


```r
strings <- c("a", "c", "e")
integers <- c(1L, 3L, 5L)
doubles <- c(1.1, 3.3, 5.5)
c(strings, integers)
c(doubles, integers)
```

```
## [1] "a" "c" "e" "1" "3" "5"
## [1] 1.1 3.3 5.5 1.0 3.0 5.0
```
