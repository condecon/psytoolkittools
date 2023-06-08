#' Load Experiment
#' @description This function loads experiment data from a PsyToolkit experiment
#' The experiment files have to be located in the `psy_data/experiment_data` directory.
#' @param experiment.file.names vector of experiment file names 
#' @param label.structure vector of labels that represent the structure of a experiment data file
#' @param merge.dataframe The result of this function can be directly added to a existing data frame (e.g. survey data). The default value is NA.
#'
#' @return data.frame
#' @export
#' @importFrom "stats" "setNames"
#' @importFrom "utils" "read.csv"
#' @importFrom "glue" "glue"
#' 
load.experiment = function(experiment.file.names,label.structure, merge.dataframe = NA){
  
  #if file name is not NA add path to experiment.file.names
  experiment.file.names = ifelse(is.na(experiment.file.names), NA, glue::glue("psy_data/experiment_data/{experiment.file.names}"))
  
  d = data.frame()
  
  #loop through experiment.file.names
  for(i in c(1:length(experiment.file.names))){
    #if the current entry is NA, append NA a list of NA with the length of the
    #label structure to the dataframe
    if(is.na(experiment.file.names[i])){
      list_na = rep(NA, length(label.structure))
      d = rbind(d, list_na)
    }
    #if the entry is not NA,
    #read the experiment files and append the results to the data frame
    else{
      data.list = .read.experiment.file(experiment.file.names[i])
      d = rbind(d, data.list)
    }
    
  }
  
  d = setNames(d, label.structure)
  
  
  
  ### add to existing dataframe?
  if(missing(merge.dataframe)){
    return(d)
  }
  else{
    return(cbind(merge.dataframe, d))
  }

}

.read.experiment.file = function(filename){
  experiment.data = read.csv(filename, sep =" ", header = FALSE)
  
  
  data.vector = c()
  
  for(row in c(1:nrow(experiment.data))){
    for(entry in c(1:length(experiment.data[row, ]))){
      
      e = experiment.data[row, entry]
      if(!is.na(e)){
        data.vector = append(data.vector, as.integer(e))
      }
    }
  }
  
  return(data.vector)
}
