#' Recode Keys
#'
#' @param vector A vector of key values
#' @param keys A vector of keys. Those keys have to be in the same order than
#' in your experiment code.
#'
#' @return numeric
#' 
#' @export
#' @examples
recode.keys = function(vector, keys){
  v = as.character(vector)
  k = as.character(keys)
  result = psytoolkittools:::recode_keys_c(v, k)
 
  return(result)
}
