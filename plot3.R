doPlot3 <- function(){
    ## do we have power_df if not read in
    if(!exists("power_df")){
        if(!exists("getPowerData", mode="function")) source("plot1.R")
        power_df<<-getPowerData()
    }
    ## set up a new plot device
    plot.new
    ## set global parameters for this plot
    par(mar=c(2.1,4.1,2.1,2.1), mfrow=c(1,1), cex.lab=0.75,cex.axis=0.75)
    plot(power_df$DateTime, power_df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(power_df$DateTime, power_df$Sub_metering_3, col="blue")
    lines(power_df$DateTime, power_df$Sub_metering_2, col="red")
    legend("topright",lwd =1, col=c("black","red","blue"),legend=
               c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75)
    dev.copy(png,file="./plot3.png",width=480,height=480)
    dev.off()
}