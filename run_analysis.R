##This script assumes the files are located in the default R working Dir
##and creates a tidy dataset in the SubDir /UCI HAR Dataset/

setwd("./UCI HAR Dataset")

##Loading files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")


## Subsets only Mean & Std Dev features
features_vect <- as.character(features[,2])
m_s <- grep("mean|std|Mean|Std",features_vect)
X_test_ms <- X_test[,m_s]
X_train_ms <- X_train[,m_s]

##Merging data sets
test_data <- cbind(subject_test,y_test,X_test_ms)
train_data <- cbind(subject_train,y_train,X_train_ms)
all_data <- rbind(test_data,train_data)

## Adding column names
colnames(all_data) <- c("Subject","Activity",features_vect[m_s])

## Converting Subject and Activity as Factors
all_data$Subject <- as.factor(all_data$Subject)
all_data$Activity <- factor(all_data$Activity, labels=activity_labels$V2)

##Summarizing data by Subject and Activity
library(reshape2)
melt_data <- melt(all_data, id=c("Subject","Activity"), measured = features_single)
tidy_data <- dcast(melt_data,Subject+Activity~variable,mean)

##Creates a tidy data text file
write.table(tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)
print(c("File located in:",getwd()))
