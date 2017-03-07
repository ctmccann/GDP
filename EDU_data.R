# This R program will read the EDU data from the link https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# and will clean this data so that this data can be used in the analysis.

URL_EDU_Data <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'

# Since the raw data file has a header, read the csv file without the header record
EDU_Data <- read.csv(URL_EDU_Data,header=T)

library(dplyr)

# Display the structure of the data frame created
str(EDU_Data)

# The structure call tells that there are 234 observations of 31 variables in the data frame; which are all accounted for

# Let's check the header
head(EDU_Data)

# Let's check the footer 
tail(EDU_Data)

# Let's check the variable classes 
sapply(EDU_Data,class)

# All the variables labeled as "integer" do indeed contain integer data types; no action required

# All the variables labeled as "factor" should be characters; so let's convert them into characters

# First, we obtain all variables that are labeled as "factor" and store it into the "var_factor" variable
var_factor <- sapply(EDU_Data, is.factor)

# Second, we convert each "var_factor" variable into a character
EDU_Data[,var_factor] = apply(EDU_Data[,var_factor], 2, function(x) as.character(x))

# Third, we verify our conversion
sapply(EDU_Data,class)


