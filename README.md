## Getting and Clean Data - Data Science Course project 

The R script run_analysis.R does the job of downloading data if it does not exist and processes it to create
the tidy data set that is required by the assignment.

Here are the steps
1. Download the run_analysis.R script into your working directory

2. Run the script which in turn does the following

    - Creates a data directory in the working directory if it does not exist
    
    - Downloads the dataset into the data directory from the web
    
    - Loads the activity_labels.txt and feature.txt files into dataframes giving them readable column names
    
    - Loads the subject_test, X_test and y_test files for the train and test datasets in respective data frames. 
    
    - Note that the X_test dataframe columns are set to respective column names from the feature.txt file during load
    
    - test_merge and train_merge dataframes are created combining respective subject, x_test and y_test info
    
    - The test_merge and train_merge dataframes are merged along with the activity_labels that are more readable into the final_data dataframe after extracting mean, std, activity labels and subject_ids only
    
    - The column names are made more readable by replacing for e.g. Acc with Accelerator and removing excessive periods in the column names
    
    - The final_data dataframe is transformed into a final_data.dt data table to use the fast data.table package for further manipulation
    
    - the finalTidy data table is created using the data.table to group by activity_label and subject_id and produce each the individual column means in the new finaltidy dataset by the groupings (activity_label, subject_id)
    
    - In the final step, we invoke the write.table command to write out the tidy data set into the working directory into a simple text file called "FinalTidyData.txt"