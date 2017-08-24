data<-read.csv("household_power_consumption.txt",stringsAsFactors = FALSE,sep=";") #read the txt file
data$Date<-as.Date(data$Date,format="%d/%m/%Y") #change object type to date
data_use<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",] #extract the usefull rows
data_use$Global_active_power <- as.numeric(data_use$Global_active_power) #change object type to numeric
data_use<-cbind(strftime(paste(data_use[,1],data_use[,2]),format = "%Y-%m-%d %H:%M:%S"),data_use) #add the date and time
names(data_use)[1]<-"Data_Time" #change the name of new column
data_use$Sub_metering_1 <- as.numeric(data_use$Sub_metering_1) #changge the data type to numeric
data_use$Sub_metering_2 <- as.numeric(data_use$Sub_metering_2) #changge the data type to numeric
data_use$Sub_metering_3 <- as.numeric(data_use$Sub_metering_3) #changge the data type to numeric
png(file="plot3.png",width = 480, height = 480,)
with(data_use,plot(Data_Time,Sub_metering_1,ylab="Energy sub metering",xaxt="n"))
with(data_use,lines(Data_Time,Sub_metering_1))
with(data_use,lines(Data_Time,Sub_metering_2,col="red"))
with(data_use,lines(Data_Time,Sub_metering_3,col="blue"))
axis(1,c(1,which(data_use$Data_Time=="2007-02-02 00:00:00"),length(data_use$Data_Time)),c("Thu","Fri","Sat"))
legend("topright",lty =1,,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
