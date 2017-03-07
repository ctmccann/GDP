all: clean download tidy_edu tidy_gdp merge report.html

clean:
	rm -f data/gdp.csv data/edu.csv report.html

download:
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "data/gdp.csv", method="curl", quiet = TRUE)'
	Rscript -e 'download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "data/edu.csv", method="curl", quiet = TRUE)'

tidy_edu: source/EDU_data.R
	Rscript $<

tidy_gdp: source/GDP_data.r
	Rscript $<

merge: source/merge_data.R
	Rscript $<

report.html: report.Rmd data/merged_Data.csv
	Rscript -e 'rmarkdown::render("$<")'
