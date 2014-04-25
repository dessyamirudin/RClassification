#processing the data
file<-"Data.csv"
missing.data<-c("NA","")
rawdata<-readData(file,missing.data)

#creating frequency table for each variable
#summary(rawdata)
table(rawdata$contact_method)
table(rawdata$industry)
table(rawdata$coverage)
table(rawdata$geo)
table(rawdata$size)
table(rawdata$injury_claims)
table(rawdata$contact_freq)

