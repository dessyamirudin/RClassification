library(ROCR)
library(SDMTools)

#Logistic Regression
set.seed(35)
glmfit<-glm(class~contact_method+contact_freq+geo+size+injury_claims,data = train.fit,family=binomial("logit"))
glm.probs <- predict(glmfit, test.fit, type = "response")
glm.fix<-predict(glmfit, test.fit)
glm.labels<-test.fit$class
confusionglm<-confusion.matrix(glm.labels,glm.fix)
accuracyglm<-prop.correct(confusionglm)
pred<-prediction(glm.probs,glm.labels)
perf<-performance(pred,"tpr","fpr")
windows()
plot(perf, avg= "threshold", colorize=F, lwd= 3,main= "Logistic Regression ROC Curve")
auc.value.log<-performance(pred,"auc")@y.values[[1]]


#SVM
require(e1071)
x<-subset(train.fit,select=-class)
y<-train.fit$class
svmfit<-svm(x,y,method="C-classification",kernal="radial",probability=TRUE)
svmfitfix<-svm(x,y,method="C-classification",kernal="radial")
svm.probs<-predict(svmfit,data=test.fit,probability=TRUE)
svm.fix<-predict(svmfitfix,data=test.fit)
svm.labels<-test.fit$class
confusionsvm<-confusion.matrix(svm.labels,svm.fix)
accuracysvm<-prop.correct(confusionsvm)
predsvm<-prediction(svm.probs,svm.labels)
perfsvm<-performance(predsvm,"tpr","fpr")
windows()
plot(perfsvm, avg= "threshold", colorize=F, lwd= 3,main= "SVM ROC Curve")
auc.value.svm<-performance(predsvm,"auc")@y.values[[1]]

#Tree using Random Forest

require(randomForest)
rftrain<-randomForest(class~contact_method+contact_freq+geo+size+injury_claims,data = train.fit,importance=TRUE)
predrfprob<-predict(rftrain,test.fit)
predrffix<-predict(rftrain,test.fit,type="response")
rf.labels<-test.fit$class
confusionrf<-confusion.matrix(rf.labels,predrffix)
accuracyrf<-prop.correct(confusionrf)
predrf<-prediction(predrfprob,rf.labels)
perfrf<-performance(predrf,"tpr","fpr")
windows()
plot(perfrf, avg= "threshold", colorize=F, lwd= 3,main= "RF ROC Curve")
auc.value.rf<-performance(predrf,"auc")@y.values[[1]]



