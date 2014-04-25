#classification algorithm start
#logistic regression

#based on conclusion, the variable that will be retained is:
#contact_method
#geo
#size
#injury_claims
#contact_freq

#decide the raw data that will be kept
rawdata.keeps<-c("class","contact_method","geo","size",
			"injury_claims","contact_freq","industry","coverage_status")
rawdata.fitmodel<-rawdata[rawdata.keeps]

set.seed(23)
#taking the training data
sizerawdata = 0.5*nrow(rawdata.fitmodel)
training.rows<-sample(nrow(rawdata.fitmodel),size=sizerawdata)
train.fit<-rawdata.fitmodel[training.rows,]
test.fit<-rawdata.fitmodel[-training.rows,]
#validationandtest.fit<-rawdata.fitmodel[-training.rows,]

#taking the validation and test data
#sizevalidationdata=0.5*nrow(validationandtest.fit)
#validation.rows<-sample(nrow(validationandtest.fit),
#			size=sizevalidationdata)
#validation.fit<-validationandtest.fit[validation.rows,]
#test.fit<-validationandtest.fit[-validation.rows,]
