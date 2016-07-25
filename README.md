# README for 'GettingCleaningData' repo

This repo includes the R script that performs the data transformation as per the course project instructions, plus a Code Book describing the variables, the data, and the transformations performed to the original source data set.

## The R script is required to:

1. Merge the original training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Apply descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


## The R script functions as follows:

* Load Required Packages
* Download and Un-Zip the Source Data
* Read Downloaded Files and Create Working Data Tables & Data Frames
* Merge the Training and Test Data Sets to Create One Overall Set of Data
* Label Variables According to Name of Feature 
* Set Column Names for Activity Labels
* Merge Columns to Create Single Data Set
* Extract Only the Mean and Standard Deviation Measurements For Each Measurement Observation
* Creates an independent tidy data set with the average of each variable for each activity and each subject
* Descriptive Naming of the Activities for both original merged data set and newly created (averages) data set
* Save new tidy data set (with the average of each variable for each activity and each subject) to local working directory

