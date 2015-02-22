##Getting and Cleaning Data Course Project: Code book##

###Source Data###
The source data is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

#####Details Provided for Each Record: #####

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

###Extracted Folder Structure###
The **getdata-projectfiles-UCI HAR Dataset.zip** extracts to the following folder structure:
- **UCI HAR Dataset**
    - **test**
      - **Inertial Signals**
        - body_acc_x_test.txt
        - body_acc_y_test.txt
        - body_acc_z_test.txt
        - body_gyro_x_test.txt
        - body_gyro_y_test.txt
        - body_gyro_z_test.txt
        - total_acc_x_test.txt
        - total_acc_y_test.txt
        - total_acc_z_test.txt
      - subject_test.txt
      - X_test.txt : Test set
      - y_test.txt : Test labels
    - **train**
      - **Inertial Signals**
        - body_acc_x_train.txt : The body acceleration signal obtained by subtracting the gravity from the total acceleration.
        - body_acc_y_train.txt
        - body_acc_z_train.txt
        - body_gyro_x_train.txt : The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
        - body_gyro_y_train.txt
        - body_gyro_z_train.txt
        - total_acc_x_train.txt : : The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
        - total_acc_y_train.txt
        - total_acc_z_train.txt
      - subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
      - X_train.txt : Training set
      - y_train.txt : Training labels
    - activity_labels.txt : Links the class labels with their activity name
    - features.txt : List of all features
    - features_info.txt : Shows information about the variables used on the feature vector.

    - README.txt

###Data Cleansing Steps###
- Read the data
- Combine the test and training data for activity, subject and features
- Rename the columns for acrivity, subject and features
- Combine the data (columns) for features, subject and activity
- Get the column names for mean standard deviation
- subset the combined data based on the mean standard deviation column names
- Read the descriptive label names for activities
- Replace numbers for descriptive names of the activities
- Provide more verbose column names for the data subset from thee previous step
- Create a  tidy data set with the average of each variable for each activity and each subject
- Write the data to a file in the working directory
