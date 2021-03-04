
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rmleda

<!-- badges: start -->
<!-- badges: end -->

The goal of Rmleda is to build a R package called `Rmleda` with relevant
functions to help with preliminary EDA for a given dataset. The package
contains functions and classes that help perform various data
preparation and wrangling tasks such as data splitting, exploration,
imputation, and scaling. These functionalities were identified as
commonly-performed tasks in supervised machine learning settings but may
provide value in other project types as well.

The `Rmleda` package will include the following classes/functions:

-   `SupervisedData` is a wrapper class that splits a dataframe into
    train and test sets and further into X and y subsets based on a list
    of user-provided columns.

-   `dftype()` function will return the type of columns and variables
    for the input data frame. Furthermore, if there are non-numeric
    columns, it will return the unique values of non-numeric columns and
    their length.

-   `autoimpute_na()` function to identify and impute missing values for
    different attributes in a given dataframe.

-   `dfscaling()` function to apply standard scaling to the numerical
    features in a dataframe.

The `Rmleda` package is intended to help with EDA for supervised machine
learning tasks; there are other existing packages that contain some
similar functionality. Our `Rmleda` package intends to augment the
existing functionality of these packages with some additional features.

## Installation

You can install the released version of Rmleda from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Rmleda")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rmleda")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(Rmleda)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/master/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
