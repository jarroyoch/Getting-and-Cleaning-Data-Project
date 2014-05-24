Getting and Cleaning Data Project
=================================

#Introduction
This project takes from the, 'Human Activity Recognition Using Smartphones Dataset'[1], a tidy data set of the averages and standard deviations observed on 30 volunteers on their movements (aceleration, angular veolocity, body aceleration) using smartphones on six different activities.

The result is a data frame of 180 rows (6 activities per volunteer) and 79 columns that represents the averages meassured.

#Content
On this repo you can find the original dataset merged (test and train sets), the data set of the averages, the tidy data set, and the R-script used to make the tidy data set from zero.

##R-Script
This R-Script can work with or without the original dataset as long as an internet conection is available and will work on the current working directory.

The form that this script works is the following:
* Check if the data set exists, if not, then will download it or unzip it
* Call the data of the test and train sets
* Change the names to more data friendly ones (lowercasses and remove of signs)
* Merge it with the data friendly names producing DataProcessed.txt
* Look for the means and standaard deviations to make the DataProcessed2.txt
* Reshape the Dataprocessed2 to a more handy format
* Produce the tidyData set.

For a better understanding og the R-script, feel free to see the code and run it.


##About the original data
Credits of the original data:
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain [...]"

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


