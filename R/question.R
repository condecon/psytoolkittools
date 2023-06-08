#'Question object (S3)
#'@description This is a S3 object that represents a survey question.
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
