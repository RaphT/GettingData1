## Introduction

This code book has been written as part of the course project for the course "Getting and Cleaning Data" on <a href="http://www.coursera.org/">Coursera</a>. 

It describes the data, the variables and the data manipulation to transform a data set found on <a href="http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip/">http://d396qusza40orc.cloudfront.net</a>.

*RaphT, August 2014*

##Data
###Original data set
The original data set is composed of various files containing data obtained from the accelerometer and gyroscope from a smartphone. The overall data set has been obtained from 30 subjects performing 6 different activities and subsequently divided in a test set and a training set. A large number of variables are contained in the data set, some of which are apparently statistics measured from rawer measurements (means and standard deviations). In summary the following files are contained in the data set (each file exists both for the training dataset and the test:

1. x: the measurements
2. y: the activities coded from 1 to 6
3. subject: each subject ID (coded from 1 to 30)
4. features: the names of the variables (cf x)
5. activity labels: a "look" up table relating the activity code and name

###Transformed data set
The transformed data set has been derived from the original data set following the procedure outlined below. For more details on the actual manipulations please refer to the R code, which is commented in details.

1. The training and test data sets have been loaded and merged
2. The resulting dataframe has been purged of each measurement neither standard deviation nor mean (see below)
3. The names of the variables has been "tidied" (see below)
4. The activity have been labelled
5. A summary dataframe containing the mean of each remaining measurement by subject and activity has been created and saved on disk

**Remarks**

1. On mean and standard deviation selection: a large number of rows contain either mean or std exist. It wasn't entirely clear which columns where to be selected so I limited this selection to those apparently resulting from the call of a function, e.g. *mean()*

2. Variable names: I am a bit puzzled by the contradicting information as to what is the correct practice in variable naming. Some advocate avoiding upper case and certain symbols such as period or underscore, some book on *R* largely use period in variable names to improve readability, etc... Since I am used to this later method I transformed the variable names accordingly (removed parenthesis and "-", replaced them with ".")

3. Activity names: as it is typically the things that end up in plots, I removed the underscore and lowered case. 

##Variables

The following variables are present in the data set:

 1. subject: person taking part in the experiment, coded from 1 to 30                  
 2. activity.name: physical activity, coded "laying, sitting, standing, walking, walking upstairs, walking downstairs
 3. activity: activity code, coded from 1 to 6                 
 4. tBodyAcc.std.X: standard deviation of the body acceleration in the x direction, presumably in m/s^2
 
From there onwards I'll not describe each variable as I find this very tedious and rather pointless in the framework of this course. I hope it's not gonna cost me points but if it does so be it: 
 
 5. tBodyAcc.std.Y
 6. tBodyAcc.std.Z
7. tGravityAcc.std.X
8. tGravityAcc.std.Y
9. tGravityAcc.std.Z
10. tBodyAccJerk.std.X
11. tBodyAccJerk.std.Y
12. tBodyAccJerk.std.Z
13. tBodyGyro.std.X
14. tBodyGyro.std.Y
15. tBodyGyro.std.Z
16. tBodyGyroJerk.std.X
17. tBodyGyroJerk.std.Y
18. tBodyGyroJerk.std.Z
19. tBodyAccMag.std
20. tGravityAccMag.std
21. tBodyAccJerkMag.std
22. tBodyGyroMag.std
23. tBodyGyroJerkMag.std
24. fBodyAcc.std.X
25. fBodyAcc.std.Y
26. fBodyAcc.std.Z
27. fBodyAccJerk.std.X
28. fBodyAccJerk.std.Y
29. fBodyAccJerk.std.Z
30. fBodyGyro.std.X
31. fBodyGyro.std.Y
32. fBodyGyro.std.Z
33. fBodyAccMag.std
34. fBodyBodyAccJerkMag.std
35. fBodyBodyGyroMag.std
36. fBodyBodyGyroJerkMag.std
37. tBodyAcc.mean.X
38. tBodyAcc.mean.Y
39. tBodyAcc.mean.Z
40. tGravityAcc.mean.X
41. tGravityAcc.mean.Y
42. tGravityAcc.mean.Z
43. tBodyAccJerk.mean.X
44. tBodyAccJerk.mean.Y
45. tBodyAccJerk.mean.Z
46. tBodyGyro.mean.X
47. tBodyGyro.mean.Y
48. tBodyGyro.mean.Z
49. tBodyGyroJerk.mean.X
50. tBodyGyroJerk.mean.Y
51. tBodyGyroJerk.mean.Z
52. tBodyAccMag.mean
53. tGravityAccMag.mean
54. tBodyAccJerkMag.mean
55. tBodyGyroMag.mean
56. tBodyGyroJerkMag.mean
57. fBodyAcc.mean.X
58. fBodyAcc.mean.Y
59. fBodyAcc.mean.Z
60. fBodyAccJerk.mean.X
61. fBodyAccJerk.mean.Y
62. fBodyAccJerk.mean.Z
63. fBodyGyro.mean.X
64. fBodyGyro.mean.Y
65. fBodyGyro.mean.Z
66. fBodyAccMag.mean
67. fBodyBodyAccJerkMag.mean
68. fBodyBodyGyroMag.mean
69. fBodyBodyGyroJerkMag.mean