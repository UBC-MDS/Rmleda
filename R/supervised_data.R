library(tidymodels)
#' Data Splitting for Supervised Machine Learning
#'
#' A function that utilizes `tidymodels`'s `initial_split` function to perform data spltting
#' while providing convenient access to `X` and `y` portions of both the test split and the train split.
#'
#' @param data the original dataset to be used for splitting
#' @param xcols a vector containing feature names (X) to be used as independent variables
#' @param ycols a vector containing target names (y) to be used as dependent variables or labels
#' @param ...  Additional parameters to pass to the `initial_split` function in `tidymodels`. See `tidymodels` \href{https://www.rdocumentation.org/packages/rsample/versions/0.0.9/topics/initial_split}{documentation} for more details
#'
#' @return A list of the following components.
#' \itemize{
#'     \item data - The original dataset unchanged
#'     \item train - The training portion of the dataset
#'     \item test - The test portion of the dataset
#'     \item xtrain - The training portion of the dataset containing `X` features only.
#'     \item ytrain - The training portion of the dataset containing `y` targets only.
#'     \item xtest - The test portion of the dataset containing `X` features only.
#'     \item ytest - The test portion of the dataset containing `y` targets only.
#' }
#' @export
#'
#' @examples
#' set.seed(1353)
#' cars <- supervised_data(mtcars, xcols = c('mpg', 'cyl', 'disp'), ycols=c('hp'))
#' train_data <- cars$train
#' test_data <- cars$test
#' x_train <- cars$xtrain
#' y_train <- cars$ytrain
#' x_test <- cars$xtest
#' y_test <- cars$ytest
supervised_data <-  function(data, xcols, ycols, ...) {

  if (!is.data.frame(data)) {
    stop("data must be a dataframe")
  }

  if(!is.character(xcols)) {
    stop("xcols must be a character vector or list of column names")
  }

  if(!is.character(ycols)) {
    stop("ycols must be a character vector or listof column names")
  }


  data_split <- initial_split(data, ...)
  train_data <- training(data_split)
  test_data <- testing(data_split)
  x_train <- train_data %>%
    select({
      {
        xcols
      }
    })
  y_train <- train_data %>%
    select({
      {
        ycols
      }
    })
  x_test <- test_data %>%
    select({
      xcols
    })
  y_test <- test_data %>%
    select ({
      {
        ycols
      }
    })
  value <-
    list(
      "data" = data,
      "train" = train_data,
      "test" = test_data,
      "x_train" = x_train,
      "y_train" = y_train,
      "x_test" = x_test,
      "y_test" = y_test
    )
  value
}
