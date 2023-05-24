#' Load Experiment
#' @description This function loads experiment data from a PsyToolkit experiment
#' Therefore, a vector of file names and a vector of labels which represents the
#' structure of the experiment file have to be provided.
#' The experiment data has to be located in the `psy_data/experiment_data` directory.
#' Otherwise, loading the experiment will fail.
#' @param experiment.file.names A vector of experiment file names 
#' @param label.structur A vector of labels that represents the structure of the saved experiment value
#' @param merge.dataframe The result of this function can be directly added to a existing data frame (e.g. survey data).
#' The default value is NA.
#'
#' @return data.frame
#' @export
#' @importFrom "stats" "setNames"
#' @importFrom "utils" "read.csv"
#' @examples
load.experiment = function(experiment.file.names,label.structure, merge.dataframe = NA){
  
  #add path to experiment.file.names
  experiment.file.names = glue::glue("psy_data/experiment_data/{experiment.file.names}")
  
  
  
  d = data.frame()
  
  for(i in c(1:length(experiment.file.names))){
    data.list = .read.experiment.file(experiment.file.names[i])
    
    d = rbind(d, data.list)
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
