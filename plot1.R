getPowerData <- function(){
  ## function to read in the electric power consumption by household data
  ## resultant data frame subset on dates in range 01-02-2007 - 02-02-2007
  power_df <- read.table(file="./household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE)
  power_df<-subset(power_df, (Date=="1/2/2007" | Date=="2/2/2007"))
  power_df$DateTime <- strptime(paste(power_df$Date, power_df$Time),"%d/%m/%Y %H:%M:%S")
  power_df$Global_active_power<-as.numeric(power_df$Global_active_power)
  power_df
}

doPlot1 <- function(){
  ## do we have power_df if not read in
  if(!exists("power_df")) power_df<<-getPowerData()
  ## set up a new plot device
  plot.new
  ## set global parameters for this plot
  par(mar=c(4.1,4.1,2.1,2.1), mfrow=c(1,1), cex.lab=0.75,cex.axis=0.75,cex.main=0.75)
  hist(power_df$Global_active_power, col="red", 
       xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png,file="./plot1.png",width=480,height=480)
  dev.off()
}
