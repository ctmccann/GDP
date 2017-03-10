# This R program will merge the two clean files saved in the data folder of the project created in the steps earlier 
# Input files
# 1. data/cleaned_GDP_Data.csv
# 2. data/cleaned_EDU_Data.csv
# Output Merged File
# data/merged_Data.csv

# Import the clean files into a data frame
cleaned_GDP_Data <- read.csv("data/cleaned_GDP_Data.txt",header=T, sep = "|")
cleaned_EDU_Data <- read.csv("data/cleaned_EDU_Data.txt",header=T, sep = "|")

# Merge the GDP and EDU data by Country Code
merged_Data <- merge(cleaned_GDP_Data, cleaned_EDU_Data, by.x = "Country.Code", by.y = "CountryCode")

# writes the table of word length frequency
write.table(merged_Data, "data/merged_Data.txt",
            sep = "|", row.names = FALSE, quote = FALSE)