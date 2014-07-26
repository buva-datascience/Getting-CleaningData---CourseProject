<!---------------------------------------------
title: "CodeBook.md"
author: "Buva Ramamoorthy"
date: "July 23, 2014"
output: MarkDown Document
----------------------------------------------->
        
# **Getting and Cleaning Data - Course Project**
        
*by Buva Ramamoorthy*
        
This is a repository which is created for the project submission for the course Getting and Cleaning Data  
by John Hopkins University

## Overview
The purpose of this cookbook document is to provide details about the data collection, transformation, cleaning   
and working steps on a data set. You can refer this document to know more details on the data and variable  
descriptions used in the course project for the John Hopkins University Getting and Cleaning Data course.

## Source Data
For this course we will be considering the wearable computing data collected by few companies. The data linked  
for this course represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full  
description of the data is available at [UCI Machine Learning Repository](http://http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

[Click here to find the source data for the project:](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

## DataSet Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each  
person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we  
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments  
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two  
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled   
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,  
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body   
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a   
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating  
variables from the time and frequency domain. 

## Dataset definition & information 
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- **features_info.txt**:        Shows information about the variables used on the feature vector.
- **features.txt**:             List of all features.
- **activity_labels.txt**:      Links the class labels with their activity name.
- **train/X_train.txt**:        Training set.
- **train/y_train.txt**:        Training labels.
- **test/X_test.txt**:          Test set.
- **test/y_test.txt**:          Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- **train/subject_train.txt**:  Each row identifies the subject who performed the activity for each window
                                sample. Its range is from 1 to 30. 
- **train/Inertial Signals/total_acc_x_train.txt**: The acceleration signal from the smartphone accelerometer
                                X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies
                                for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- **train/Inertial Signals/body_acc_x_train.txt**: The body acceleration signal obtained by subtracting the
                                gravity from the total acceleration. 
- **train/Inertial Signals/body_gyro_x_train.txt**: The angular velocity vector measured by the gyroscope for each
                                window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

###Feature Selection: 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered   
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly,  
the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ 
and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm   
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ,   
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
        
-mean():        Mean value
-std():         Standard deviation
-mad():         Median absolute deviation 
-max():         Largest value in array
-min():         Smallest value in array
-sma():         Signal magnitude area
-energy():      Energy measure. Sum of the squares divided by the number of values. 
-iqr():         Interquartile range 
-entropy():     Signal entropy
-arCoeff():     Autorregresion coefficients with Burg order equal to 4
-correlation(): correlation coefficient between two signals
-maxInds():     index of the frequency component with largest magnitude
-meanFreq():    Weighted average of the frequency components to obtain a mean frequency
-skewness():    skewness of the frequency domain signal 
-kurtosis():    kurtosis of the frequency domain signal 
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-angle():       Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
        
-gravityMean
-tBodyAccMean
-tBodyAccJerkMean
-tBodyGyroMean
-tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Description of run_analysis.R Script:
Following are the steps thats been handled in the R Script:
        
### Step 1. Merge the training and the test sets to create one data set.
After downloading and unzipping the source extract files, read the following datasets into tables:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

### Step 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logical expression to search for mean and standard deviation in the column names; These columns only will be  
identified for subset extraction from the dataset.

Using the above expression Subset only those columns with mean and std deviation measurements

### Step 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to inlude the descriptive activity names
This step has been completed by merging the activity id and the id from the dataset in the previous steps

### Step 4. Appropriately label the data set with descriptive activity names.
Collect all column names from the merged dataset for Clean up activity. Using **gsub function** clean up the column   
descriptions by searching and replacing the label/variable with appropriate label descriptions  

### Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Using the **aggregate function** calculate the mean for each subject id and activity id and then write this tidy data set to a file.
The same is uploaded to the github repository
