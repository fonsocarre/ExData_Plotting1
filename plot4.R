## Plot 4 generator source file

# Get the data from the file 
# This is done through a function because it added
# a lot of complexity to the main program
# Also, the same procedure is used for the rest
# of the plots without having to copy-paste
data <- load_data()

# Device initialisation, use quartz() for in-screen
# plotting (only for mac)
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
#quartz()
# canvas
# 2 row x 2 col
par(mfrow=c(2,2))
# 1st PLOT ========================================================
with(data, plot(Global_active_power ~ Date, type='n',
                                     xlab='',
                                     ylab='Global Active Power'))
with(data,lines(Global_active_power ~ Date))

# 2nd PLOT ========================================================
with(data, plot(Voltage ~ Date, type='n',
								xlab='datetime',
								ylab='Voltage'))
with(data, lines(Voltage ~ Date))

# 3rd PLOT ========================================================
with(data, plot(Sub_metering_1 ~ Date, type='n', 
                                       xlab='',
                                       ylab='Energy sub metering'))
	# three lines
	with(data, lines(Sub_metering_1 ~ Date, col='black'))
	with(data, lines(Sub_metering_2 ~ Date, col='red'))
	with(data, lines(Sub_metering_3 ~ Date, col='blue'))
	# legend with properties
	legend('topright', legend=c('Sub_metering_1',
	                            'Sub_metering_2',
	                            'Sub_metering_3'),
				       lty=rep(1,3),
       				   col=c('black', 'red', 'blue'),
       				   box.lwd=0)
       
# 4TH PLOT ========================================================
with(data, plot(Global_reactive_power ~ Date, type='n',
											  xlab='datetime',
											  ylab='Global_reactive_power'))
with(data, lines(Global_reactive_power ~ Date))


dev.off()
