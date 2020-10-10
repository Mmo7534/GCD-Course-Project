Getting And Cleaning Data Course Project
================
Mehmet Bora
08/10/2020

### Requirements

The requirements for the script run\_analysis.R are as follows :

1.  [Merges the training and the test sets to create one data
    set.](#first)
2.  [Extracts only the measurements on the mean and standard deviation
    for each measurement.](#second)
3.  [Uses descriptive activity names to name the activities in the data
    set.](#third)
4.  [Appropriately labels the data set with descriptive variable
    names.](#fourth)
5.  [From the data set in step 4, creates a second, independent tidy
    data set with the average of each variable for each activity and
    each subject.](#fifth)

### Script

The script initially checks if the session has the required libraries
loaded.

    require(data.table)  
    require(dplyr)

To check if the dataset is available for the script in its entirety, all
dataset files are declared and vectorized. Also the folder for the
dataset is declared.

    datafolder <- "UCI HAR Dataset"
    filetestX <- file.path(datafolder,"test","X_test.txt") 
    filetestY <- file.path(datafolder,"test","y_test.txt")
    filetrainX <- file.path(datafolder,"train","X_train.txt")
    filetrainY <- file.path(datafolder,"train","y_train.txt")
    filetestSub <- file.path(datafolder,"test","subject_test.txt")
    filetrainSub <- file.path(datafolder,"train","subject_train.txt")
    filefeatures <- file.path(datafolder,"features.txt")
    fileactivities <- file.path(datafolder,"activity_labels.txt")
    
    requiredFiles <- c(filetestX,
                       filetestY,
                       filetrainX,
                       filetrainY,
                       filetestSub,
                       filetrainSub,
                       filefeatures,
                       fileactivities)`

All files and availability of the dataset folder is checked. If any
discrepancy is detected the dataset will be downloaded and necessary
file/folder structure will be generated.

``` 
    datalink <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!dir.exists(datafolder) & sum(file.exists(requiredFiles)) != 8) {
    download.file(datalink,destfile = "dataset.zip")
    unzip("dataset.zip")
}
```

For ease use and memory advantages the dataset components are generated
as datatable ’s using fread() :

``` 
testSub <- fread(filetestSub);trainSub <- fread(filetrainSub)
features <- fread(filefeatures, drop = 1);activities <- fread(fileactivities)
testX <- fread(filetestX);testY <- fread(filetestY)
trainX <- fread(filetrainX);trainY <- fread(filetrainY)    
```

Once the tables are read, the files are deleted:

    unlink("dataset.zip")
    unlink(datafolder, recursive = T) 

##### 1 <a name="first"></a>

To start tidying the set, all tables will be merged. Initially X,Y and
Subject data tables were column binded for each of the *test* and
*train* groups separately creating sets labelled by subject and activity
numerators, which later are going to be used in grouping the final set :

    fullTest <- bind_cols(testSub,testY,testX)
    fullTrain <- bind_cols(trainSub,trainY,trainX)

Now it is possible to merge all rows as a single data table:

    observations <- bind_rows(fullTest,fullTrain)

Next step is to append the variable names to the flattened observations
table:

    columnNames <- c("subjectId","activityId",unlist(features,use.names = F))
    colnames(observations) <- columnNames

##### 2 <a name="second"></a>

The requested final dataset should solely include mean and standard
deviation calculations of the observations. The dataset will be
converted to a tibble for enabling required operations:

    observations <- as_tibble(select(observations, 
                                  contains("subjectId") |
                                      contains("activityId") | 
                                      contains("mean()") | 
                                      contains("std()")))

##### 3 <a name="third"></a>

Adding user friendly ‘Activity’ names:

    observations <- mutate(observations, 
        Activity = activities$V2[unlist(observations['activityId'])], 
        .after = 'subjectId')
    observations <- select(observations,-"activityId")

##### 4 <a name="fourth"></a>

Tidying column names by removing less human readable characters and
supplying camelCase coded variable names:

    observations <- observations %>% 
        rename_with(~sub("-","",.x))%>%
        rename_with(~sub("mean","Mean",.x))%>%
        rename_with(~sub("std","Sdev",.x))%>%
        rename_with(~sub("-","",.x))%>%
        rename_with(~sub("\\()","",.x))

##### 5 <a name="fifth"></a>

Group, summarise and write the final tidy data:

    tidy_data <<- observations %>% group_by(activity,subjectId)%>% 
        summarise(across(everything(),mean))%>%
        write.csv("tidy_data.csv")
