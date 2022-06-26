test_that("check_not_in", {
  local_edition(3)
  expect_snapshot(check_not_in(x = "Jim", subset = c("Jim", "Bob"),
  empty.ok = FALSE), cran = TRUE)
  expect_snapshot(check_not_in(x = "", subset = c("Jim", "Bob"),
  empty.ok = FALSE), cran = TRUE)
  expect_snapshot(check_not_in(x = "", subset = c("Jim", "Bob"),
  empty.ok = TRUE), cran = TRUE)
  expect_snapshot(check_not_in(x = "Tim", subset = c("Jim", "Bob"),
  empty.ok = FALSE), cran = TRUE)
})
