# CodeBook

## Introduction

The dataset used in the final project is the "Human Activity Recognition Using Smartphones Dataset" that can be
downloaded in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The dataset is divided to training and test dataset. Following are different files in the dataset used: X_train(test) 
observations in the 532 features or variables, Y_train(test) is the label or the activity performed,and subject_train(test) 
text files is identifier of the subject who carried out the experiment, features contains all variable vector and 
activity_label the discription of the activity label value in Y_train(test) set.

## Variables
Of 532 features, the requirement only is the mean and std of 

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Furthermore, activity lables include  WALKING  (value  1 ): subject was walking during the test,  WALKING  (value  1 ): subject was walking during the test,
WALKING_DOWNSTAIRS  (value  3 ): subject was walking down a staircase during the test,  WALKING_DOWNSTAIRS  (value  3 ): subject was walking down a staircase during the test,
STANDING  (value  5 ): subject was standing during the test,  LAYING  (value  6 ): subject was laying down during the test

## Details

The run_analysis.R contains all the steps to obtain a tidy dataset. dplyr package be utilize in the process.
1. First, it will download and store the data from the URL in my working directory under data folder and zip it there.
2. Then, it will read the file X_train(test), Y_train(test) and subject_train(test) using read.table function. It will
   load as well the feature vector to name all the column variable later and the activity_label.
3. Before merging all train files and test files, it will create an additional variable in Y_train(test) named "dataset" with
   value "train;test". This way we can have more analysis and summary per dataset and useful when modeling and testing the model.
4. Column bind subject, Y and X train set, same with test. Then Row bind train and test into one dataset.
5. Names of the variable is then added using the 532 features for columns from X, then for subject and Y is c("subjectId",
   "activityId", "dataset")
6. Final step for getting a tidy data set is extract only variable or features of 532 with word "mean" or std using combination of
grepl to column names and column subsetting.
7. Last process in the script is creating another dataset based on previous tidy set with the average of each variable for each activity and each subject
   using aggregate function.