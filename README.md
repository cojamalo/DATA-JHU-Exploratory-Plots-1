## DATA-JHU-Exploratory-Plots-1
### Submission by Connor Lenio. Email: cojamalo@gmail.com
Completion Date: Mar 19, 2017

The following are the instructions for implementing the plot#.R series of scripts with the source data to create the four desired plots.

### Working Directory
Please make sure your working directory contains the uncompressed contents from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

The script assumes that paths such as "./household_power_consumption.txt" are valid. Please confirm this is the case for you.

### Dependecies
The script assumes the following packages are either in your base R installation or have been installed:
- data.table
- dplyr
- lubridate

### RUN
Source the plot1.R script in your working directory that also contains the data. Substitute the plot # you want to recreate for the "1" in "plot1.R", such as "plot4.png," for instance.  

### The Process
I have also commented the code itself in each plot.R file, so feel free to follow along by looking at its contents.

The Data Import and Cleaning Steps are as follows:
- Import the data using fread, replacing '?' with NAs and keeping the headers, convert to tibble dataframe, and filter to desired dates (Date == "1/2/2007" | Date == "2/2/2007").
- Combine the date and time variables into a single Datetime character vector and convert to date-time format.
- Reorder dataframe variables to exclude old Date and Time character vectors
  
The Construct the Plot steps vary for each plot, but each version includes:
- A call to "png" with output file name and height and width parameters set
- The unique plot function calls to reproduce each plot
- A call to "dev.off" to end finalize the creation of the png file


### OUTPUT
When the script completes, your workspace will contain the imported data, df, and your working directory will now contain the final png image of the plot with its proper name such as "plot1.png.

Project coded by Connor Lenio ©2017. 



