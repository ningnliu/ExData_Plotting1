data<-read.csv("household_power_consumption.txt",stringsAsFactors = FALSE,sep=";") #read the txt file
data$Date<-as.Date(data$Date,format="%d/%m/%Y") #change object type to date
data_use<-data[data$Date>="2007-02-01"&data$Date<="2007-02-02",] #extract the usefull rows
data_use$Global_active_power <- as.numeric(data_use$Global_active_power) #change object type to numeric
data_use<-cbind(strftime(paste(data_use[,1],data_use[,2]),format = "%Y-%m-%d %H:%M:%S"),data_use) #add the date and time
names(data_use)[1]<-"Data_Time" #change the name of new column

png(file="plot2.png",width = 480, height = 480,) #create the plot2.png
with(data_use,plot(Data_Time,Global_active_power,ylab="Globel Active Powe (kilowatts)",xaxt="n")) #plot the data
with(data_use,lines(Data_Time,Global_active_power)) #add line to the png
axis(1,c(1,which(data_use$Data_Time=="2007-02-02 00:00:00"),length(data_use$Data_Time)),c("Thu","Fri","Sat")) #add the x-axis
dev.off() #close the png file
