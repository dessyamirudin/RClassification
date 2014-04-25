#creating histogram on each variable
windows()
par(mfrow=c(2,1))
barplot(table(rawdata$contact_method),
        names.arg = c("1", "2","3","4"),
        main="Contact Method", col="black",ylab="Frequency")
mosaicplot(rawdata$contact_method ~ rawdata$class, 
           main="class by contact_method", shade=FALSE, 
           color=TRUE, xlab="contact_method", ylab="class")

windows()
par(mfrow=c(2,1))
barplot(table(rawdata$industry),
        names.arg = c("0", "1"),
        main="Industry", col="firebrick",ylab="Frequency")
mosaicplot(rawdata$industry ~ rawdata$class, 
           main="class by industry", shade=FALSE, 
           color=TRUE, xlab="industry", ylab="class")

windows()
par(mfrow=c(2,1))
barplot(table(rawdata$coverage_status),
        names.arg = c("0","1"),
        main="Coverage", col="darkviolet",ylab="Frequency")

mosaicplot(rawdata$coverage_status ~ rawdata$class, 
           main="class by coverage", shade=FALSE, 
           color=TRUE, xlab="coverage", ylab="class")

windows()
par(mfrow=c(2,1))
barplot(table(rawdata$geo),
        names.arg = c("1", "2","3","4"),
        main="Geo", col="sienna",ylab="Frequency")

mosaicplot(rawdata$geo ~ rawdata$class, 
           main="class by geo", shade=FALSE, 
           color=TRUE, xlab="geo", ylab="class")

windows()
par(mfrow=c(2,1))
hist(rawdata$size,main="Size",xlab=NULL,col="brown")
boxplot(rawdata$size ~ rawdata$class,
	main="Class by Size",horizontal=TRUE,
	xlab="Size",ylab="Class")

windows()
par(mfrow=c(2,1))
hist(rawdata$injury_claims,main="Injury Claims",xlab=NULL,col="grey50")
boxplot(rawdata$injury_claims ~ rawdata$class,
	main="Class by Injury Claims",horizontal=TRUE,
	xlab="Injury Claims",ylab="Class")

windows()
#hist(rawdata$contact_freq,main="Contact Frequencies",xlab=NULL,col="darkgreen")
par(mfrow=c(2,1))
barplot(table(rawdata$contact_freq),
        names.arg = c("1", "2","3","4","5","6","7","8","9","10"),
        main="Contact Frequencies", col="sienna",ylab="Frequency")
mosaicplot(rawdata$contact_freq ~ rawdata$class, 
           main="class by contact_freq", shade=FALSE, 
           color=TRUE, xlab="contact_freq", ylab="class")




