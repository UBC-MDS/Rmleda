#' Data Splitting for Supervised Machine Learning
#'
#' A function that utilizes `tidymodels`'s `initial_split` function to perform data spltting
#' while providing convenient access to `X` and `y` portions of both the test split and the train split.
#'
#' @param data the original dataset to be used for splitting
#' @param xcols a vector containing feature names (X) to be used as independent variables
#' @param ycols a vector containing target names (y) to be used as dependent variables or labels
#' @param ...  Additional parameters to pass to `tidymodels`'s `initial_split` function. See `tidymodels` \link[=https://www.rdocumentation.org/packages/rsample/versions/0.0.9/topics/initial_split]{documentation} for more details
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
#' cars <- supervised_data(mtcars, xcols = ['mpg', 'cyl', 'disp'], ycols=['hp'])
#' train_data <- cars$train
#' test_data <- cars$test
#' x_train <- cars$xtrain
#' y_train <- cars$ytrain
#' x_test <- cars$xtest
#' y_test <- cars$ytest
supervised_data <-  function(data, xcols, ycols, ...) {
}
