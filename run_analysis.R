library(data.table)

# Download the dataset
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
  fileUrl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="getdata-projectfiles-UCI HAR Dataset.zip",method="wget")
  dateDownloaded <- date()
  unzip("getdata-projectfiles-UCI HAR Dataset.zip")
} 

# Load of datasets into datatables
subjects <- rbind(
  read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="SUBJECT"), 
  read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="SUBJECT")
)

activities <- rbind(
  read.table("./UCI HAR Dataset/train/y_train.txt", col.names="CODE"), 
  read.table("./UCI HAR Dataset/test/y_test.txt", col.names="CODE")
)

features <- rbind(
  read.table("./UCI HAR Dataset/train/X_train.txt"), 
  read.table("./UCI HAR Dataset/test/X_test.txt")
)

features_map <- read.table("./UCI HAR Dataset/features.txt", 
                       col.names=c("INDEX", "NAME"), 
                       colClasses=c("integer", "character"))

coding <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("CODE", "LABEL"))

# Replacing Codes by Labels in activities
activities$ACTIVITY = coding$LABEL[activities$CODE]
activities$CODE<-NULL

# Selects only the mean and std features
sel_mean_std <- features_map[grep("mean|std", features_map$NAME, ignore.case = TRUE),]

# Builds the tidy dataset
my_set <- cbind(subjects, activities)

for (i in 1:nrow(sel_mean_std)) {
  tmp <- data.frame(features[,sel_mean_std$INDEX[i]])
  colnames(tmp) <- sel_mean_std$NAME[i]
  my_set <- cbind(my_set, tmp)
}

my_tidy_set <- data.table(my_set)
tidy<-my_tidy_set[,lapply(.SD,mean),by="ACTIVITY,SUBJECT"]
tidy<-tidy[order(tidy$SUBJECT),]

# Tada
write.csv(tidy,file="tidy_csv.txt",row.names=FALSE)