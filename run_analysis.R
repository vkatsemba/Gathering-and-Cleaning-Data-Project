##Load libraries and set the working directory
library(dplyr)
setwd("C:\\Users\\Vadim Katsemba\\Documents\\UCI HAR Dataset")

##Read the files
Y.Train <- read.table("train/y_train.txt", quote="\"")
Y.Test <- read.table("test/y_test.txt", quote="\"")
X.Train <- read.table("train/X_train.txt", quote="\"")
X.Test <- read.table("test/X_test.txt", quote="\"" )
features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")
Subject.Train <- read.table("train/subject_train.txt", quote="\"")
Subject.Test <- read.table("test/subject_test.txt", quote="\"")

##Merging the training files(70%)
colnames(activity_labels) <- c("V1","Activity")

Subject <- rename(Subject.Train, Subject=V1)
Train <- cbind(Y.Train, Subject)
Train.activity <- merge(Train, activity_labels, by=("V1"))

colnames(X.Train) <- features[,2]

Train.XM <- cbind(Train.activity, X.Train)
Train.XMod <- Train.XM[,-1]

Train.Final <- select(Train.XMod, contains("subject"), contains("Activity"), contains("mean"), contains("std"))

##Merging the test files(30%)
colnames(activity_labels) <- c("V1","Activity")

Subject2 <- rename(Subject.Test, Subject=V1)
Test <- cbind(Y.Test, Subject2)
Test.activity <- merge(Test, activity_labels, by=("V1"))

colnames(X.Test) <- features[,2]

Test.XM <- cbind(Test.activity, X.Test)
Test.XMod <- Test.XM[,-1]

Test.Final <- select(Test.XMod, contains("subject"), contains("Activity"), contains("mean"), contains("std"))

##Merge the train and test data

Full.data <- rbind(Train.Final, Test.Final)

##Data Summary
Analysis <- (Full.data%>% group_by(Subject, Activity) %>% summarise_each(funs(mean)))
print(Analysis)

##Create a txt file for the tidy data set
write.table(Analysis,'run_analysis.txt',sep=" ",row.name=FALSE) 