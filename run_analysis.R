

setwd("C:\\R\\working\\UCI HAR Dataset\\train")
xtrain<-read.delim("X_train.txt", header=FALSE, sep="")
ytrain<-read.delim("y_train.txt", header=FALSE, sep="\t")
subjecttrain<-read.delim("subject_train.txt", header=FALSE, sep="\t")

xtrainextract<-xtrain[,c(1,  2,	3,	41,	42,	43,	81,	82,	83,	121,	122,	123,	161,	162,	163,	201,	214,	227,	240,	253,	266,	267,	268,	294,	295,	296,	345,	346,	347,	373,	374,	375,	424,	425,	426,	452,	453,	454,	503,	513,	516,	526,	529,	539,	542,	552,	555,	556,	557,	558,	559,	560,	561)]
colnames(xtrainextract)<-c("tBodyAcc-mean()-X",  "tBodyAcc-mean()-Y",	"tBodyAcc-mean()-Z",	"tGravityAcc-mean()-X",	"tGravityAcc-mean()-Y",	"tGravityAcc-mean()-Z",	"tBodyAccJerk-mean()-X",	"tBodyAccJerk-mean()-Y",	"tBodyAccJerk-mean()-Z",	"tBodyGyro-mean()-X",	"tBodyGyro-mean()-Y",	"tBodyGyro-mean()-Z",	"tBodyGyroJerk-mean()-X",	"tBodyGyroJerk-mean()-Y",	"tBodyGyroJerk-mean()-Z",	"tBodyAccMag-mean()",	"tGravityAccMag-mean()",	"tBodyAccJerkMag-mean()",	"tBodyGyroMag-mean()",	"tBodyGyroJerkMag-mean()",	"fBodyAcc-mean()-X",	"fBodyAcc-mean()-Y",	"fBodyAcc-mean()-Z",	"fBodyAcc-meanFreq()-X",	"fBodyAcc-meanFreq()-Y",	"fBodyAcc-meanFreq()-Z",	"fBodyAccJerk-mean()-X",	"fBodyAccJerk-mean()-Y",	"fBodyAccJerk-mean()-Z",	"fBodyAccJerk-meanFreq()-X",	"fBodyAccJerk-meanFreq()-Y",	"fBodyAccJerk-meanFreq()-Z",	"fBodyGyro-mean()-X",	"fBodyGyro-mean()-Y",	"fBodyGyro-mean()-Z",	"fBodyGyro-meanFreq()-X",	"fBodyGyro-meanFreq()-Y",	"fBodyGyro-meanFreq()-Z",	"fBodyAccMag-mean()",	"fBodyAccMag-meanFreq()",	"fBodyBodyAccJerkMag-mean()",	"fBodyBodyAccJerkMag-meanFreq()",	"fBodyBodyGyroMag-mean()",	"fBodyBodyGyroMag-meanFreq()",	"fBodyBodyGyroJerkMag-mean()",	"fBodyBodyGyroJerkMag-meanFreq()",	"angle(tBodyAccMean,gravity)",	"angle(tBodyAccJerkMean),gravityMean)",	"angle(tBodyGyroMean,gravityMean)",	"angle(tBodyGyroJerkMean,gravityMean)",	"angle(X,gravityMean)",	"angle(Y,gravityMean)",	"angle(Z,gravityMean)")

traincombined<-cbind(subjecttrain,ytrain,xtrainextract)

setwd("C:\\Users\\Us\\Documents\\R\\working\\UCI HAR Dataset\\test")
xtest<-read.delim("X_test.txt", header=FALSE, sep="")
ytest<-read.delim("y_test.txt", header=FALSE, sep="")
subjecttest<-read.delim("subject_test.txt", header=FALSE, sep="")

xtestextract<-xtest[,c(1,  2,  3,	41,	42,	43,	81,	82,	83,	121,	122,	123,	161,	162,	163,	201,	214,	227,	240,	253,	266,	267,	268,	294,	295,	296,	345,	346,	347,	373,	374,	375,	424,	425,	426,	452,	453,	454,	503,	513,	516,	526,	529,	539,	542,	552,	555,	556,	557,	558,	559,	560,	561)]
colnames(xtestextract)<-c("tBodyAcc-mean()-X",  "tBodyAcc-mean()-Y",	"tBodyAcc-mean()-Z",	"tGravityAcc-mean()-X",	"tGravityAcc-mean()-Y",	"tGravityAcc-mean()-Z",	"tBodyAccJerk-mean()-X",	"tBodyAccJerk-mean()-Y",	"tBodyAccJerk-mean()-Z",	"tBodyGyro-mean()-X",	"tBodyGyro-mean()-Y",	"tBodyGyro-mean()-Z",	"tBodyGyroJerk-mean()-X",	"tBodyGyroJerk-mean()-Y",	"tBodyGyroJerk-mean()-Z",	"tBodyAccMag-mean()",	"tGravityAccMag-mean()",	"tBodyAccJerkMag-mean()",	"tBodyGyroMag-mean()",	"tBodyGyroJerkMag-mean()",	"fBodyAcc-mean()-X",	"fBodyAcc-mean()-Y",	"fBodyAcc-mean()-Z",	"fBodyAcc-meanFreq()-X",	"fBodyAcc-meanFreq()-Y",	"fBodyAcc-meanFreq()-Z",	"fBodyAccJerk-mean()-X",	"fBodyAccJerk-mean()-Y",	"fBodyAccJerk-mean()-Z",	"fBodyAccJerk-meanFreq()-X",	"fBodyAccJerk-meanFreq()-Y",	"fBodyAccJerk-meanFreq()-Z",	"fBodyGyro-mean()-X",	"fBodyGyro-mean()-Y",	"fBodyGyro-mean()-Z",	"fBodyGyro-meanFreq()-X",	"fBodyGyro-meanFreq()-Y",	"fBodyGyro-meanFreq()-Z",	"fBodyAccMag-mean()",	"fBodyAccMag-meanFreq()",	"fBodyBodyAccJerkMag-mean()",	"fBodyBodyAccJerkMag-meanFreq()",	"fBodyBodyGyroMag-mean()",	"fBodyBodyGyroMag-meanFreq()",	"fBodyBodyGyroJerkMag-mean()",	"fBodyBodyGyroJerkMag-meanFreq()",	"angle(tBodyAccMean,gravity)",	"angle(tBodyAccJerkMean),gravityMean)",	"angle(tBodyGyroMean,gravityMean)",	"angle(tBodyGyroJerkMean,gravityMean)",	"angle(X,gravityMean)",	"angle(Y,gravityMean)",	"angle(Z,gravityMean)")

testcombined<-cbind(subjecttest,ytest,xtestextract)

tidy<-rbind(traincombined,testcombined)
colnames(tidy)[2] <- "activity"
colnames(tidy)[1] <- "id"

write.table(tidy,"tidy.txt")
