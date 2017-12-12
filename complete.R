setwd("~/Desktop/Coursera_R_Programming")
complete <- function(directory, id= 1:332) {
  #set work directory
  if (grep("specdata",directory)==1) {
    directory <-("./specdata/")
  }
  
  id_len <-length(id)
  complete_data <-rep(0,id_len) #store 0 to complete_data for id_len times
  
  all_files<-as.character(list.files(directory))
  file_paths<-paste(directory,all_files,sep="")
  j<-1
  for (i in id){
    current_file <- read.csv(file_paths[i],header=TRUE,sep=",")
    complete_data[j]<-sum(complete.cases(current_file))
    j<-j+1
  }
  result<-data.frame(id=id,nobs=complete_data)
  return(result)
}
