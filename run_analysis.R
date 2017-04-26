library(dplyr)

# Load all the data

# Load the list of features in the feature vector

list_of_features <- read.table("data/features.txt",
                               col.names = c("position", "feature"))

# Load the activity labels

activity_labels <- read.table("data/activity_labels.txt",
                              col.names = c("label", "activity"))

# For the train and test datasets, load the feature vector, the labels
# and the subjects.
# The inertial signals will not be needed

train_feature_vector <- read.table("data/train/X_train.txt")

train_activities <- read.table("data/train/y_train.txt")
# Turn it into a vector
train_activities <- train_activities[, 1]

train_subjects <- read.table("data/train/subject_train.txt")
# Turn it into a vector
train_subjects <- train_subjects[, 1]

test_feature_vector <- read.table("data/test/X_test.txt")

test_activities <- read.table("data/test/y_test.txt")
# Turn it into a vector
test_activities <- test_activities[, 1]

test_subjects <- read.table("data/test/subject_test.txt")
# Turn it into a vector
test_subjects <- test_subjects[, 1]

# Merge the test and train datasets

# For the train and test datasets, construct a dataframe with the following
# columns:
#
# subject
# activity
# feature vector (one feature per column)

train_feature_vector["subject"] <- train_subjects
train_feature_vector["activity"] <- train_activities
train <- train_feature_vector
# Remove objects that are not needed anymore
remove(train_activities, train_feature_vector, train_subjects)

test_feature_vector["subject"] <- test_subjects
test_feature_vector["activity"] <- test_activities
test <- test_feature_vector
# Remove objects that are not needed anymore
remove(test_activities, test_feature_vector, test_subjects)

# Merge the two dataframes previously created by appending the rows of one
# to another.
dataset <- rbind(train, test)

# Subset the dataframe to retain only the columns that contain means
# or standard deviations

feature_names <- as.character(list_of_features$feature)
# Find the features that contain "mean()" in their name
features_with_mean <- grep("mean\\(\\)", feature_names)
# Find the features that contain "std()" in their name
features_with_std <- grep("std\\(\\)", feature_names)
# Convert the indices to match the column names of the dataset
indices_to_retain <- c(features_with_mean, features_with_std)
columns_to_retain <- sapply(indices_to_retain, function(x) paste0("V",x))

# Concatenate the four vectors to get the list of the columns that
# we want to retain
columns_to_retain <- c(columns_to_retain, "subject", "activity")

dataset <- dataset[, columns_to_retain]

# Clean column names for the feature vector variables
clean_column_names <- sapply(feature_names[indices_to_retain],
                             function(x) gsub("[-()]", "", x))
# Substitute the dataset's column names for the descriptive and
# clean column names
descriptive_column_names <- c(clean_column_names, "subject", "activity")
names(dataset) <- descriptive_column_names

# Use the activity labels to substitute the integers in the activity
# column of the dataframe for descriptive activity labels

get_activity <- function(x) {
    as.character(activity_labels[activity_labels$label == x, ]$activity)
}

dataset$activity <- sapply(dataset$activity, get_activity)

# Group the dataframe by subject and by activity

# Summarize the grouped dataset by computing the mean of each of the
# features

summarized_dataset <- group_by(dataset, activity, subject) %>%
                        summarise_all(mean)
