# Function to prepare the required tidy data for the assignment
# Doesn't require any parameters. Please refer to README.md and
# CodeBook.md for details.
# Mehmet Bora 2020. mehmet.bora@outlook.com
analyse <- function(){
    
    # Check required packages.
    require(data.table)
    require(dplyr)
    
    # Define required files.
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
                       fileactivities)
    
    # Check required files, download and unzip if necessary.
    datalink <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    if (!dir.exists(datafolder) & sum(file.exists(requiredFiles)) != 8) {
        download.file(datalink,destfile = "dataset.zip")
        unzip("dataset.zip")
    }
    
    # Read files into data tables
    testSub <- fread(filetestSub);trainSub <- fread(filetrainSub)
    features <- fread(filefeatures, drop = 1);activities <- fread(fileactivities)
    testX <- fread(filetestX);testY <- fread(filetestY)
    trainX <- fread(filetrainX);trainY <- fread(filetrainY)    
    
    # Take nothing but pictures, leave nothing but footprints
    unlink("dataset.zip")
    unlink(datafolder, recursive = T) 

    # Flatten tables ( columns: subject_id, activity_id,features(...))
    fullTest <- bind_cols(testSub,testY,testX)
    fullTrain <- bind_cols(trainSub,trainY,trainX)
    observations <- bind_rows(fullTest,fullTrain)
    
    # Add column names
    columnNames <- c("SubjectId","ActivityId",unlist(features,use.names = F))
    colnames(observations) <- columnNames
    
    # Select only requested columns and convert set to tibble
    observations <- as_tibble(select(observations, 
                                  contains("SubjectId") |
                                      contains("ActivityId") | 
                                      contains("mean()") | 
                                      contains("std()")))
    
    # Add user friendly 'Activity' names
    observations <- mutate(observations, 
        Activity = activities$V2[unlist(observations['ActivityId'])], 
        .after = 'SubjectId')
    observations <- select(observations,-"ActivityId")
    
    # Tidy column names
    observations <- observations %>% 
        rename_with(~sub("-","",.x))%>%
        rename_with(~sub("mean","Mean",.x))%>%
        rename_with(~sub("std","Sdev",.x))%>%
        rename_with(~sub("-","",.x))%>%
        rename_with(~sub("\\()","",.x))
    
    # Group and create the tidy data
    tidy_data <<- observations %>% group_by(Activity,SubjectId)%>% 
        summarise(across(everything(),mean))%>%
        print
    
    
}

