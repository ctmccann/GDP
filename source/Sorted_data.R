# Sort the Merged Data file in increasing order of GDP
sortedGDP <- arrange(mergedFile,GDP.in.Millions.USD)

#Verify the last country in the sorted data frame is United States
tail(sortedGDP$Country, n=1)

# Let's view the structure of the data
head(sortedGDP$Country)

# Find the 13th country in the sorted data set. 
sortedGDP[13,c("Country.Code","Country","GDP.in.Millions.USD","GDP.Ranking")]
# "St. Kitts and Nevis" is the 13 country in ascending order of GDP of the 189 countries in the merged data
# Its country code is KNA, GDP Rank is 178 and GDP is 767 Million USD.
