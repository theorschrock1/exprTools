test_that("exprs_eval",
    {
    local_edition(3)
            x <- exprs(x <- 3, y <- 4, z <- x + y)
            out<-exprs_eval(x)
            expect_snapshot(out)
    })
