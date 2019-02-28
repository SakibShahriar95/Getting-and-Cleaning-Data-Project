X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
head(TidyData)

TidyData$code <- activities[TidyData$code, 2]

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "body", names(TidyData))
names(TidyData)<-gsub("Mag", "magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "time", names(TidyData))
names(TidyData)<-gsub("^f", "frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "timeb0dy", names(TidyData))
names(TidyData)<-gsub("-mean()", "mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "standard_deviation", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "angle", names(TidyData))
names(TidyData)<-gsub("gravity", "gravity", names(TidyData))

TidyData2 <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(TidyData2, "TidyData2.txt", row.name=FALSE)

str(TidyData2)

head(TidyData2)