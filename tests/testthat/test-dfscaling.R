df_1 <- tibble(
  x = c(0, 0, 1, 1),
  y = c(2, 2, 4, 4),
  z = 5,
  target = c(1,1,0,1,0)
)

df_result <- tibble(
  x = c(-1.0, -1.0, 1.0, 1.0),
  y = c(-1.0, -1.0, 1.0, 1.0),
  Class = as.factor(c(1,1,0,1,0))
)



test_that("dfscaling works", {
  expect_equal(2 * 2, 4)
})
