#======Basic Load======

#UNZIP-Survey-Data
unzip_tool = function(file_path){
  unzip(file_path, exdir = "psy_data")
}

#load survey
load_survey_awnsers = function(){
  awnsers = read.csv(glue::glue("psy_data\\data.csv"))
  return(awnsers)
}

#========================Survey Parser===============================
#' Parse Survey (Hidden)
#' 
#' @import "reticulate"
#' @import "stringr"
#' @import "glue"

parse_survey = function(awnsers){
  #get package path
  package_path = path.package("psytoolkittools")
  #replace / with \\
  package_path = gsub("/", "\\\\", package_path)
  module_path = glue::glue("{package_path}\\python\\")
  
  #import module
  parse_module = reticulate::import_from_path("survey_parser", path = module_path)
  #parse document
  document = parse_module$parse(".")
 
  list_of_question_labels = c()
  
  for(i in c(1:length(document))){
    list_of_question_labels = append(list_of_question_labels, document[[i]]$label)
  }
  
  list_of_question_types = c()
  
  for(i in c(1:length(document))){
    list_of_question_types = append(list_of_question_types, document[[i]]$type)
  }
  
  #remove newline of question_labels
  list_of_question_labels = gsub("\n", "", list_of_question_labels)
  list_of_question_types = gsub("\n", "", list_of_question_types)
  
  
  
  #get index of all radio questions
  index_of_radio_questions = which(list_of_question_types == "radio")
  #get names of radio questions#
  names_of_radio_questions = list_of_question_labels[index_of_radio_questions]
  
  
  #get survey awnser index of radio questions
  survey_radio_index = c()
  for(i in c(1:length(names_of_radio_questions))){
    res = stringr::str_which(colnames(awnsers), names_of_radio_questions[i])
    
    survey_radio_index = append(res, survey_radio_index)
  }
  
  
  #convert columns which are "radio" questions to factors
  for(i in c(1:length(survey_radio_index))){
    awnsers[,survey_radio_index[i]] = as.factor(awnsers[,survey_radio_index[i]])
  }
  
  
  return(awnsers)
}


#============Load Survey============
#'Load Survey
#'@description This functions loads the answers of a PsyToolkit survey from the specified .ZIP file.
#'This file will be unzipped in the folder `psy_data`. Do not remove this folder for further use such as reading experiment data.
#'@param filename File name of the .ZIP file that has been downloaded from PsyToolkit
#'@export
#'@return data.frame
load.survey = function(filename){
  unzip_tool(filename)
  
  awnsers = load_survey_awnsers()
  awnsers = parse_survey(awnsers)
  
  return(awnsers)
}
