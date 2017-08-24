data<-read.csv("household_power_consumption.txt",stringsAsFactors = FALSE,sep=";") #read the txt 
filedata$Date<-as.Date(data$Date,format="%d/%m/%Y") #change object type to date
data_use<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",] #extract the usefull rows
data_use$Global_active_power <- as.numeric(data_use$Global_active_power) #change object type to numeric
data_use<-cbind(strftime(paste(data_use[,1],data_use[,2]),format = "%Y-%m-%d %H:%M:%S"),data_use) #add the date and time
names(data_use)[1]<-"Data_Time" #change the name of new column

png(file="plot1.png",width = 480, height = 480,) #create a png file 
hist(data_use$Global_active_power,col="red",main="Globel Active Power",xlab="Globel Active Powe (kilowatts)") #plot the histogram
dev.off() #close the png file
