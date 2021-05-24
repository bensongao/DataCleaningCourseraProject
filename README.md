# Data Cleaning for Human Activity Recognition Using Smartphones Data Set
Used for cleaning the data set provided [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Cleaing Process
Given that the relevant data are placed in the working directory, the run_analysis.R script performs the following:
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Output
A tidy dataset, tidyData2.txt, that contains the average of each variable for each activity performed by each subject.