test_that("expr_detect_name", {
    local_edition(3)
    expect_snapshot(expr_detect_name(expr(
        glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")
    ),
    name = "glue_data",
    search_in_strings = FALSE))

    expect_snapshot(  expr_detect_name(expr(
        glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")
    ),
    name = "glue_data",
    search_in_strings = TRUE))
    expect_snapshot( expr_detect_name(expr(
        glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")
    ),
    name = "get_age",
    search_in_strings = FALSE))


    expect_snapshot( expr_detect_name(expr(
        glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")
    ),
    name = "get_age",
    search_in_strings = TRUE))
})
