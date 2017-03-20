> getwd()
[1] "C:/Users/farza/OneDrive/Documents"
> setwd("C:/Users/farza/Desktop/Data Science/Course 4/Project 2")
> getwd()
[1] "C:/Users/farza/Desktop/Data Science/Course 4/Project 2"
> if(!file.exists("./dataStore")){dir.create("./dataStore")}
> setwd("C:/Users/farza/Desktop/Data Science/Course 4/Project 2/datastore")
> getwd()
[1] "C:/Users/farza/Desktop/Data Science/Course 4/Project 2/datastore"
> # Read data files
> # read national emissions data
> NEI <- readRDS("./summarySCC_PM25.rds")
> SCC <- readRDS("./Source_Classification_Code.rds")
> install.packages("dplyr")
Installing package into ‘C:/Users/farza/OneDrive/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/dplyr_0.5.0.zip'
Content type 'application/zip' length 2557014 bytes (2.4 MB)
downloaded 2.4 MB
package ‘dplyr’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\farza\AppData\Local\Temp\Rtmp8KrfMm\downloaded_packages
> library(dplyr)
> total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
> clrs <- c("red", "purple", "blue", "green")
> x1<-barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=clrs)
> text(x = x1, y = round(total.emissions$Emissions/1000,2), label = round(total.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "red")
