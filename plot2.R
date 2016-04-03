doPlot2 <- function(){
  ## do we have power_df if not read in
  if(!exists("power_df")){
    if(!exists("getPowerData", mode="function")) source("plot1.R")
    power_df<<-getPowerData()
  }
  ## set up a new plot device
  plot.new
  ## set global parameters for this plot
  par(mar=c(4.1,4.1,2.1,2.1),  mfrow=c(1,1), cex.lab=0.75,cex.axis=0.75,cex.main=0.75)
  plot(power_df$DateTime, power_df$Global_active_power,type="l",xlab="",
    ylab="Global Active Power (kilowattts)")
  dev.copy(png,file="./plot2.png",width=480,height=480)
  dev.off()
}
