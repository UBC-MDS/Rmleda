test_that("Test original data", {
  toy_data = tibble::tibble(
    col1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    col2 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
    col3 = c(0, 1, 1, 0, 0, 0, 1, 0, 0, 1)
  )
  result <-
    supervised_data(toy_data,
                    xcol = c('col1', 'col2'),
                    ycol = c('col3'))
  expect_true(dplyr::all_equal(toy_data, result$data))
})

test_that("Check that data splits are of correct sizes", {
  toy_data = tibble::tibble(
    col1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    col2 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
    col3 = c(0, 1, 1, 0, 0, 0, 1, 0, 0, 1)
  )
  result <-
    supervised_data(toy_data,
                    xcol = c('col1', 'col2'),
                    ycol = c('col3'))
  # tidymodels::initial_split() round train size up in case of non-integer split
  expect_true(nrow(result$train) == ceiling(0.75 * nrow(toy_data)))
  # tidymodel::initial_split() rounds test size down in case of non-integer split
  expect_true(nrow(result$test) == floor(0.25 * nrow(toy_data)))
  # Reconstruct original data from the splits
  expect_true(dplyr::all_equal(toy_data, rbind(result$train, result$test)))
})


test_that("Check that the x portions of the data only contain the X columns", {
  toy_data = tibble::tibble(
    col1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    col2 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
    col3 = c(0, 1, 1, 0, 0, 0, 1, 0, 0, 1)
  )
  result <-
    supervised_data(toy_data,
                    xcol = c('col1', 'col2'),
                    ycol = c('col3'))

  expect_equal(c('col1', 'col2'), dimnames(result$x_train)[[2]])
  expect_equal(c('col1', 'col2'), dimnames(result$x_test)[[2]])
})

test_that("Check that the y portions of the data only contain the Y columns", {
  toy_data = tibble::tibble(
    col1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    col2 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
    col3 = c(0, 1, 1, 0, 0, 0, 1, 0, 0, 1)
  )
  result <-
    supervised_data(toy_data,
                    xcol = c('col1', 'col2'),
                    ycol = c('col3'))

  expect_equal(c('col3'), dimnames(result$y_train)[[2]])
  expect_equal(c('col3'), dimnames(result$y_test)[[2]])
})

test_that("Check that errors are raised with invalid inputs", {
  toy_data = tibble::tibble(
    col1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    col2 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
    col3 = c(0, 1, 1, 0, 0, 0, 1, 0, 0, 1)
  )

  expect_error(supervised_data(1,
                               xcols = c('col1', 'col2'),
                               ycols = c('col3')))

  expect_error(supervised_data(toy_data,
                               xcols = 1,
                               ycols = c('col3')))


  expect_error(supervised_data(toy_data,
                               xcols = c('col1', 'col2'),
                               ycols = 1))
})
