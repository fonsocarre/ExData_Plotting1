## Plot 3 generator source file

# Get the data from the file 
# This is done through a function because it added
# a lot of complexity to the main program
# Also, the same procedure is used for the rest
# of the plots without having to copy-paste
data <- load_data()

# Device initialisation, use quartz() for in-screen
# plotting (only for mac)
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
#quartz(width=480, height=480)
# canvas
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
       col=c('black', 'red', 'blue'))
dev.off()
