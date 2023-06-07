#'psytoolkittools question (S3)
#'@description This method is used for parsing the survey.txt file.
#'@export
question <- function() {
  q <- list(
    label = c(), 
    question = c(), 
    option = c(), 
    answers = c())
  
  class(q) <- "question"
  
  return(q)
  
}
