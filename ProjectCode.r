##code to read data
library(caret)
library(randomForest)
setwd("D:/Datos/FJNAVARRO/Documents/Files/Specialization/MachineLearning/CourseProject")
intrain <- read.table("pml-training.csv",sep=",",header=T)
test <- read.table("pml-testing.csv",sep=",",header=T)

##Code to clean data
##for each column:
source("cleanNA.r")
source("iteraNA.r")
intrain1 <- intrain[,out]
source("cleanMissing.r")
source("iteraMissing.r")
intrain2 <- intrain1[,fin]
intrain3 <- intrain2[,-c(1,2,3,4,5,6,7)]


##elimina variables correlacionadas
intrian4 <- intrain3[,-53]
descrCor <- cor(intrian4)
highlyCorDescr <- findCorrelation(descrCor, cutoff = 0.75)
intrain5 <- intrain3[, -highlyCorDescr]

##crea particion para training y para validation
int <- createDataPartition(y=intrain5$classe,p=0.75, list=FALSE)
training <- intrain5[int,]
validation <- intrain5[-int,]

##crea modelo randomForest y genera prediccion con validation set
fit <- randomForest(classe ~.,   data=training,ntree=1000)
print(fit) # view results 
importance(fit) # importance of each predictor 
pred <- predict(fit,validation);
validation$predRight <- pred==validation$classe
table(pred,validation$classe)
qplot(yaw_belt,pitch_forearm,colour=predRight,data=validation,main="newdata Predictions")


##prepara archivo testing y predice el resultado
source("cleanNA.r")
source("iteraNAtest.r")
test1 <- test[,outt]
source("cleanMissing.r")
source("iteraMissing.r")
intrain2 <- intrain1[,fint]
intrain3 <- intrain2[,-c(1,2,3,4,5,6,7)]




featurePlot(x=training[,c("age","education","jobclass")],
            y = training$wage,
            plot="pairs")

