library(testthat)

testthat::test_that(
  "Test: recode keys",{
    v = c(1,2,3)
    lab = c(3,2,1)
    testthat::expect_equal(recode.keys(v, lab), c(3,2,1))
  }
)




