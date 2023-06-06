#'@export 

survey_parser <- function() {
    contents <- readLines("psy_data/survey.txt")

    #remove all empty lines
    contents <- contents[contents != ""]
    
    #create vector<questions>
    questions <- data.frame()
    #create question
    q <- question()
    for(line_index in c(1:length(contents))) {
      current_line <- contents[line_index]

      #check for question label
      if(startsWith(current_line, prefix = "l:")) {
        q$label <- gsub("l: ", replacement = "", current_line)
    }

      #check for question expression
      if(startsWith(current_line, prefix = "q:")) {
        q$question <- gsub("q: ", replacement = "", current_line)
    }

      #check for question option
      if(startsWith(current_line, prefix = "o:")) {
        q$option <- gsub("o: ", replacement = "", current_line)
    }


      #check for question answers
      if(startsWith(current_line, prefix = "-")) {
        awnser <- gsub("- ", replacement = "", current_line)
        #append read answer to answers vector of question
        q$answers <- append(q$answers, awnser)
      }
      
      #check if a new questions begins by reading the nextline
      if(!is.na(contents[line_index + 1]) & startsWith(contents[line_index + 1], prefix = "l:") ){
        #append current question to questions vector
        questions <- rbind(questions, as.vector.question(q))
        #create new questions
        q <- question()
      }
      
    
    }
    #add last question to vector
    questions <- rbind(questions,as.vector.question(q))
    
    colnames(questions) <- c(
      "label", "question", "option"
    )

  #return question
  return(questions)
}


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

#' S3 method for converting a question to a vector
#' @method as.vector question
#' @export
as.vector.question <- function(question){

  #perform null checks and convert any null value to NA
  if(is.null(question$label)){
    question$label <- NA
  }
  
  if(is.null(question$question)){
    question$question <- NA
  }
  
  if(is.null(question$option)){
    question$option <- NA
  }
  
  if(is.null(question$answers)){
    question$answers <- NA
  }
  
  #answers cannot be added to data frame because they are vectors themselves
  vec <- c(question$label, question$question, question$option)
  
  return(vec)
  
}
