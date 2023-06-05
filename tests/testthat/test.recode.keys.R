library(psytoolkittools)
library(testthat)

testthat::test_that(
  "Test: recode.keys function",{
    
    testthat::expect_equal(
      psytoolkittools::recode.keys(
        vector = c(1,1,5,2,4,3),
        keys = c(1,2,3,4,"space")
      ),
      
      c(1,1,"space",2,4,3)
    )
  }
  
)
