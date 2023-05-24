
#' Recode Status
#' @description This function recodes the status variable to custom values.
#' @param status_vector Numeric vector of statuses. This vector will be recoded.
#' @param correct Numeric value which indicates a correct response.
#' @param error Numeric value which indicates an error.
#' @param timeout Numeric value which indicates a timeout.
#'
#' @return numeric
#' @export
#'
#' @examples
recode.status = function(status_vector, correct = 1, error = 0, timeout = NA){
  return(as.numeric(psytoolkittools:::recode_status_c(as.character(status_vector), 
                                                      as.character(correct), 
                                                      as.character(error), 
                                                      as.character(timeout))))

}