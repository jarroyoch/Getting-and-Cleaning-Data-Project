## <Step 0> Setting things up ##

print("Welcome!, this script will get you a tidy data set of means and standard deviations of the  'Human Activity Recognition Using Smartphones Dataset'")
print("For more info please check the readme at my github repo: https://github.com/jarroyoch/Getting-and-Cleaning-Data-Project")
print("Setting things up, this could take a moment.")

#Loading libraries
library(reshape2)

#Checking and/or getting the data
if(!file.exists("./UCI HAR Dataset")){
  if(!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="./getdata-projectfiles-UCI HAR Dataset.zip")  
  unzip("./getdata-projectfiles-UCI HAR Dataset.zip")
    
  }
    else {
      unzip("./getdata-projectfiles-UCI HAR Dataset.zip")
    
    }

}

## </Step 0> ##



## <Step 1> Calling data ##

print("Calling the raw data, please wait...")

#Call the activity names
nameAct<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Call the varibalbes names
nameVar<-read.table("./UCI HAR Dataset/features.txt")

#Call the testing datasets: subjects, activities, variables.
testS<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")
testY<-read.table("./UCI HAR Dataset/test/Y_test.txt",col.names="activity")
testX<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=nameVar$V2)

print("...")

#Call the training datasets: subjects, activities, variables.
trainS<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")
trainY<-read.table("./UCI HAR Dataset/train/Y_train.txt",col.names="activity")
trainX<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=nameVar$V2)

print("Data called !")

## </Step 1> ##



## <Step 2> Preparing the data ##

print("Procesing raw data")

#Remmove the "_" from activities names.
nameAct[,2]<-gsub("_","",tolower(nameAct[,2]))

#Remove the "()" from variable names
nameVar[,2]<-gsub("\\(\\)","",nameVar[,2])

#Remove the "-" from variable names
nameVar[,2]<-gsub("-","",nameVar[,2])

#Replace the "," for ";" in order to avoid issues with the csv format
nameVar[,2]<-gsub(",",";",nameVar[,2])

#Change numeric value to the name of each activity for the test set
for(i in 1:6){
  testY$activity[testY$activity==i]<-nameAct$V2[i]
}

#Change numeric value to the name of each activity for the train set
for(i in 1:6){
  trainY$activity[trainY$activity==i]<-nameAct$V2[i]
  
}

print("Data processed !")

## </Step 2> ##



## <Step 3> Merging Datasets ##

print("Merging procesed datasets")

#make the test data set
testSet<-cbind(testS,testY,testX)

#make the train data set
trainSet<-cbind(trainS,trainY,trainX)

#make the tidy data set
procesedData<-rbind(trainSet,testSet)

print("Data sets merged!")

## </Step3> ##



## <Step 4.> Preparing the tidy Data set ##

print("Preparing the tidy data set")

#Checks for the variables that are labeled either mean or std
meanStdCol<-grep("mean|std",nameVar$V2)

#makes a tidy data set which only includes mean and std variables
procesedData2<-procesedData[meanStdCol]

## </step 4> ##


## <Step 5> Getting Tidy data set ##

#set factor on activity
procesedData2$activity<-factor(procesedData2$activity)

#set factor on subjects
procesedData2$subject<-factor(procesedData2$subject,levels=1:30)

#reshape the data using the factors previously assigned
preTidy<-melt(procesedData2,id=c("subject","activity"))

#generate the means of the tidy data by subject and activity by dcast
tidyData<-dcast(preTidy,subject+activity ~ variable,mean)

print("Tidy data set ready!")

## </Steap 5> ##



## Final Step ##

#export procesedData
write.table(procesedData,file="procesedData.txt")

write.table(procesedData2,file="procesedData2.txt")
#export the tidy data sets
write.table(tidyData,file="tidyData.txt")

print("Files generated: procesedData, procesedData2, tidyData")

print("You are interested in tidyData")

print("Try: view(tidyData)")

print("Also you can check in your wd this files")

print("Credits: Jorge Luis Arroyo Chavelas")

#remove all the garbage
rm(nameAct,nameVar,testS,testX,testY,testSet,trainS,trainX,trainY,trainSet,i,meanStdCol,preTidy)