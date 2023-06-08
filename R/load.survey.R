#======Basic Load======

#UNZIP-Survey-Data
#' @importFrom "utils" "unzip"
unzip_tool <- function(file_path){
  unzip(file_path, exdir = "psy_data")
}

#load survey
#' @importFrom "readr" "read_csv"
load_survey_awnsers <- function(){
  awnsers <- readr::read_csv(glue::glue("psy_data/data.csv"))
  return(awnsers)
}

#============Load Survey============
#'Load Survey
#'@description This functions loads the answers of a PsyToolkit survey from the specified .ZIP file.
#'This file will be unzipped into the folder `psy_data`. Do not remove this folder if you want to do further analysis on the experiment data.
#'@param filename File name of the .ZIP file that has been downloaded from PsyToolkit
#'@export
#'@return data.frame
load.survey = function(filename){
  unzip_tool(filename)
  awnsers = load_survey_awnsers()
  return(awnsers)
}