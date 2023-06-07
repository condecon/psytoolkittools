#'Parse survey file
#'@description This function returns a survey opject that holds information on the survey.
#'The survey data is retrieved from survey.txt

#'@export
parse.survey <- function(){
  s <- survey_parser()
  
  return(s)
}


#============HIDDEN========================
survey_parser <- function() {
  contents <- readLines("psy_data/survey.txt")
  
  #remove all empty lines
  contents <- contents[contents != ""]
  
  #create questions variable
  questions <- question()
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
      #remove null values
      q <- remove.null(q)
      #append current question to questions vector
      questions <- add.question(questions, q)
      #create new questions
      q <- question()
    }
    
    
  }
  #add last question to vector
  #remove null values
  q <- remove.null(q)
  #append current question to questions vector
  questions <- add.question(questions, q)
  class(questions) <- "survey"
  #return question
  return(questions)
}


remove.null <- function(question){
  
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
  
  
  return(question)
  
}


add.question <- function(questions, q){
  questions$label <- append(questions$label, q$label)
  questions$question <- append(questions$question, q$question)
  questions$option <- append(questions$option, q$option)
  questions$answers <- append(questions$answers, q$answers)
  
  return(questions)
}

