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
#' df <- tidyr::tibble(x = 1:5,
#'                       y = seq(2,10, by = 2),
#'                       z = x ^ 2 + y,
#'                       target = c(1,1,0,1,0))
#'
#' dfscaling(df, target)
dfscaling <- function(df, target) {

  if (!is.data.frame(df)) {
    stop("input data must be a dataframe")
  }

  if (is.null(dim(df))) {
    stop("dataframe must contain data")
  }

  # Setting the Class variable to NULL
  # This is to address dplyr's evaluation when performing devtools::check()
  # we get a Note without this assignment
  Class <- NULL

  #removing zero-variance columns
  df <- df %>%
    dplyr::select(- as.numeric(which(apply(df, 2, stats::var) == 0))) %>%
    dplyr::mutate(Class = {{target}}) %>%
    dplyr::select(-target) %>%
    dplyr::mutate(Class = as.factor(Class))

  df_recipe <- recipes::recipe(Class ~ ., data = df)
  df_recipe <- df_recipe %>%
    recipes::step_scale(recipes::all_numeric()) %>%
    recipes::step_center(recipes::all_numeric()) %>%
    recipes::prep()


  scaled_df <- recipes::bake(df_recipe, df)
  return(scaled_df)

}
