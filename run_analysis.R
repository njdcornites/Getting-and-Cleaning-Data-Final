library(dplyr)

## check if data directory exist and if not create and download data

if(!file.exists("./data")){dir.create("./data")}
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,destfile="./data/UCI HAR Dataset.zip")

## Unzip dataset to data folder

unzip(zipfile="./data/UCI HARDataset.zip",exdir="./data")

## 1. Merges the training and the test sets to create one data set.
### a. Reading training datasets
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

### b. Reading test datasets
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

### c. Reading feature and activity vector
features <- read.table('./data/UCI HAR Dataset/features.txt', stringsAsFactors = F)
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')


### d.Create additional variable in y_train(test), "dataset" with value "train" if train and "test" if test, this will be useful for modeling or summarizing
### ,then Merge training datasets into 1, same with test datasets. Then merge to have only one tidy dataset
y_train<-mutate(y_train, dataset="train")
y_test<-mutate(y_test, dataset="test")

train_data<-cbind(subject_train,y_train, x_train)
test_data<-cbind(subject_test,y_test, x_test)

all_data<-rbind(train_data, test_data)

### e. Assign appropriate variable (column) names
col_names<-c("subjectId","activityId","dataset", features[,2])
colnames(all_data)<-col_names

colnames(activityLabels)<-c("activityId", "activityName")

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
extractmean_std<-grepl("subjectId|activityId|dataset|mean|std", col_names)
all_data_mean_std<-all_data[,extractmean_std]

## 3. Using descriptive activity names to name the activities in the data set
all_data_activityname<-merge(all_data_mean_std, activityLabels,
                by='activityId',
                all.x=TRUE)

## 4 Creating a second, independent tidy data set with the average of each variable for each activity and each subject
all_data_activityname$dataset<-as.factor(all_data_activityname$dataset)
tidyset <- aggregate(. ~subjectId + activityId, all_data_activityname, mean)

write.table(tidyset, "./getcleandatafinal/tidyset.txt", row.name=FALSE)

