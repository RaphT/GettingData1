##This file has been written by RaphT in Aug 2014 for the Coursera "getting and cleaning data" course.

##Phase 1: load and merge data####
library(plyr)

#Cleanup workspace
rm(list = ls(all = TRUE))
#Set working directory
setwd("C:\\Users\\rtornay\\Desktop\\DataScienceSpecialization\\GettingData1\\")

#Download file
fileurl = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "data.zip")

# get the name of the files in the zip archive
fname = unzip("data.zip", list=TRUE)$Name
# unzip the files
unzip("data.zip", files=fname, overwrite=TRUE)

#Move to downloaded and unzipped directory
setwd("C:\\Users\\rtornay\\Desktop\\DataScienceSpecialization\\GettingData1\\UCI HAR Dataset\\")
# Load useful data tables (data from the Inertial folder is ignored)
x.test = read.table(".//test//X_test.txt")
y.test = read.table(".//test//y_test.txt")
x.train = read.table(".//train//X_train.txt")
y.train = read.table(".//train//y_train.txt")
subject.test = read.table(".//test//subject_test.txt")
subject.train = read.table(".//train//subject_train.txt")
features = read.table(".//features.txt")
activity.labels = read.table(".//activity_labels.txt")

# The tables below will not be used
# body_gyro_x_train= read.table(".//train//Inertial Signals//body_gyro_x_train.txt")
# total_acc_x_train= read.table(".//train//Inertial Signals//total_acc_x_train.txt")
# body_acc_x_train= read.table(".//train//Inertial Signals//body_acc_x_train.txt")
# body_gyro_x_train= read.table(".//train//Inertial Signals//body_gyro_x_train.txt")
# 
# body_gyro_x_test= read.table(".//test//Inertial Signals//body_gyro_x_test.txt")
# total_acc_x_test= read.table(".//test//Inertial Signals//total_acc_x_test.txt")
# body_acc_x_test= read.table(".//test//Inertial Signals//body_acc_x_test.txt")
# body_gyro_x_test= read.table(".//test//Inertial Signals//body_gyro_x_test.txt")

#Set names of columns in each table
names(x.train) = as.character(features$V2)
names(x.test) = as.character(features$V2)

names(subject.test) = "subject" 
names(subject.train) = "subject"

names(y.test) = "activity" 
names(y.train) = "activity"

#Merge tables to create "full" dataset
train.dataset = cbind(subject.train,x.train,y.train)
test.dataset = cbind(subject.test,x.test,y.test)
full.dataset = rbind(train.dataset,test.dataset)

##Phase 2: extract measurements of mean and stdev + Subject + Activity####
keep = c(grep("activity",names(full.dataset)),
         grep("subject",names(full.dataset)),
         grep("[Ss]td\\(",names(full.dataset)),# Std measurements
         grep("[Mm]ean\\(",names(full.dataset))) #Mean measurements
tidy.data.1 = full.dataset[, keep]

##Phase 4: "tidy" variable names####
x = names(tidy.data.1)
x = sub(pattern = "\\()", replacement = "", x)
x = gsub(pattern = "-", replacement = ".", x)
names(tidy.data.1) = x

##Phase 3: label activity by merging (data is reordered but I do not think 
# this is a problem)####
names(activity.labels) = c("activity.code","activity.name")
activity.labels$activity.name = gsub(pattern = "_", replacement = " ", tolower(activity.labels$activity.name))

tidy.data.1 = merge(tidy.data.1, activity.labels, by.x = "activity",
                      by.y = "activity.code")
head(tidy.data.1) #Check look of dataframe

##Phase 5: create summary tidy data frame and save it####
tidy.data.2 = ddply(tidy.data.1, .(subject, activity.name, activity), numcolwise(mean))
head(tidy.data.2, n = 12)

#Write data on disk
setwd("C:\\Users\\rtornay\\Desktop\\DataScienceSpecialization\\GettingData1\\")
write.table(tidy.data.2, file = "tidydata.txt",row.name=F)
