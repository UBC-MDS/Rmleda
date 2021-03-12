toy_df_no_na <- data.frame(chocolate_brand = (c("Lindt", "Rakhat", "Lindt", "Richart", "Lindt")),
                       price = c(3, 4, 4, 6, 3))

toy_df_na <- data.frame(chocolate_brand = (c("Lindt", "Rakhat", "Lindt", "Richart", "not available")),
                     price = c(3, NA, 4, 6, 3))

# Test the type of input
test_that("When the input is not a dataframe, error message is expeted",{
  expect_error(autoimpute_na("test"), "The input should be of type 'data.frame'")
})

# Test an input with no missing values
test_that("When the input of autoimpute_na() doe not have missing values, the output should be the original dataframe", {
  expect_equal(autoimpute_na(toy_df_no_na), toy_df_no_na)
})

# Test an input with missing values
test_that("When the input of autoimpute_na() has missing values, the output should be an imputed dataframe", {
  expect_equal(autoimpute_na(toy_df_na), toy_df_no_na)
})
