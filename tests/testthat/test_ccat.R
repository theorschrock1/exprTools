test_that("ccat", {
  local_edition(3)
  expect_snapshot(ccat(x = c("a", "b", "c")), cran = TRUE)
})
