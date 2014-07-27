# APPROACH
The experiments have been carried out with a group of 30 volunteers 19-48 years old. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with the data being recorded by a smartphone . Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The downloaded dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

# SCRIPT and OUTPUT

- There's only onw script containign all R code **(run_analysis.R)** and one output **(tidy_csv.txt)**
- The additional or manipulated variables are all UPPERCASE

- In features.txt

   **INDEX:** Running number to index the sensors
   
   **NAME:** feature recorded

- in activities.txt

   **CODE:** Running number to index the activities (as appearing in the sets)
   
   **LABEL:** Activity type in characteres (6 different types)
