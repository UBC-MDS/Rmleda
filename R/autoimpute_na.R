library(dplyr)
library(naniar)

#' Identify and impute missing values in a dataframe.
#'
#' Identify and impute missing values in a dataframe and return a new dataframe with imputed missing values.
#'
#' @param df a dataframe or a tibble
#'
#' @return a dataframe or a tibble
#' @export
#' @examples
#'
autoimpute_na <- function(df) {

  # Check the type of the input is a dataframe
  if (!is.data.frame(df)) {
    stop("The input should be of type 'data.frame'")
  }

  # Check if there are any missing values entered manually and replace them with the NA value
  df <- df %>%
    naniar::replace_with_na_all(condition = ~.x %in% c("na", "n/a", "nan", "N/A", "not available",
                                               "Not available", "Not Available", "-", "--", "---"))

  # If there are no missing values, then return the original df
  if (sum(is.na(df)) == 0){
    imputed_df <- df
    print(paste0("There are no missing values in the dataframe! I am returning the original dataframe!"))
  } else {
    for (col in names(df)) {        # Fill missing values with the mean for numeric columns
      if (is.numeric(df[[col]]) == TRUE){
        df[[col]][is.na(df[[col]])] <- mean(df[[col]], na.rm=TRUE)
      } else {                    # Fill missing values with the most frequent value for non-numeric columns
        df[[col]][is.na(df[[col]])] <- names(which.max(table(df[[col]])))
      }
    }
  }

  imputed_df <- df
  return(as.data.frame(imputed_df))
}
