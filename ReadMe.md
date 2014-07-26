<!------------------------------------------------------
title: "ReadMe.md"
author: "Buva Ramamoorthy"
date: "July 23, 2014"
output: html_document
------------------------------------------------------->
        
#** Getting and Cleaning Data - Course Project **
        
* by Buva Ramamoorthy *
        
This is a repository which is created for the project submission for the course Getting and Cleaning Data  
by John Hopkins University

## Overview
The purpose of this project is to demonstrate collect, work with, and clean a data set. The goal is to prepare  
tidy data that can be used for later analysis.

For this course we will be considering the wearable computing data collected by few companies. The data linked  
for this course represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full 
description of the data is available at [UCI Machine Learning Repository](http://http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

[Click here to find the source data for the project:](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

## Course Project Summary

The course project instructions are described below:
Create a R script called run_analysis.R that does the following. 
-- Merges the training and the test sets to create one data set.
-- Extracts only the measurements on the mean and standard deviation for each measurement. 
-- Uses descriptive activity names to name the activities in the data set
-- Appropriately labels the data set with descriptive variable names. 
-- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Additional Information and Important points for Github R/DataScience community 

More details regarding the run_analysis program and the steps performed for this project can be found in   
CookBook.Rmd in the same repository. Data cleaning steps, description of variable names, transformations and   
Steps performed are documented as well in the CookBook document.

*Important* : The author has hard coded the working directory assertions in the run_analysis.R program in   
line#23. Might need modifications to reset the working directory for code compatibility for other mac users.
