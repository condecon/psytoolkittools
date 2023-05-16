library(testthat)
library(psytoolkittools)


#dummy file name vector
ex_files = c("dummy.txt")


testthat::test_that(
  "Load Experiment Data",
  {
    expect_equal(
      psytoolkittools::load.experiment.data(
        ex_files,
        c("RT", "STATUS", "KEY", "RT2")),
      #expected:
      data.frame(
        RT = 123L,
        STATUS = 1L,
        KEY = 3L,
        RT2 = 123L
      )
    )
  }
)
