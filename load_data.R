load_data <- function(filename = 'household_power_consumption.txt',
                        min_date = '2007-02-01 00:00:00',
                        max_date = '2007-02-02 23:59:59')
{
    # Load data from fileName
    min_date <- as.POSIXlt(min_date)
    max_date <- as.POSIXlt(max_date)
    date_format <- '%d/%m/%Y'
    time_format <- '%H:%M:%S'
    
    # Read only header and one line, then remove the line
    data <- read.table(filename, header=T,
                       sep=';', stringsAsFactors = F, nrows=1)
    data$Date <- as.Date(data$Date, format=date_format)
    data <- data[FALSE,c(1,3:length(names(data)))]
    
    
    con <- file(filename, open = 'r')
    nrows <- 0
    first_row <- T
    read_lines <- 0
    while(length(oneLine <- readLines(con, n = 1, warn = FALSE)))
    {
        read_lines <- read_lines + 1
        if (first_row) {first_row = F; next}
        line <- strsplit(oneLine, ';')[[1]]
        line <- sapply(line, function(x) if (x == '?') {NA} else{x})
        
        # date formating
        line_data <- list()
        line_data[[1]] <- as.POSIXlt(paste(line[[1]], line[[2]], sep=' '), 
                                     format=paste(date_format, time_format, sep=' '))
        
        if (line_data[[1]] < min_date)
        {
            next
        }
        else if (line_data[[1]] > max_date)
        {
            on.exit(close(con))
            break
        }
        # Add line to the dataset
        nrows <- nrows + 1
        line_data <- c(line_data, 
                       lapply(3:(length(names(data))+1), 
                              {function(x) as.numeric(line[[x]])}))
        data[nrows, ] <- line_data
    }
    data
}