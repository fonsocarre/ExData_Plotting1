## Plot 2 generator source file

# Get the data from the file 
# This is done through a function because it added
# a lot of complexity to the main program
# Also, the same procedure is used for the rest
# of the plots without having to copy-paste
data <- load_data()

# Device initialisation, use quartz() for in-screen
# plotting (only for mac)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
#quartz(width=480, height=480)
with(data, plot(Global_active_power ~ Date, type='n',
                                     xlab='',
                                     ylab='Global Active Power (kilowatts)'))
with(data,lines(Global_active_power ~ Date))
dev.off()
