
#' Recode Status
#' @description
#' In PsyToolkit experiments, a status of 1 represents a correct and 2 an incorrect answer. 3 represents a time out.
#' With recode.status(), status codes can be recoded to custom values.
#' @param status_vector numeric vector of statuses. This vector will be recoded.
#' @param correct numeric value which indicates a correct response.
#' @param error numeric value which indicates an error.
#' @param timeout numeric value which indicates a timeout.
#'
#' @return numeric
#' @export
#'
#' @examples
#' recode.status(vector, correct = 1, error = 0, timeout = -99)
recode.status = function(status_vector, correct = 1, error = 0, timeout = NA){
  return(as.numeric(psytoolkittools:::recode_status_c(as.character(status_vector), 
                                                      as.character(correct), 
                                                      as.character(error), 
                                                      as.character(timeout))))

}