
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

-   `dfscaling()` function to apply scaling and centering to the
    numerical features in a given input dataframe.

The `Rmleda` package is intended to help with EDA for supervised machine
learning tasks; there are other existing packages that contain some
similar functionality. For example, the packages, namely
[tidymodels](https://CRAN.R-project.org/package=tidymodels),
[`MICE`](https://CRAN.R-project.org/package=mice),
[`Amelia`](https://CRAN.R-project.org/package=Amelia),
[`missForest`](https://CRAN.R-project.org/package=missForest),
[`Hmisc`](https://CRAN.R-project.org/package=Hmisc), and
[`mi`](https://CRAN.R-project.org/package=mi), provide users with
functions to analyze attribute types, detect missing values and fill
them, and scale input data. Our `Rmleda` package intends to augment the
existing functionality of these packages with some additional features
and tie it all into a single useful package.

The `autoimpute_na()` function will additionally detect some common
non-standard missing values manually entered by users (e.g., “not
available”, “n/a”, “na”, “-”) while identifying and imputing missing
data. The output of the `autoimpute_na()` function will be a dataframe
with imputed values.

In supervised machine learning, data splitting is often a multi-step
process that involves splitting the dataset of interest into test and
train portions and then further into X(features) and y(target class)
subsets. Typically, the user has to create and keep track of different
variables that hold each of these subsets of the data. `supervised_data`
in `Rmleda` is a function that builds upon the `initial_split` function
from the `tidymodels` package. `supervised_data` provides the user with
quick access to appropriately-named attributes referring to each of the
aforementioned variables so they can be easily accessed for use in
subsequent steps of the machine learning pipeline.

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

```
// TODO
```
