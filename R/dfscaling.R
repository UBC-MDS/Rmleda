#' Apply standard scaling and centering to the numeric features of a given
#' input dataframe.
#'
#' Each of the numeric columns will have a mean of 0
#' and standard deviation of 1 after the transformation.
#'
#' @param df Data Frame
#' @param target name of the target column
#'
#' @return scaled_df Data Frame
#' @export
#'
#' @examples
#' df_1 <- tibble(x = 1:5,
#' y = seq(2,10, by = 2),
#' z = x ^ 2 + y,
#' target = c(1,1,0,1,0))
#'
#' dfscaling(df, target)

library(tidymodels)
library(tidyverse)
library(dplyr)
dfscaling <- function(df, target) {

  if (!is.data.frame(df)) {
    stop("input data must be a dataframe")
  }

  if (is.null(dim(df))) {
    stop("dataframe must contain data")
  }


  #removing zero-variance columns
  df <- df %>%
    select(- as.numeric(which(apply(df, 2, var) == 0))) %>%
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
