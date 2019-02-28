Below are the steps followed for cleaning the data

The data was downloaded by the following piece of code
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")

Using rbind, x_train, x_text, y_train and y_test, subject_train and subject_test was merged. Then cbind was used to merge the 3 columns and this was stored in
MergedData

Then, mean and std deviation was only selected from the above merged data and saved in TidyData

Next, the name of the activities were changed to more descriptive names

TidyData renamed into activities ,  Acc changed to accelerometer, Gyro to gyroscope, BodyBody to body, Mag to magnitude, f to frequency, t to time
tBody to timeb0dy, -mean() to mean, -std() to standard_deviation, -freq() to frequency

tidydata was grouped by subject and activity and mean of each variable was calculated. Final result was saved in TidyData2.txt

