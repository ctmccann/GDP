# This R program will read the GDP data from the link https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
# and will clean this data so that this data can be used in the analysis.

URL_GDP_Data <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'

# Since the raw data file is not having any header record, read the csv file without the header record
GDP_Data <- read.csv(URL_GDP_Data, header=FALSE)

# Add the library dplyr to the active set of libraries
library(dplyr)

# Display the structure of the data frame created
str(GDP_Data)
# The structure call tells that there are 331 observations of 10 variables in the data frame
# Looking on the structure, it appears that the columns v3, v7, v8, v9, v10 are having just NA
# Let’s verify if they have any other value. 
# TO do that, lets check the number of NA's in each of these 5 columns
sapply(GDP_Data$V3, is.na) %>% sum
sapply(GDP_Data$V7, is.na) %>% sum
sapply(GDP_Data$V8, is.na) %>% sum
sapply(GDP_Data$V9, is.na) %>% sum
sapply(GDP_Data$V10, is.na) %>% sum

# The output of all the above sapply statement is 331 confirming that data in these columns is just NA
# So, its safe to drop all these columns
# To do that we are only keeping records with number of NA's less then total number of rows 
GDP_Data <- GDP_Data[,colSums(is.na(GDP_Data)) < nrow(GDP_Data)]

# Verify the structure of data again 
str(GDP_Data)
# Columns V1, V2, V4, V5, V6 are the columns left in the dataset.

# Since we already know that this data frame should represent 
# Let’s look at the top 10 rows of the data frame to get an idea of the structure of the data.
head(GDP_Data, 10)
# Lets also look at the bottom 10 rows of the data frame to get an idea of the structure of the data.
tail(GDP_Data, 10)

# Looks like the GDP data begins at row 6 and in the tail, there are just some blank records.
# let’s remove all the rows which are blanks
GDP_Data <- GDP_Data [!apply(GDP_Data == "", 1, all),]

# Verify the structure of data again 
str(GDP_Data)
# Now we are left with 235 records in our data frame which is still greater then 190

# Let’s look at the top 10 rows of the data frame to get an idea of the structure of the data.
head(GDP_Data, 10)
# Lets also look at the bottom 10 rows of the data frame to get an idea of the structure of the data.
tail(GDP_Data, 10)

# Since the row numbers are not re-initialized automatically, so let’s re-initialize them
rownames(GDP_Data) <- NULL

# Let’s look at the top 10 rows of the data frame to get an idea of the structure of the data.
head(GDP_Data, 10)
# Lets also look at the bottom 10 rows of the data frame to get an idea of the structure of the data.
tail(GDP_Data, 10)

# looks like the data which we are looking for is starting from row number 4 such that
# Column V1 - represents the country code
# Column V2 - represents GDP Ranking
# Column V4 - represents country/Economy name
# Column v5 - represents GDP amount
# Column v6 - not sure of what kind of data its having, so let’s continue for now with cleaning up of the data and will analyze V6 later

# In the end (tail records) of the data frame, it looks like there is some sort of summary of the data which we don’t need
# Let’s look at the records having only integer values are there in column v2 (our ranking data)
GDP_Data[which(grepl('^[0-9]+$',GDP_Data$V2)),]

# this dataset represents the actual data that we are looking for, the GDP data for 190 countries
# Extract the 190 records from the data frame representing the 190 countries GDP data
GDP_Data <- GDP_Data[which(grepl('^[0-9]+$',GDP_Data$V2)),]

# Now let’s look at column V6 closely to see what it represents
GDP_Data$V6

# It looks like some sort of groupings done to the countries from a-f or 
#  might be the countries Morocco, Sudan, Tanzania, Cyprus, Georgia, Moldova are assigned to some values
# Since we don’t have any information about this column data, we will drop this column as there is no 
#  meaningful information represented by this column required for our analysis.
GDP_Data <- select(GDP_Data, -V6)

# Let’s have a look at the top 5 records of this data frame to verify the data
head(GDP_Data)

# reassign the row numbers
rownames(GDP_Data) <- NULL

# Assign proper heading to this data
GDP_Data <- setNames(GDP_Data,c("Country.Code","GDP.Ranking","Country","GDP.in.Millions.USD"))

# Let’s get rid of the unwanted commas from the GDP amount in the data frame
GDP_Data$GDP.in.Millions.USD <- as.factor(as.numeric(gsub(',','',GDP_Data$GDP.in.Millions.USD)))

# Let’s have a look at the top 5 records of this data frame to verify the data
head(GDP_Data)
