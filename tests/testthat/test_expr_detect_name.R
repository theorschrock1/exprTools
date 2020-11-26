library(exprTools)
context("expr_detect_name")
library(sDevTools)
library(rlang)
test_that("expr_detect_name(expr(glue_data(dt, \"Hello {name}, you are {get_age(name)} years old.\")), \n    name = \"glue_data\", search_in_strings = FALSE)", 
    {
        output <- {
            expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
                name = "glue_data", search_in_strings = FALSE)
        }
        expect_equal(test_summary(output), list(N = 1L, class = "logical", 
            values = TRUE))
    })
test_that("expr_detect_name(expr(glue_data(dt, \"Hello {name}, you are {get_age(name)} years old.\")), \n    name = \"glue_data\", search_in_strings = TRUE)", 
    {
        output <- {
            expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
                name = "glue_data", search_in_strings = TRUE)
        }
        expect_equal(test_summary(output), list(N = 1L, class = "logical", 
            values = FALSE))
    })
test_that("expr_detect_name(expr(glue_data(dt, \"Hello {name}, you are {get_age(name)} years old.\")), \n    name = \"get_age\", search_in_strings = FALSE)", 
    {
        output <- {
            expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
                name = "get_age", search_in_strings = FALSE)
        }
        expect_equal(test_summary(output), list(N = 1L, class = "logical", 
            values = FALSE))
    })
test_that("expr_detect_name(expr(glue_data(dt, \"Hello {name}, you are {get_age(name)} years old.\")), \n    name = \"get_age\", search_in_strings = TRUE)", 
    {
        output <- {
            expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
                name = "get_age", search_in_strings = TRUE)
        }
        expect_equal(test_summary(output), list(N = 1L, class = "logical", 
            values = TRUE))
    })
