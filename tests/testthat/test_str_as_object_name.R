test_that("str_as_object_name", {
  local_edition(3)
  expect_snapshot(str_as_object_name(x = c("sdf", "sf", "safd`", "sdf a ", "123sd",
    "sadf{}sa", "sdf_sdf", "faf(1)", "fds2", "dsf.fs", "sdf$fds")), cran = TRUE)
})
