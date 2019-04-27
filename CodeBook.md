---
title: "Getting and Cleaning Data Course Project"
author: "Abraham Antony"
date: "27 April 2019"
output: html_document
---

#Data and Variables

The data used represents data collected from the accelerometers from the Samsung Galaxy S smartphone through experiments. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#The following files were used:


- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


#Transformations performed on the data

1. The training and test sets were combined with the label and subject information. 
2. The activity identifiers were modified to be descriptive activity names 
3. The training and test sets were merged
4. All variables removed except for mean and standard deviation measurements
5. Labels were improved with the following changes:
  std() replaced SD
  mean() replaced with Mean
  Freq() replaced with _Frequency
  t at the begining of variable names changed to time
  f at the beginning of variable names changed to frequency
  Acc explanded to Accelerometer
  Gyro expanded to Gyroscope
  Mag expanded to Magnitude
  "-" replaced by "_"
6. An independent tidy data set with the average of each variable for each activity and each subject is generated in a separate file.