#' Apply standard scaling and centering to the numeric features of a given input dataframe.
#'
#' The standard score of a sample x is calculated as:
#' z = (x - u) / s
#' where u is the mean of the training samples, and s is the standard deviation of the training samples.
#'
#' @param df Data Frame
#' @param Class Target column
#'
#' @return scaled_df Data Frame
#' @export
#'
#' @examples
#' dfscaling(df)
library(tidymodels)
library(tidyverse)
library(dplyr)
dfscaling <- function(df, target) {
  #remove zero-variance columns
  df <- df %>%
    mutate(Class = {{target}}) %>%
    select(-target) %>%
    mutate(Class = as_factor(Class))

  df_recipe <- recipe(Class ~ ., data = df)
  df_recipe <- df_recipe %>%
    step_scale(all_numeric()) %>%
    step_center(all_numeric()) %>%
    prep()

  scaled_df <- bake(df_recipe, df)
  return(scaled_df)

}

df_1 <- tibble(
  x = 1:5,
  y = seq(2,10, by = 2),
  z = x ^ 2 + y,
  target = c(1,1,0,1,0)
)
