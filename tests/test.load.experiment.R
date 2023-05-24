library(testthat)
library(psytoolkittools)


survey_data <- data.frame(
  age = c(19, 60, 30, 34),
  group1 = c("G11.txt", NA, "G12.txt", NA),
  group2 = c(NA, "G21.txt", NA, "G22.txt")
)

survey_data$experiment_files <- ifelse(is.na(survey_data$group1), 
                                        survey_data$group2, 
                                        survey_data$group1)

expected_survey_data <- survey_data
expected_survey_data$RT <- c(1200, 1200, 1200, 1200)
expected_survey_data$V1 <- c(1, 1, 1, 1)
expected_survey_data$V2 <- c(2, 2, 2, 2)
expected_survey_data$V3 <- c(2, 2, 2, 2)
expected_survey_data$V4 <- c(5, 5, 5, 5)

test_that(
    "Test loading experiment results",
    {
        expect_equal(load.experiment(survey_data$experiment_files, 
        label.structure = c("RT", "V1", "V2", "V3", "V4"),
        merge.dataframe = survey_data),
        expected = expected_survey_data)   
    }
)
