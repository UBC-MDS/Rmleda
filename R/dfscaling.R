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
#'
#' @importFrom rlang :=
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

  if ((nrow(df) == 0)) {
    stop("dataframe must contain data")
  }


  #removing zero-variance columns
  df <- df %>%
    dplyr::select(-as.numeric(which(apply(df, 2, stats::var) == 0))) %>%
    dplyr::mutate({{target}} := as.factor({{target}}))


  form <- rlang::new_formula(rlang::ensym(target), rlang::sym("."))
  df_recipe <- recipes::recipe(form, data = df)
  df_recipe <- df_recipe %>%
    recipes::step_scale(recipes::all_numeric()) %>%
    recipes::step_center(recipes::all_numeric()) %>%
    recipes::prep()


  scaled_df <- recipes::bake(df_recipe, df)
  return(scaled_df)

}
