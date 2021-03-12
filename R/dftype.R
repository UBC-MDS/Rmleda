#' Explore the type of data frame variables and columns.
#'
#' Create a new data frame which contains the type of columns and variables for the input data frame.
#' Furthermore, if there are non-numeric columns, it will return the unique values of non-numeric columns and their length.
#'
#' @param df Data Frame
#'
#' @return summary Vector
#' @return unique_df Data Frame
#' @export
#'
#' @examples
#' df <- data.frame(type = (c("Air", "Ship", "Bus", "Air")),
#' time= c(6, 32, 31, 5),
#' origin= c("US", "Mexico", "CANADA", "UK"))
#'
#' results <- dftype(df)
#' results$summary
#' results$unique_df
#'
dftype <- function(df){

  # Check the type of dataframe is a dataframe
  if (!is.data.frame(df)) {
    stop("The input should be of type  'data.frame' or 'tibble'.")
  }

  # Define non numerical data frame
  non_numeric_df <- dplyr::select_if(df, ~!is.numeric(.x))
  non_numeric_col <- colnames(non_numeric_df)

  # Define empty data frame
  unique_df <- data.frame(column_name=character(),
                          unique_values=character(),
                          num_unique_values=integer())

  for (val in non_numeric_col){
    unique_df <- tibble::add_row(unique_df,
                                column_name = val,
                                unique_values = unique(non_numeric_df[[val]]),
                                num_unique_values = length(unique(non_numeric_df[[val]]))                                )
  }

  unique_2 <- stats::aggregate(unique_values ~ column_name,
                        unique_df,
                        paste,
                        collapse=","
                        )
  unique_3 <- unique(dplyr::select(unique_df, "column_name", "num_unique_values"))
  unique_df <- dplyr::left_join(unique_2, unique_3, by = 'column_name')

  return(list(summary = summary(df), unique_df = unique_df))
}
