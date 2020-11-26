library(exprTools)
init <- {
    library(sDevTools)
    library(rlang)
}
expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
    name = "glue_data", search_in_strings = FALSE)
expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
    name = "glue_data", search_in_strings = TRUE)
expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
    name = "get_age", search_in_strings = FALSE)
expr_detect_name(expr(glue_data(dt, "Hello {name}, you are {get_age(name)} years old.")), 
    name = "get_age", search_in_strings = TRUE)
