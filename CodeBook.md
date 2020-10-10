CodeBook
================
Mehmet Bora
08/10/2020

# Tidying the Human Activity Recognition Using Smartphones Dataset

### Notes

The original dataset includes a 561-feature vector with time and
frequency domain variables.

The tidied set is required to extract only the measurements on the
*Mean* and *Standart Deviation* for each observation. The relevant
labels as provided by the original dataset will be tidied and be used as
the column names of the tidy set. The 6 activities mentioned below are
available as indexes in the dataset. It is required that the tidy data
should have descriptive names. The final dataset shall be grouped by
Activity and Subject Id’s respectively and contain the averages of the
measurements mentioned above.

From the authors of the experiment \[1\]:

*The experiments \[2\] have been carried out with a group of 30
volunteers within an age bracket of 19-48 years. Each person performed
six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS,
SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on
the waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.*

…

For each record it is provided:

  - Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope.
  - A 561-feature vector with time and frequency domain variables.
  - Its activity label.
  - An identifier of the subject who carried out the experiment.

The tidy data set will be devised by the following group of files by the
principals mentioned
[here](https://vita.had.co.nz/papers/tidy-data.pdf):

  - ‘README.txt’ : Original readme file for the entire dataset.
  - ‘features\_info.txt’: Shows information about the variables used on
    the feature vector.
  - ‘features.txt’: List of all features.
  - ‘activity\_labels.txt’: Links the class labels with their activity
    name.
  - ‘train/X\_train.txt’: Training set.
  - ‘train/y\_train.txt’: Training labels.
  - ‘test/X\_test.txt’: Test set.
  - ‘test/y\_test.txt’: Test labels.

The following files are available for the train and test data. Their
descriptions are equivalent.

  - ‘train/subject\_train.txt’: Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.
  - ‘test/subject\_test.txt’

Inertial signal data files are also included in the dataset however they
were not used as they were not relevant for the project.

| Variable                 | Class   | Range                                                                      |        Mean |
| :----------------------- | :------ | :------------------------------------------------------------------------- | ----------: |
| activity                 | factor  | LAYING, SITTING, STANDING, WALKING, WALKING\_DOWNSTAIRS, WALKING\_UPSTAIRS |          NA |
| subjectId                | integer | 1 / 30                                                                     |          NA |
| tBodyAccMeanX            | numeric | 0.22159824394 / 0.3014610196                                               |   0.2743027 |
| tBodyAccMeanY            | numeric | \-0.0405139534294 / -0.00130828765170213                                   | \-0.0178755 |
| tBodyAccMeanZ            | numeric | \-0.152513899520833 / -0.07537846886                                       | \-0.1091638 |
| tGravityAccMeanX         | numeric | \-0.680043155060241 / 0.974508732                                          |   0.6974775 |
| tGravityAccMeanY         | numeric | \-0.479894842941176 / 0.956593814210526                                    | \-0.0162128 |
| tGravityAccMeanZ         | numeric | \-0.49508872037037 / 0.9578730416                                          |   0.0741279 |
| tBodyAccJerkMeanX        | numeric | 0.0426880986186441 / 0.130193043809524                                     |   0.0794736 |
| tBodyAccJerkMeanY        | numeric | \-0.0386872111282051 / 0.056818586275                                      |   0.0075652 |
| tBodyAccJerkMeanZ        | numeric | \-0.0674583919268293 / 0.0380533591627451                                  | \-0.0049534 |
| tBodyGyroMeanX           | numeric | \-0.205775427307692 / 0.19270447595122                                     | \-0.0324372 |
| tBodyGyroMeanY           | numeric | \-0.204205356087805 / 0.0274707556666667                                   | \-0.0742596 |
| tBodyGyroMeanZ           | numeric | \-0.0724546025804878 / 0.179102058245614                                   |   0.0874446 |
| tBodyGyroJerkMeanX       | numeric | \-0.157212539189362 / -0.0220916265065217                                  | \-0.0960568 |
| tBodyGyroJerkMeanY       | numeric | \-0.0768089915604167 / -0.0132022768074468                                 | \-0.0426928 |
| tBodyGyroJerkMeanZ       | numeric | \-0.0924998531372549 / -0.00694066389361702                                | \-0.0548019 |
| tBodyAccMagMean          | numeric | \-0.986493196666667 / 0.644604325128205                                    | \-0.4972897 |
| tGravityAccMagMean       | numeric | \-0.986493196666667 / 0.644604325128205                                    | \-0.4972897 |
| tBodyAccJerkMagMean      | numeric | \-0.99281471515625 / 0.434490400974359                                     | \-0.6079296 |
| tBodyGyroMagMean         | numeric | \-0.980740846769231 / 0.418004608615385                                    | \-0.5651631 |
| tBodyGyroJerkMagMean     | numeric | \-0.997322526811594 / 0.0875816618205128                                   | \-0.7363693 |
| fBodyAccMeanX            | numeric | \-0.995249932641509 / 0.537012022051282                                    | \-0.5758000 |
| fBodyAccMeanY            | numeric | \-0.989034304057971 / 0.524187686888889                                    | \-0.4887327 |
| fBodyAccMeanZ            | numeric | \-0.989473926666667 / 0.280735952206667                                    | \-0.6297388 |
| fBodyAccJerkMeanX        | numeric | \-0.994630797358491 / 0.474317256051282                                    | \-0.6139282 |
| fBodyAccJerkMeanY        | numeric | \-0.989398823913043 / 0.276716853307692                                    | \-0.5881631 |
| fBodyAccJerkMeanZ        | numeric | \-0.992018447826087 / 0.157775692377778                                    | \-0.7143585 |
| fBodyGyroMeanX           | numeric | \-0.99312260884058 / 0.474962448333333                                     | \-0.6367396 |
| fBodyGyroMeanY           | numeric | \-0.994025488297872 / 0.328817010088889                                    | \-0.6766868 |
| fBodyGyroMeanZ           | numeric | \-0.985957788 / 0.492414379822222                                          | \-0.6043912 |
| fBodyAccMagMean          | numeric | \-0.986800645362319 / 0.586637550769231                                    | \-0.5365167 |
| fBodyBodyAccJerkMagMean  | numeric | \-0.993998275797101 / 0.538404846128205                                    | \-0.5756175 |
| fBodyBodyGyroMagMean     | numeric | \-0.986535242105263 / 0.203979764835897                                    | \-0.6670991 |
| fBodyBodyGyroJerkMagMean | numeric | \-0.997617389275362 / 0.146618569064407                                    | \-0.7563853 |
| tBodyAccSdevX            | numeric | \-0.996068635384615 / 0.626917070512821                                    | \-0.5576901 |
| tBodyAccSdevY            | numeric | \-0.990240946666667 / 0.616937015333333                                    | \-0.4604626 |
| tBodyAccSdevZ            | numeric | \-0.987658662307692 / 0.609017879074074                                    | \-0.5755602 |
| tGravityAccSdevX         | numeric | \-0.996764227384615 / -0.829554947808219                                   | \-0.9637525 |
| tGravityAccSdevY         | numeric | \-0.99424764884058 / -0.643578361424658                                    | \-0.9524296 |
| tGravityAccSdevZ         | numeric | \-0.990957249538462 / -0.610161166287671                                   | \-0.9364010 |
| tBodyAccJerkSdevX        | numeric | \-0.994604542264151 / 0.544273037307692                                    | \-0.5949467 |
| tBodyAccJerkSdevY        | numeric | \-0.989513565652174 / 0.355306716915385                                    | \-0.5654147 |
| tBodyAccJerkSdevZ        | numeric | \-0.993288313333333 / 0.0310157077775926                                   | \-0.7359577 |
| tBodyGyroSdevX           | numeric | \-0.994276591304348 / 0.267657219333333                                    | \-0.6916399 |
| tBodyGyroSdevY           | numeric | \-0.994210471914894 / 0.476518714444444                                    | \-0.6533020 |
| tBodyGyroSdevZ           | numeric | \-0.985538363333333 / 0.564875818162963                                    | \-0.6164353 |
| tBodyGyroJerkSdevX       | numeric | \-0.99654254057971 / 0.179148649684615                                     | \-0.7036327 |
| tBodyGyroJerkSdevY       | numeric | \-0.997081575652174 / 0.295945926186441                                    | \-0.7635518 |
| tBodyGyroJerkSdevZ       | numeric | \-0.995380794637681 / 0.193206498960417                                    | \-0.7095592 |
| tBodyAccMagSdev          | numeric | \-0.986464542615385 / 0.428405922622222                                    | \-0.5439087 |
| tGravityAccMagSdev       | numeric | \-0.986464542615385 / 0.428405922622222                                    | \-0.5439087 |
| tBodyAccJerkMagSdev      | numeric | \-0.994646916811594 / 0.450612065720513                                    | \-0.5841756 |
| tBodyGyroMagSdev         | numeric | \-0.981372675614035 / 0.299975979851852                                    | \-0.6303947 |
| tBodyGyroJerkMagSdev     | numeric | \-0.997666071594203 / 0.250173204117966                                    | \-0.7550152 |
| fBodyAccSdevX            | numeric | \-0.996604570307692 / 0.658506543333333                                    | \-0.5522011 |
| fBodyAccSdevY            | numeric | \-0.990680395362319 / 0.560191344                                          | \-0.4814787 |
| fBodyAccSdevZ            | numeric | \-0.987224804307692 / 0.687124163703704                                    | \-0.5823614 |
| fBodyAccJerkSdevX        | numeric | \-0.995073759245283 / 0.476803887476923                                    | \-0.6121033 |
| fBodyAccJerkSdevY        | numeric | \-0.990468082753623 / 0.349771285415897                                    | \-0.5707310 |
| fBodyAccJerkSdevZ        | numeric | \-0.993107759855072 / -0.00623647528983051                                 | \-0.7564894 |
| fBodyGyroSdevX           | numeric | \-0.994652185217391 / 0.196613286661538                                    | \-0.7110357 |
| fBodyGyroSdevY           | numeric | \-0.994353086595745 / 0.646233637037037                                    | \-0.6454334 |
| fBodyGyroSdevZ           | numeric | \-0.986725274871795 / 0.522454216314815                                    | \-0.6577466 |
| fBodyAccMagSdev          | numeric | \-0.987648484461539 / 0.178684580868889                                    | \-0.6209633 |
| fBodyBodyAccJerkMagSdev  | numeric | \-0.994366667681159 / 0.316346415348718                                    | \-0.5991609 |
| fBodyBodyGyroMagSdev     | numeric | \-0.981468841692308 / 0.236659662496296                                    | \-0.6723223 |
| fBodyBodyGyroJerkMagSdev | numeric | \-0.99758523057971 / 0.287834616098305                                     | \-0.7715171 |

1.  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
    November 2012.

2.  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
    L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
    Multiclass Hardware-Friendly Support Vector Machine. International
    Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
    Spain. Dec 2012
