library(testthat)
library(psytoolkittools)
test_that(
  "Test: recode.status function",{
    expect_equal(
      recode.status(c(1,2,3), timeout = -99),
      c(1,0,-99)
    )
  }
)
