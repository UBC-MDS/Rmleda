df_1 <- tibble(
  x = c(0, 0, 2, 2),
  y = c(2, 2, 4, 4),
  z = 5,
  target = c(1,1,0,1)
)

df_result <- tibble(
  x = c(-0.866, -0.866, 0.866, 0.866),
  y = c(-0.866, -0.866, 0.866, 0.866),
  Class = as.factor(c(1,1,0,1))
)


test_that("dfscaling works", {
  expect_true(all.equal(Rmleda::dfscaling(df_1, target), df_result, tolerance = 0.01))
})
