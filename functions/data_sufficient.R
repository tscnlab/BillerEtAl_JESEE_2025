#function to check data availability
data_sufficient <- function(vector, data_availability_th){
  stopifnot(is.vector(vector))
  prop_present <- (sum(!is.na(vector))/length(vector)) 
  prop_present >= data_availability_th
}
