all: download

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html

download: 
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "gdp.csv", method="curl", quiet = TRUE)'
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ", destfile = "edu.csv", method="curl", quiet = TRUE)'

histogram.tsv: histogram.r gdp.csv
	Rscript $<

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(words_length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

report.html: report.Rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'