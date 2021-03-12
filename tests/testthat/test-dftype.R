#' Test function for dftype function
#'

# Create toy data set
df <- data.frame(type = (c("Air", "Ship", "Bus", "Air")),
                 time= c(6, 32, 31, 5),
                 origin= c("US", "Mexico", "CANADA", "UK"))

# Test the type of input
test_that("When the input is not dataframe or tibble, error message is expeted.",{
  expect_error(dftype("test"), regexp = "The input should be of type  'data.frame' or 'tibble'.")
})

# Test the type of outputs
test_that("The type of unique_df should be data frame",{

  expect_true(is.data.frame(dftype(df)$unique_df))
})

test_that("The type of summary should not be data frame",{

  expect_true(!is.data.frame(dftype(df)$summary))
})

# Test the value of output
test_that("The unique values are incorrect",{
  expect_equivalent(dftype(df)$unique_df[["unique_values"]][1], 'US,Mexico,CANADA,UK')
})


