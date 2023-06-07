#'Question object (S3)
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
