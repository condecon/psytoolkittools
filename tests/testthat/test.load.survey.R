library(testthat)
library(psytoolkittools)

expected_survey_data = data.frame(
  age = c(19,60,30,34),
  group1 = c("G11.txt", NA, "G12.txt", NA),
  group2 = c(NA, "G21.txt", NA, "G22.txt")
)

class(expected_survey_data) = c("spec_tbl_df","tbl_df","tbl","data.frame")

test_that(
  "Test: load survey data with dummy files",
  {
    expect_equal(load.survey("dummy_data.zip"), expected = expected_survey_data)
  }
  
)
