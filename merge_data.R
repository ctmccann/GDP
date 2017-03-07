# This R program will read the EDU data from the link https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
# and will clean this data so that this data can be used in the analysis.

# Since the raw data file has a header, read the csv file without the header record
cleaned_GDP_Data <- read.csv("data/cleaned_GDP_Data.csv",header=T, sep = "|")
cleaned_EDU_Data <- read.csv("data/cleaned_EDU_Data.csv",header=T, sep = "|")

merged_Data <- merge(cleaned_GDP_Data, cleaned_EDU_Data, by.x = "Country.Code", by.y = "CountryCode")

# writes the table of word length frequency
write.table(merged_Data, "data/merged_Data.csv",
            sep = "|", row.names = FALSE, quote = FALSE)