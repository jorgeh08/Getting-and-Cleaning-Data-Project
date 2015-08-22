# Getting-and-Cleaning-Data-Project
This is the project assignment for the Getting and Cleaning Data course 

This is a script (run_analyss.R) that creates a tidy dataset (tidy.txt) from the data provided by the Human Activity Recognition Using Smartphones Data Set.

For more information, visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# 

The scrip performs the following operations:

 1. Loads the features, subjects, activities, test and train files
 2. Merges the test and train data sets, including subject and activity information
 3. From the previous information subsets the Mean & Std Dev Features
 4. Adds appropiate column names for the Subject, Activities and Features 
 5. Summarizes the data by Subject and Activity
 6. And creates a data text file called: "tidy.txt"
