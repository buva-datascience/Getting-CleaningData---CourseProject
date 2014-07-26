#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Getting and Cleaning Data
# Project: Course Assignment
# Author:  Buva Ramamoorthy
# 
# Program Name: run_analysis.R
# Date Written: Jul 21 2014
#
# Program run_analysis.R uses function dwld_file to download the data from 
# Data download url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# and then does the following: 
#
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names. 
#  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
#  ------------------------------------------------------------------------------------------------------------------------ 
#
# Prepare working directory
wd <- "/Users/sangeethabuvanendiran/Documents/Buva- Data Science/Getting and Cleaning Data/Course Project/"
setwd(wd)

# function to Download the file from the website location to the local directory
dwld_file <- function(fileurl){
        
        if (!file.exists("data")) dir.create("data")                            # create a folder if it doesnt exist        
        
        if (!file.exists("./data/projectfiles-UCI-HAR-Dataset.zip")) {      # download the file if its not already downloaded
                download.file(fileurl, destfile = "./data/UCI-HAR-Dataset.zip", method = "curl")
        }
        
        # Unzip all files
        unzip("./data/UCI-HAR-Dataset.zip", overwrite=T)
        
        #List all files in zip folder
        files <- unzip("./data/UCI-HAR-Dataset.zip", list=T)
}

# Call funtion to download from the url
dwld_file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

##################
# Step 1 --> Merge the training and the test sets to create one data set.
##################
activitylabel   <- read.table("./UCI HAR Dataset/activity_labels.txt")          # read the activity labels to a table
colnames(activitylabel)  <- c("id","activitytype")                              # assign column names

traininglabel   <- read.table("./UCI HAR Dataset/train/y_train.txt")            # read the training dataset
testlabel       <- read.table("./UCI HAR Dataset/test/y_test.txt")              # read the test dataset
colnames(traininglabel)  <- c("id")                                             # assign column names
colnames(testlabel)      <- c("id")                                             # assign column names

# merge traininglabel and activity label
traininglabel   <- merge(traininglabel, activitylabel, by.x="id", by.y="id", all=T)

# read the training and subject data
trainingdata    <- read.table("UCI HAR Dataset/train/X_train.txt")              
trainingsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# merge testlabel and activity label
testlabel       <- merge(testlabel, activitylabel, by.x="id", by.y="id", all=T)

# read the test and subject data
testdata        <- read.table("UCI HAR Dataset/test/X_test.txt")
testsubject     <- read.table("UCI HAR Dataset/test/subject_test.txt")

features        <- read.table("./UCI HAR Dataset/features.txt")                 # read the feature list

# assign column names from the features
colnames(trainingdata)          <-  features[,2] 
colnames(testdata)              <-  features[,2]
colnames(trainingsubject)       =  "subjectid"
colnames(testsubject)           =  "subjectid"

#bind columns to prepare Training Dataset
trainingdata    <- cbind(traininglabel, trainingdata, trainingsubject)

#bind columns to prepare Test Dataset
testdata        <- cbind(testlabel, testdata, testsubject)

# check for NA values
sum(is.na(trainingdata))
sum(is.na(testdata))

# combine all rows to prepare a single dataset which has both training and test data
FinalData       <- rbind(trainingdata, testdata)

#check for dimensions
dim(FinalData)
# Ans: 10299 X 564


##################
# Step 2 --> Extract only the measurements on the mean and standard deviation for each measurement. 
##################
# collect all column names 
columns <- colnames(FinalData)

# search for mean and standard deviation in the column names; these columns only will be identified for subset extraction from the dataset
find_mean_std_only = ( grepl("id", columns) |grepl("activity..", columns) | grepl("subject..", columns) | grepl("-mean..", columns) | 
                       grepl("mean..-", columns) | grepl("meanFreq..", columns) | grepl("-std..", columns) | grepl("std..-", columns))


# Subset only those columns with mean and std deviation measurements
Mean_Std <- FinalData[find_mean_std_only]

##################
# Step 3 --> Use descriptive activity names to name the activities in the data set
##################

# This step has been completed by merging the activity id and the id from the dataset in the previous steps

##################
# Step 4 --> Appropriately label the data set with descriptive variable names. 
##################

# collect all column names 
#
newcolumns <- colnames(Mean_Std)

# Clean up the column descriptions to label the variable with appropriate label descriptions

for (i in 1: length(newcolumns)) {
        
        newcolumns[i] = gsub("^(i)d", "ActivityId", newcolumns[i]);
        newcolumns[i] = gsub("\\()", "", newcolumns[i]);
        newcolumns[i] = gsub("-mean", "Mean", newcolumns[i]);
        newcolumns[i] = gsub("-std", "StdDevtn", newcolumns[i]);
        newcolumns[i] = gsub("[gG]yro", "Gyro", newcolumns[i]);
        newcolumns[i] = gsub("[gG]ravity", "Gravity", newcolumns[i]);
        newcolumns[i] = gsub("[bB]ody [bB]ody | [Bb]ody ", "Body", newcolumns[i]);
        newcolumns[i] = gsub("[aA]cc[mM]ag", "AccMagnitude", newcolumns[i]);
        newcolumns[i] = gsub("[jJ]erk[mM]ag", "JerkMagnitude", newcolumns[i]);
        newcolumns[i] = gsub("[gG]yro[mM]ag", "GyroMagnitude", newcolumns[i]);
        newcolumns[i] = gsub("^(t)", "Time", newcolumns[i]);
        newcolumns[i] = gsub("^(f)", "Frequency", newcolumns[i]);
        newcolumns[i] = gsub("^(a)", "A", newcolumns[i]);
        newcolumns[i] = gsub("^(s)", "S", newcolumns[i]);
}

# Reassign the proper variable names for the dataframe column names
colnames(Mean_Std) <- newcolumns

##################
# Step 5 --> Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
##################

# Remove the activitytype column 
noActivityType <- Mean_Std[,names(Mean_Std) != "Activitytype"]

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData    =  aggregate( noActivityType[,names(noActivityType) != c('ActivityId','Subjectid')],
                          by=list(ActivityId=noActivityType$ActivityId, SubjectId = noActivityType$Subjectid), mean);

# Assign column names
colnames(activitylabel)  <- c("ActivityId","ActivityType")

# Merge tidy dataset to the activity label to form the final tidy dataset
Final_TidyDataset   <- merge(tidyData, activitylabel, by="ActivityId", all=T)

#write this to a file
write.table(Final_TidyDataset[, names(Final_TidyDataset) != 'Subjectid'], "./Final_TidyDataset.csv", sep=",", row.names=FALSE)

