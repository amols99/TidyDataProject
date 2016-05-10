### Code Book for Data Science Course 3 Project output file FinalTidyData.txt ###
by Amol Sahasrabudhe

## Description ##
Provides information on the variables, data and transformations used in this project

## Source Data ##
The source data for the project can be obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of the data ##

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Files in Raw Data Set ##
 - README.txt  - describes the study and the files
 - features.txt - describes the features measured
 - features_info.txt - lists out the 561 features measured and needs to be read in for merging data
 - activity_labels - six activity_ids and labels to be read in for merging into tidy data set
 Other files
  - the test and train directory contains the following files
  - X_train.txt - contains 561 different measurements for the features measured across 2947 observations for the training set
  - y_train.txt - contains various activities (1-6) performed during the 2947 observations
  - subject_train.txt contains the subject_id i.e volunteer who particpated in each of the 2947 observations
  - * the test directory contains 3 similar files that are to be read in
  - The Inertial Signals directory is not to be used for the project
  
  

#### Tranformation ####

The raw data is converted to the FinalTidyData.txt dataset via the following set of transformations coded run_analysis.R script

# Step 1 ##
Download raw data , load and merge train, test, activity, subject and feature datasets with appropriate labels and filter out mean, std, activity_labels, subject_id

## Step 2 ##
The column names are made more readable by replacing for e.g. Acc with Accelerator and removing excessive periods in the column names

## Step 3 ##
Tranform intermediate data to a faster data.table format

## Step 4 ##
The finalTidy data table is created using the data.table to group by activity_label and subject_id and produce each the individual column means in the new finaltidy dataset by the groupings (activity_label, subject_id)
## Step 5 ##
In the final step, we invoke the write.table command to write out the tidy data set into the working directory into a simple text file called "FinalTidyData.txt"

## FinalTidyData.txt ##
This file contains the final tidy data set with 180 rows and 88 columns
Each row corresponds an activity_label and subject_id combination. e.g Subject 21 WALKING

## Identifiers ## 
Columns 1-2  in the final tidy data set are the primary keys
1. activity_label : contains values like LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
2. subject_id : the id of the volunteer ( 1 among 30) that the observations are recorded for

## MEasures ##Columns 3 - 88 contain averages of the mean and standard deviations for each subject and activity_label combination.
 [3] "timeBodyAccelerator.mean.X"                         "timeBodyAccelerator.mean.Y"                        
 [5] "timeBodyAccelerator.mean.Z"                         "timeBodyAccelerator.std.X"                         
 [7] "timeBodyAccelerator.std.Y"                          "timeBodyAccelerator.std.Z"                         
 [9] "timeGravityAccelerator.mean.X"                      "timeGravityAccelerator.mean.Y"                     
[11] "timeGravityAccelerator.mean.Z"                      "timeGravityAccelerator.std.X"                      
[13] "timeGravityAccelerator.std.Y"                       "timeGravityAccelerator.std.Z"                      
[15] "timeBodyAcceleratorJerk.mean.X"                     "timeBodyAcceleratorJerk.mean.Y"                    
[17] "timeBodyAcceleratorJerk.mean.Z"                     "timeBodyAcceleratorJerk.std.X"                     
[19] "timeBodyAcceleratorJerk.std.Y"                      "timeBodyAcceleratorJerk.std.Z"                     
[21] "timeBodyGyroscope.mean.X"                           "timeBodyGyroscope.mean.Y"                          
[23] "timeBodyGyroscope.mean.Z"                           "timeBodyGyroscope.std.X"                           
[25] "timeBodyGyroscope.std.Y"                            "timeBodyGyroscope.std.Z"                           
[27] "timeBodyGyroscopeJerk.mean.X"                       "timeBodyGyroscopeJerk.mean.Y"                      
[29] "timeBodyGyroscopeJerk.mean.Z"                       "timeBodyGyroscopeJerk.std.X"                       
[31] "timeBodyGyroscopeJerk.std.Y"                        "timeBodyGyroscopeJerk.std.Z"                       
[33] "timeBodyAcceleratorMagnitude.mean"                  "timeBodyAcceleratorMagnitude.std"                  
[35] "timeGravityAcceleratorMagnitude.mean"               "timeGravityAcceleratorMagnitude.std"               
[37] "timeBodyAcceleratorJerkMagnitude.mean"              "timeBodyAcceleratorJerkMagnitude.std"              
[39] "timeBodyGyroscopeMagnitude.mean"                    "timeBodyGyroscopeMagnitude.std"                    
[41] "timeBodyGyroscopeJerkMagnitude.mean"                "timeBodyGyroscopeJerkMagnitude.std"                
[43] "frequencyBodyAccelerator.mean.X"                    "frequencyBodyAccelerator.mean.Y"                   
[45] "frequencyBodyAccelerator.mean.Z"                    "frequencyBodyAccelerator.std.X"                    
[47] "frequencyBodyAccelerator.std.Y"                     "frequencyBodyAccelerator.std.Z"                    
[49] "frequencyBodyAccelerator.meanFreq.X"                "frequencyBodyAccelerator.meanFreq.Y"               
[51] "frequencyBodyAccelerator.meanFreq.Z"                "frequencyBodyAcceleratorJerk.mean.X"               
[53] "frequencyBodyAcceleratorJerk.mean.Y"                "frequencyBodyAcceleratorJerk.mean.Z"               
[55] "frequencyBodyAcceleratorJerk.std.X"                 "frequencyBodyAcceleratorJerk.std.Y"                
[57] "frequencyBodyAcceleratorJerk.std.Z"                 "frequencyBodyAcceleratorJerk.meanFreq.X"           
[59] "frequencyBodyAcceleratorJerk.meanFreq.Y"            "frequencyBodyAcceleratorJerk.meanFreq.Z"           
[61] "frequencyBodyGyroscope.mean.X"                      "frequencyBodyGyroscope.mean.Y"                     
[63] "frequencyBodyGyroscope.mean.Z"                      "frequencyBodyGyroscope.std.X"                      
[65] "frequencyBodyGyroscope.std.Y"                       "frequencyBodyGyroscope.std.Z"                      
[67] "frequencyBodyGyroscope.meanFreq.X"                  "frequencyBodyGyroscope.meanFreq.Y"                 
[69] "frequencyBodyGyroscope.meanFreq.Z"                  "frequencyBodyAcceleratorMagnitude.mean"            
[71] "frequencyBodyAcceleratorMagnitude.std"              "frequencyBodyAcceleratorMagnitude.meanFreq"        
[73] "frequencyBodyBodyAcceleratorJerkMagnitude.mean"     "frequencyBodyBodyAcceleratorJerkMagnitude.std"     
[75] "frequencyBodyBodyAcceleratorJerkMagnitude.meanFreq" "frequencyBodyBodyGyroscopeMagnitude.mean"          
[77] "frequencyBodyBodyGyroscopeMagnitude.std"            "frequencyBodyBodyGyroscopeMagnitude.meanFreq"      
[79] "frequencyBodyBodyGyroscopeJerkMagnitude.mean"       "frequencyBodyBodyGyroscopeJerkMagnitude.std"       
[81] "frequencyBodyBodyGyroscopeJerkMagnitude.meanFreq"   "angle.tBodyAcceleratorMean.gravity"                
[83] "angle.tBodyAcceleratorJerkMean..gravityMean"        "angle.tBodyGyroscopeMean.gravityMean"              
[85] "angle.tBodyGyroscopeJerkMean.gravityMean"           "angle.X.gravityMean"                               
[87] "angle.Y.gravityMean"                                "angle.Z.gravityMean" 

