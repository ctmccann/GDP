# This R program will read the EDU data from the file edu.csv in the data folder and will clean this data so that this data can be used in the analysis.
# NOTE: edu.csu is the file downloaded earlier from the link https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

# Since the raw data file has a header, read the csv file with the header record
EDU_Data <- read.csv("data/edu.csv",header=TRUE)

library(dplyr)

# Display the structure of the data frame created
str(EDU_Data)

# The structure call tells that there are 234 observations of 31 variables in the data frame; which are all accounted for
# The column names are already clean, so we won't change any of the column headers

# Let's check the header
head(EDU_Data)

# Let's check the footer 
tail(EDU_Data)

# Let's check the variable classes 
sapply(EDU_Data,class)

# All the variables labeled as "integer" do indeed contain integer data types; no action required
# All the variables labeled as "factor" should be characters; so, we'll convert them into characters
# First, we'll obtain all variables that are labeled as "factor" and store it into the "var_factor" variable
var_factor <- sapply(EDU_Data, is.factor)
# Second, we'll convert each "var_factor" variable into a character
EDU_Data[,var_factor] = apply(EDU_Data[,var_factor], 2, function(x) as.character(x))
# Third, we'll verify our conversion
sapply(EDU_Data,class)

# There are some rows that are not countries, we'll need to filter them out
EDU_Data <- EDU_Data[!(is.na(EDU_Data$Income.Group) | EDU_Data$Income.Group==""), ]

# One country has accents in its Long Name field
Encoding(EDU_Data$Long.Name) <- "UTF-8"

# Write the tidied Education Statistics data file into the data folder with file name as cleaned_EDU_Data.txt
write.table(EDU_Data, "data/cleaned_EDU_Data.txt",
            sep = "\t", row.names = FALSE, quote = FALSE)

