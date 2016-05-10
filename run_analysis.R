## install required packages after checking
if (!require("dplyr"))
{
  install.packages("dplyr") 
  library(dplyr)
  }
if (!require("tidyr"))
    {
      install.packages("tidyr") 
      library(tidyr)
      }
if (!require("data.table"))
{
    install.packages("data.table") 
    library(data.table)
}

# download and unzip files into folder if it does not exist
if (!file.exists(".data")) { dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCIharDataset.zip")

unzip(zipfile = "./data/UCIHarDataset.zip", exdir = "./data" )



# remove  variables from any earlier runs to clean up memory.

rm (filedir,activity_labels_file, features_file,test_subject_file, test_X_file)
rm (test_Y_file, train_subject_file, train_X_file, train_Y_file)
rm (test_merge, train_merge, test_train_merge, final_data, final_data.dt, finalTidy)

# base directory of script assumes a directory called UCI HAR Dataset


# define all the file variables
filedir <- "./data/UCI HAR Dataset"
activity_labels_file <-  paste(filedir,"activity_labels.txt", sep = "/")
features_file <- paste (filedir, "features.txt" , sep = "/")
test_subject_file <- paste(filedir,"test/subject_test.txt", sep = "/")
test_X_file <- paste(filedir, "test/X_test.txt", sep = "/")
test_Y_file <- paste(filedir, "test/y_test.txt", sep = "/")

train_subject_file <- paste (filedir, "train/subject_train.txt", sep = "/")
train_X_file <- paste(filedir , "train/X_train.txt", sep = "/")
train_Y_file <- paste(filedir, "train/y_train.txt", sep = "/")

# read all the files into data frame variables
activity_labels <- read.table(activity_labels_file, header = FALSE, col.names = c("activity_id", "activity_label"))
features <- read.table(features_file, header = FALSE, col.names = c("feature_id", "feature_name"))

# load test subject data
test_subjects <- read.table(test_subject_file, header = FALSE, col.names = c("subject_id"))
test_x <- read.table(test_X_file, header = FALSE, col.names = features[, c("feature_name")])
test_y <- read.table(test_Y_file, header = FALSE, col.names = "activity_id")

# load train subject data

train_subjects <- read.table(train_subject_file, header = FALSE, col.names = c("subject_id"))
train_x <- read.table(train_X_file, header = FALSE,col.names = features[, c("feature_name")])
train_y <- read.table(train_Y_file, header = FALSE, col.names = "activity_id")


# Task 1. Merge the test and train data with the activity_id and subject_id and labels
test_merge <- test_x %>% cbind(test_y) %>% cbind(test_subjects)
train_merge <- train_x %>% cbind(train_y) %>% cbind(train_subjects)
test_train_merge <- rbind(test_merge, train_merge)

# Task 2 : extract measurements of mean/std only. 
# Task3 :  merge with the activity_labels dataset to get descriptive activity names

final_data <- test_train_merge %>%
      merge(activity_labels, by.x = "activity_id", by.y = "activity_id", all.x = TRUE) %>%
      select(matches("std|mean|activity_label|subject_id")) 

#Task 4 : Give the variables descriptive names and clean up periods in the middle and ends
colnames(final_data) <- gsub("^t", "time", colnames(final_data))
colnames(final_data) <- gsub("^f", "frequency", colnames(final_data))
colnames(final_data) <- gsub("Acc", "Accelerator", colnames(final_data))
colnames(final_data) <- gsub("Gyro", "Gyroscope", colnames(final_data))
colnames(final_data) <- gsub("Mag", "Magnitude", colnames(final_data))
colnames(final_data) <- gsub("\\.+$", "", colnames(final_data))
colnames(final_data) <- gsub("\\.{3}", ".", colnames(final_data))

# Create a data.table to manipulate the new tidy data set

final_data.dt <- data.table(final_data)

# Take the mean of the columns broken down by activities and subjects
finalTidy <- final_data.dt[, lapply(.SD, mean), by = 'activity_label,subject_id']

# Write out the tidy data set
write.table(finalTidy, file = 'FinalTidyData.txt')


