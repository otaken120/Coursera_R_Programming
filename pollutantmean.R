setwd("~/Desktop/Coursera_R_Programming")
pollutantmean <- function(directory, pollutant, id =1:332) {
  #set work directory,if exists specdata in the wd,then make the d is..
  if (grep("specdata",directory)==1) {
    directory <-("./specdata/")
  }
  
  #initialize a vector to hold the pollutant data
  mean_vector <- c()
  
  #find all files in the specdata folder
  all_files <- as.character(list.files(directory))
  #joint wd name and file name to be a new, full work directory
  #in case we can open each file automatically
  file_paths <- paste(directory,all_files,sep="")
  for (i in id) {
    #read one file and store to current_file with a ","
    current_file <- read.csv(file_paths[i], header=T,sep=",")
    #store files with values (no NA) into na_removed
    na_removed <- current_file[!is.na(current_file[,pollutant]),pollutant]
    #add new values to mean_vector
    mean_vector <-c(mean_vector,na_removed)
  }
  #get mean value from total mean_vector
  result <- mean(mean_vector)
  return(round(result,6))
  
}