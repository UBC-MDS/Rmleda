toy_df <- data.frame(chocolate_brand = (c("Lindt", "Rakhat", "Lindt", "Richart", "not available")),
                 price = c(3, NA, 4, 6, 3))

# Test the type of input
test_that("When the input is not a dataframe or tibble, error message is expeted",{
  expect_error(autoimpute_na("test"), "The input should be of type 'data.frame' or 'tibble'")
})
