library(data.table)
library(dplyr)
library(lubridate)

### Working Directory
##Please make sure your working directory contains the uncompressed contents from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##The script assumes that paths such as "./household_power_consumption.txt" are valid. Please confirm this is the case for you.

###Data Import and Cleaning Steps
##Import the data using fread, replacing '?' with NAs and keeping the headers, convert to tibble dataframe, and filter to desired dates
df <- fread("./household_power_consumption.txt", header= TRUE, na.strings = "?") %>%
  tbl_df %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

##Combine the date and time variables into a single Datetime character vector and convert to date-time format.
df$Datetime <- paste(df$Date, df$Time, sep = " ") %>%
  dmy_hms

##Reorder dataframe variables to exclude old Date and Time character vectors
df <- select(df, Datetime, Global_active_power:Sub_metering_3)

###Construct the Plot
png("plot3.png", width = 480, height = 480)

with(df, plot(x= Datetime, y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df, lines(x= Datetime, y = Sub_metering_2, col = "red"))
with(df, lines(x= Datetime, y = Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))

dev.off()

