---
title: "README"
author: "Abraham Antony"
date: "27 April 2019"
output: html_document
---
##Basic information
Related file: run_analysis.R
Version: 1.0

##Introduction:

This R script is used to clean a dataset available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Prequisites:

In order to run this file, the following files are required to be present in the same directory (should be directly in the directory and not within subdirectories):

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample in the training set.

In addition the library dplyr is required.

##Usage:
The R script run_analysis.R contains a single function called cleandata() which takes no arguments.
In an R console, with the working directory set to the location containing both the run_analysis.R file as well as the data files as detailed below, the follow commands may be run:

>>library(dplyr)

>> source("run_analysis.R")

>> cleandata()


##Output:
If all files are present, tidy data will be generated in a file in the same directory. The name of the file will be Output.txt.


###Notes:
For more detail on the transformations and format of output, please see the accompanying Codebook.md file.