library(testthat)
library(psytoolkittools)
test_that(
  "Test recode status",{
    expect_equal(
      recode.status(c(1,2,3)),
      c(1,0,NA)
    )
  }
)
