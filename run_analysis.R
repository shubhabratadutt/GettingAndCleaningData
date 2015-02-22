#Unzip the data file downloaded to the R workspace
unzip(zipfile="./getdata-projectfiles-UCI HAR Dataset.zip",exdir=".")

##The following will be used as prefix to contruct filepaths below
baseFilePath <- "./UCI HAR Dataset"

##Read the data 
testActivity <- read.table(file.path(baseFilePath, "test" , "Y_test.txt" ),header = FALSE)
trainActivity <- read.table(file.path(baseFilePath, "train" , "Y_train.txt" ),header = FALSE)
testSubject <- read.table(file.path(baseFilePath, "test", "subject_test.txt"),header = FALSE)
trainSubject <- read.table(file.path(baseFilePath, "train", "subject_train.txt"),header = FALSE)
testFeatures <- read.table(file.path(baseFilePath, "test", "X_test.txt"),header = FALSE)
trainFeatures <- read.table(file.path(baseFilePath, "train", "X_train.txt"),header = FALSE)

##Combine the test and training data for activity, subject and features
activity <- rbind(testActivity, trainActivity)
subject <- rbind(testSubject, trainSubject)
features <- rbind(testFeatures, trainFeatures)

##Rename the columns
names(subject)<-c("Subject")
names(activity)<- c("Activity")
featuresColNames <- read.table(file.path(baseFilePath, "features.txt"),head=FALSE)
names(features)<- featuresColNames$V2

##Combine the data (columns) for features, subject and activity
combinedDf <- cbind(features, subject, activity)

##Get the column names for mean std deviation
meanStdFeatureColNames <- featuresColNames$V2[grep("mean\\(\\)|std\\(\\)", featuresColNames$V2)]

##subset the combined data based on the mean std deviation column names
meanStdDf <- subset(combinedDf, select = c(as.character(meanStdFeatureColNames), "Subject", "Activity" ))

##Read label names for activities
activityLabels <- read.table(file.path(baseFilePath, "activity_labels.txt"),header = FALSE)

##Replace numbers for descriptive names of the activities
meanStdDf$Activity <- factor(meanStdDf$Activity, levels = activityLabels$V1, labels = activityLabels$V2)

##Provide more verbose column names
names(meanStdDf) <- gsub("^t", "time", names(meanStdDf))
names(meanStdDf) <- gsub("^f", "frequency", names(meanStdDf))
names(meanStdDf) <- gsub("Acc", "Accelerometer", names(meanStdDf))
names(meanStdDf) <- gsub("Gyro", "Gyroscope", names(meanStdDf))
names(meanStdDf) <- gsub("Mag", "Magnitude", names(meanStdDf))
names(meanStdDf) <- gsub("BodyBody", "Body", names(meanStdDf))

##Create a  tidy data set with the average of each variable for each activity and each subject
summaryDf <- aggregate(. ~ Subject + Activity, meanStdDf, mean)

##Write the data to a file in the working directory
write.table(summaryDf, file = "cleandata.txt", row.name=FALSE)
