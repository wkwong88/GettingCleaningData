##  run_analysis.R

##  Load Required Packages
library(plyr)
library(dplyr)
library(tidyr)
library(data.table)


##  Download and Un-Zip the Source Data

wd_path <- "~/Coursera/3.Getting and Cleaning Data/Week4/Assignment"
setwd(wd_path)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="Dataset.zip")
unzip(zipfile="./Dataset.zip", exdir=".")


##  Read Files and Create Data Tables

##  Read Subject Files
subject_train <- read.table(file.path(wd_path, "UCI HAR Dataset", "train", "subject_train.txt"))
subject_test  <- read.table(file.path(wd_path, "UCI HAR Dataset", "test",  "subject_test.txt"))

##  Read Activity Lable files
activity_train <- read.table(file.path(wd_path, "UCI HAR Dataset", "train", "y_train.txt"))
activity_test  <- read.table(file.path(wd_path, "UCI HAR Dataset", "test",  "y_test.txt"))

##  Read Data Files
data_train <- read.table(file.path(wd_path, "UCI HAR Dataset", "train", "X_train.txt" ))
data_test  <- read.table(file.path(wd_path, "UCI HAR Dataset", "test",  "X_test.txt" ))


##  (1) Merge the Training and Test Data Sets to Create One Overall Set of Data

all_subject <- rbind(subject_train, subject_test)
setnames(all_subject, "V1", "subject")

all_activity <- rbind(activity_train, activity_test)
setnames(all_activity, "V1", "activityNum")

all_data <- rbind(data_train, data_test)


##  (4) Label Variables According to Name of Feature 

data_features <- read.table(file.path(wd_path, "UCI HAR Dataset", "features.txt"))
setnames(data_features, names(data_features), c("featureNum", "featureName"))
colnames(all_data) <- data_features$featureName


##  Column Names for Activity Labels
activity_labels <- read.table(file.path(wd_path, "UCI HAR Dataset", "activity_labels.txt"))
setnames(activity_labels, names(activity_labels), c("activityNum","activityName"))


##  Merge Columns
all_subject_activity <- cbind(all_subject, all_activity)
all_data <- cbind(all_subject_activity, all_data)



##  (2) Extract Only the Mean and Standard Deviation Measurements For Each Measurement Observation

mean_and_std_cols <- grep("subject|activityNum|mean\\(\\)|std\\(\\)", colnames(all_data))
mean_and_std_all_data <- all_data[ , mean_and_std_cols]



##  (5) creates an independent tidy data set with the average of each variable for each activity and each subject.

mean_std_avg_by_activity_subject <- ddply(mean_and_std_all_data, .(activityNum, subject), colMeans)



##  (3) Descriptive Naming of the Activities for both original merged data set and newly created (averages) data set.

mean_and_std_all_data$activityNum <- as.factor(mean_and_std_all_data$activityNum)
levels(mean_and_std_all_data$activityNum) <- activity_labels$activityName
setnames(mean_and_std_all_data, "activityNum", "activityName")

mean_std_avg_by_activity_subject$activityNum <- as.factor(mean_std_avg_by_activity_subject$activityNum)
levels(mean_std_avg_by_activity_subject$activityNum) <- activity_labels$activityName
setnames(mean_std_avg_by_activity_subject, "activityNum", "activityName")



##  Save new tidy data set (with the average of each variable for each activity and each subject) 
##  to local working directory

write.table(mean_std_avg_by_activity_subject, "tidy_mean_std_avg_by_activity_subject.txt", row.name=FALSE)
