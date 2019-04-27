##############################################################
# Filename: run_analysis.R
# Author: Abraham Antony
# Version: 1.0
# Date: 27/4/2019
################################################################


#To run the data tidying, just run cleandata() from a console, with required files in place

cleandata <- function() {

#Step 0: Check presence of files.
  trainfilelist <-c("subject_train.txt","X_train.txt","y_train.txt")
  testfilelist <- c("subject_test.txt","X_test.txt","y_test.txt")
  commonfilelist <-c("activity_labels.txt","features.txt")
  combinedfilelist <-c(trainfilelist,testfilelist,commonfilelist)
  missing <-""
  
  for(x in combinedfilelist) {
    if(file.exists(x) == FALSE) {
      if(missing=="")
        missing <- x
      else
      missing <-paste(missing,", ",x)
    }
    
  }
  if(missing != "") return (paste("Missing file(s): ",missing, ". Place the file(s) in the current directory and try again"))

  #Step 1: Consolidate test and train data while incorporating subject and activity (human readable form) data
  
  activity_list <-read.table(commonfilelist[1]) 
  
  traindata <-read.table(trainfilelist[2])
  subjectdata <- read.table(trainfilelist[1], header = FALSE)
  activity_observation <- read.table(trainfilelist[3])
  activitydata <-merge(activity_observation,activity_list,all.x = TRUE)
  
  train_fullset <-cbind(subjectdata,activitydata[2],traindata)
  
  testdata <-read.table(testfilelist[2])
  subjectdata <- read.table(testfilelist[1], header = FALSE)
  activity_observation <- read.table(testfilelist[3])
  activitydata <-merge(activity_observation,activity_list,all.x = TRUE)
  
  test_fullset <-cbind(subjectdata,activitydata[2],testdata)
  
  complete_set <- rbind(train_fullset,test_fullset)
  
  #Step 2: Truncate list to only include mean and standard deviation variables
 
  feature_list <- read.table(commonfilelist[2])
  
  features <- as.vector(feature_list$V2)
  
  names(complete_set)  <- c("Subject", "Activity", features)
  cols <- grep("mean()|std()|Activity|Subject", names(complete_set), value = TRUE)
  
  trunc_set <- complete_set[, cols]
  
  #Step 3: Rename variables for clarity
  
  names(trunc_set)<-gsub("std()", "SD", names(trunc_set), fixed = TRUE)
  names(trunc_set)<-gsub("mean()", "Mean", names(trunc_set), fixed = TRUE)
  names(trunc_set)<-gsub("Freq()", "_Frequency", names(trunc_set),fixed = TRUE)
  names(trunc_set)<-gsub("^t", "time", names(trunc_set))
  names(trunc_set)<-gsub("^f", "frequency", names(trunc_set))
  names(trunc_set)<-gsub("Acc", "Accelerometer", names(trunc_set))
  names(trunc_set)<-gsub("Gyro", "Gyroscope", names(trunc_set))
  names(trunc_set)<-gsub("Mag", "Magnitude", names(trunc_set))
  names(trunc_set)<-gsub("-", "_", names(trunc_set))
  
 
  #Step 4: Tidy data by grouping by activity and Subject and reporting mean values
  
  trunc_set2 <- trunc_set %>% group_by(Subject,Activity)
  
  output <- trunc_set2 %>% summarise_all(mean)
  
  #Step 5: Generate output file with tidy data
  
  write.table(output,"Output.txt", row.names = FALSE)
  
}