# Coursera Getting and Cleaning Data Final Project

This repo contains the final project of the Coursera Data Science course track "Getting and Cleaning Data" of John Hopkins University.

The purpose of the project is to demonstrate ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. Required to submit: 1) a tidy data set, 
2) a link to a Github repository with script for performing the analysis, and 3) a code book that describes the variables, 
the data, and any transformations or work that performed to clean up the data called CodeBook.md.

# Files

1. CodeBook.md contains describes the variables, the data, and any transformations or work that performed to clean up the data
and create tidy data set.
2. run_analysis.R contains R script that
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
3. tidyset.txt is the result of step 5 in run_analysis.R