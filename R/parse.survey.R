#'parse.survey
#'@description This function returns a survey opject that holds
#'information on the survey
#'@usage 
#'survey <- parse.survey()
#'summary(survey)
#'@export
#'
parse.survey <- function(){
  survey <- psytoolkittools::survey_parser()
  
  class(survey) <- "survey"
  
  return(survey)
}


#'@export
#'@importFrom cli cli_alert_info
#'@importFrom glue glue
summary.survey <- function(survey){
  cli::cli_alert_info("Survey Information")
  
  for(i in c(1:length(survey$label))){
    cat(glue::glue("Question {i}"), fill = T)
    cat(glue::glue("Label: {survey$label[i]}"), fill = T)
    cat(glue::glue("{survey$question[i]}"), fill = T)
    cat(glue::glue("Options: {survey$option[i]}"), fill = T)
   
    cat("", fill = T)
  }
}
