Please read the file data/README.txt to get information on the original data
source.

The script provided will perform the following operations on the data:

1. Merge the train and test datasets
2. Create one dataframe where each element of the feature vector. The dataframe also contains a column to identify the subject and another column with the activity being performed by the subject on that experiment.
3. Select only the features that are means or standard deviations of some
characteristic of the raw signals. This means that only features with "mean()"
or "std()" in their names were kept.
4. Substitute the integer activity labels for descriptive character labels.
5. Clean the feature names to remove dots and parentheses.

The final dataframe is called `dataset` and contains the following columns:


tBodyAccmeanX
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean
tBodyAccMagstd
tGravityAccMagmean
tGravityAccMagstd
tBodyAccJerkMagmean
tBodyAccJerkMagstd
tBodyGyroMagmean
tBodyGyroMagstd
tBodyGyroJerkMagmean
tBodyGyroJerkMagstd
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyAccMagmean
fBodyAccMagstd
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
subject
activity

The first 66 columns contain the selected elements of the feature vector. The
names should be interpreted like this:

- First letter indicates time (`t`) or frequency (`f`) domain
- Next is the description of feature
- Then we have the computed statistic for that feature: `mean` for mean or
`std` for standard deviation
- Final capital letter `X`, `Y` or `Z` indicates the axis, if applicable.

Please read data/feature_info.txt for more information on the features.

The `subject` column is an integer between 1 and 30 identifying the subject on
the experiment.

The `activity` indicates the activity the subject was performing on that
experiment. It can take 6 possible values:

- SITTING
- LAYING
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- RUNNING
