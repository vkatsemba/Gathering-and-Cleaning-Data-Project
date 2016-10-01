# Gathering-and-Cleaning-Data-Project

##Intro
In this repository, I did the course project for the "Getting and Cleaning data" course from the Data Science specialization.

##The Raw Data
The X_test.txt file contains the 561 unamed features, the y_test.txt file contains the activity labels and the subjects are in the subject_test.txt file. The same goes for the training files

##R Script and Tidy Dataset
The run_analysis.R file merges the training and test datasets. Then, labels are added and the mean and standard deviation columns are kept in the merged dataset. Finally, the R script crates a tidy dataset with the mean of all the columns for every test subject and activity. This tidy dataset is also a txt file, which I included in this repository.

##Code Book
The Codebook.md file explains the data and variable transformations that were perfomed.
