# This code uses the Data Frame merged_Data created earlier and calculates the the average GDP rankings for the 
#  "High income: OECD" and "High income: nonOECD" groups

library(dplyr)

merged_Data %>% 
  # filter records to have rows with "High income: OECD" and "High income: nonOECD" income group
  filter(Income.Group=='High income: nonOECD' | Income.Group=='High income: OECD') %>% 
  # Group the data by income group 
  group_by(Income.Group) %>% 
  # Compute the mean of GDP Ranking
  summarize(mean(as.numeric(GDP.Ranking))) %>%
  # Convert the result into a Data Frame so as to make it more readable
  as.data.frame %>%
  # Assign proper column headings
  setNames(c("Income.Group", "Mean.GDP.Ranking"))
