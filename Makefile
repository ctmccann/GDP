all: download

clean:
	rm -f gdp.csv edu.csv

download: 
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv", method="curl", quiet = TRUE)'
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ", destfile = "edu.csv", method="curl", quiet = TRUE)'

