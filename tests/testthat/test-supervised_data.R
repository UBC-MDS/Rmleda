test_that("Test original data", {
  toy_data = tibble::tibble(
    col1 = c(1,2,3,4,5,6,7,8,9,10),
    col2 = c(10,20,30,40,50,60,70,80,90,100),
    col3 = c(0,1,1,0,0,0,1,0,0,1)
  )
  result <- supervised_data(toy_data, xcol=c('col1', 'col2'), ycol=c('col3'))
  expect_true(dplyr::all_equal(toy_data, result$data))
})