#'Survey object (S3)
#' @describeIn summary.survey survey object
#' @export
survey <- function(){
  s <- list()
  class(s) <- "survey"
  
  return(s)
}


#'Survey Summary
#'@description This function gives a summary of a survey.
#'It displays information on each question, such as label, question, and options.
#' @param object survey object
#'
#'@export
#'@importFrom cli cli_alert_info
#'@importFrom glue glue

summary.survey <- function(object){
  survey <- object
  
  cli::cli_alert_info("Survey Information")
  
  for(i in c(1:length(survey$label))){
    cat(glue::glue("Question {i}"), fill = T)
    cat(glue::glue("Label: {survey$label[i]}"), fill = T)
    cat(glue::glue("{survey$question[i]}"), fill = T)
    cat(glue::glue("Options: {survey$option[i]}"), fill = T)
    
    cat("", fill = T)
  }
}
