#' Recode Keys
#' @description
#' In PsyToolkit, when saving keys, the pressed key itself is not saved instead the position in which the key was defined is saved. 
#' For further analysis, it can be helpful to reverse the saved value to the name of the original key that has been pressed by the participant. 
#' In this case recode.keys() can be used.
#' 
#' @param vector vector of key values
#' @param keys vector of keys. Those keys have to be in the same order than
#' in your experiment code.
#'
#' @return character
#' 
#' @export
#' @examples 
#' recode.keys(c(1,1,2,3,5), c(1,2,3,4,"space", "none"))

recode.keys = function(vector, keys){
  v <- as.character(vector)
  k <- as.character(keys)
  
  for(i in c(1:length(v))){
    #vector item i should now be the value at the position k[v[i]]
    v[i] <- k[as.numeric(v[i])]
  }
  
 
  return(v)
}
