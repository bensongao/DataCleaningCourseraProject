# Read training and test data
subjectTrain <- read.table("train/subject_train.txt")
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTest <- read.table("test/subject_test.txt")
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")

#1 Merge training and test data
trainData <- cbind(subjectTrain, yTrain, xTrain)
testData <- cbind(subjectTest, yTest, xTest)
mergedData <- rbind(testData, trainData)

#2 Extract mean and std for each measurement
features <- read.table("features.txt")
meanStdIndex <- grep("[Mm]ean|[Ss]td", features$V2)
meanStdData <- mergedData[,c(1,2,meanStdIndex+2)]

#3 Apply activity names to the data set
activityLabels <- read.table("activity_labels.txt")
meanStdData[,2] <- activityLabels$V2[meanStdData[,2]]

#4 Label data set with variable names
varNamesTemp1 <- features$V2[meanStdIndex]
varNamesTemp2 <- sub("^t", "time", varNamesTemp1)
varNames <- sub("^f", "freq", varNamesTemp2)
colnames(meanStdData)[1:2] <- c("Subject", "Activity")
colnames(meanStdData)[3:ncol(meanStdData)] <- varNames
tidyData1 <- meanStdData

#5 Create new data set with means for each subject
groupedData <- group_by(tidyData1, tidyData1$Subject, tidyData1$Activity)
tidyData2 <- summarise(groupedData, across(1:(ncol(groupedData)-2), mean))[,c(1:2,5:ncol(groupedData))]
colnames(tidyData2)[1:2] <- c("Subject", "Activity")

#6 Output
write.table(tidyData2, file = "tidyData2.txt", row.names = FALSE)