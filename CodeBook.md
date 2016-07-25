# Code Book for 'Getting and Cleaning Data' course project
## Description of the original source data
The original data set represent data collected from the accelerometers of the Samsung Galaxy S smartphone.  Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.  Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data, and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

* An identifier of the subject who carried out the experiment.
* Its activity label.
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
 
The following original files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.


Feature Selection 

The features selected for this data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is outlined in 'features.txt'


## Transformations of original source data performed for this course project
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Apply descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

From the merged origibal data, 10299 observations were split into 180 groups (30 subjects and 6 activities).  There are a total of 68 features of the new tidy data set (33 mean variables, 33 standard deviation variables, subject, activityName).

The new tidy data set containing the averages of only the mean and standard deviation variables consist of 180 observations (30 subjects and 6 activities) of 68 variables, as shown below:

'data.frame':	180 obs. of  68 variables:

 $ subject                    : num  
 $ activityName               : Factor w/ 6 levels 
 $ tBodyAcc-mean()-X          : num  
 $ tBodyAcc-mean()-Y          : num  
 $ tBodyAcc-mean()-Z          : num  
 $ tBodyAcc-std()-X           : num  
 $ tBodyAcc-std()-Y           : num  
 $ tBodyAcc-std()-Z           : num  
 $ tGravityAcc-mean()-X       : num  
 $ tGravityAcc-mean()-Y       : num  
 $ tGravityAcc-mean()-Z       : num  
 $ tGravityAcc-std()-X        : num  
 $ tGravityAcc-std()-Y        : num  
 $ tGravityAcc-std()-Z        : num  
 $ tBodyAccJerk-mean()-X      : num  
 $ tBodyAccJerk-mean()-Y      : num  
 $ tBodyAccJerk-mean()-Z      : num  
 $ tBodyAccJerk-std()-X       : num  
 $ tBodyAccJerk-std()-Y       : num  
 $ tBodyAccJerk-std()-Z       : num  
 $ tBodyGyro-mean()-X         : num  
 $ tBodyGyro-mean()-Y         : num  
 $ tBodyGyro-mean()-Z         : num  
 $ tBodyGyro-std()-X          : num  
 $ tBodyGyro-std()-Y          : num  
 $ tBodyGyro-std()-Z          : num  
 $ tBodyGyroJerk-mean()-X     : num  
 $ tBodyGyroJerk-mean()-Y     : num  
 $ tBodyGyroJerk-mean()-Z     : num  
 $ tBodyGyroJerk-std()-X      : num  
 $ tBodyGyroJerk-std()-Y      : num  
 $ tBodyGyroJerk-std()-Z      : num  
 $ tBodyAccMag-mean()         : num  
 $ tBodyAccMag-std()          : num  
 $ tGravityAccMag-mean()      : num  
 $ tGravityAccMag-std()       : num  
 $ tBodyAccJerkMag-mean()     : num  
 $ tBodyAccJerkMag-std()      : num  
 $ tBodyGyroMag-mean()        : num  
 $ tBodyGyroMag-std()         : num  
 $ tBodyGyroJerkMag-mean()    : num  
 $ tBodyGyroJerkMag-std()     : num  
 $ fBodyAcc-mean()-X          : num  
 $ fBodyAcc-mean()-Y          : num  
 $ fBodyAcc-mean()-Z          : num  
 $ fBodyAcc-std()-X           : num  
 $ fBodyAcc-std()-Y           : num  
 $ fBodyAcc-std()-Z           : num  
 $ fBodyAccJerk-mean()-X      : num  
 $ fBodyAccJerk-mean()-Y      : num  
 $ fBodyAccJerk-mean()-Z      : num  
 $ fBodyAccJerk-std()-X       : num  
 $ fBodyAccJerk-std()-Y       : num  
 $ fBodyAccJerk-std()-Z       : num  
 $ fBodyGyro-mean()-X         : num  
 $ fBodyGyro-mean()-Y         : num  
 $ fBodyGyro-mean()-Z         : num  
 $ fBodyGyro-std()-X          : num  
 $ fBodyGyro-std()-Y          : num  
 $ fBodyGyro-std()-Z          : num  
 $ fBodyAccMag-mean()         : num  
 $ fBodyAccMag-std()          : num  
 $ fBodyBodyAccJerkMag-mean() : num  
 $ fBodyBodyAccJerkMag-std()  : num  
 $ fBodyBodyGyroMag-mean()    : num  
 $ fBodyBodyGyroMag-std()     : num  
 $ fBodyBodyGyroJerkMag-mean(): num  
 $ fBodyBodyGyroJerkMag-std() : num  
 
 
___________________________________________
