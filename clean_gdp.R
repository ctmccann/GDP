df = read.csv("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
gold <- df
df <- df[,colSums(is.na(df))<nrow(df)]
colnames(df)[2] <- "Ranking"
colnames(df)[3] <- "Country"
colnames(df)[1] <- "Country_Code"
colnames(df)[4] <- "Millions_USD($)"
df <- df[-c(1, 2, 3), ]
