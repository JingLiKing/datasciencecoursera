# read dataset
trainx<-read.table("UCI HAR Dataset/train/X_train.txt")
testx<-read.table("UCI HAR Dataset/test/X_test.txt")

trainy<-read.table("UCI HAR Dataset/train/y_train.txt")
testy<-read.table("UCI HAR Dataset/test/y_test.txt")
subjectTrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt")

# add discription of feature
feature<-read.table("UCI HAR Dataset/features.txt")
fnames<-as.vector(feature[[2]])
names(trainx)<-fnames
names(testx)<-fnames

# add train and test data with 2 row: class number and subject label
names(trainy)<-"class"
names(testy)<-"class"
names(subjectTrain)<-"subject"
names(subjectTest)<-"subject"
train<-cbind(trainx,trainy,subjectTrain)
test<-cbind(testx,testy,subjectTest)
dat<-rbind(train,test)

# add a column: text discription of class
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
names(activity)<-c("class","activity")
Dat<-merge(dat,activity,by.x="class")

# Extracts measurements on the mean and std
cleanDat1<-Dat[,grepl("mean|std|activity",names(Dat))]

#second dataset
index<-c(-which(names(Dat)=="class"),-which(names(Dat)=="activity"),-which(names(Dat)=="subject"))
tmpt<-Dat[,index]

z<-sapply(split(tmpt,Dat["activity"]),colMeans)
tz<-as.data.frame(t(z))

zz<-sapply(split(tmpt,Dat["subject"]),colMeans)
tzz<-as.data.frame(t(zz))
cleanDat2<-rbind(tz,tzz)

#save as .txt
write.table(cleanDat1,"cleanDat1.txt")
write.table(cleanDat2,"cleanDat2.txt")
