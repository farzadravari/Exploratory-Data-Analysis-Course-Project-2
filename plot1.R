getwd()
[1] "C:/Documents and Settings/MSC/Desktop/Dr.Farzad/Data Science/Course 4"
> setwd("C:/Documents and Settings/MSC/Desktop/Dr.Farzad/Data Science/Course 4/datastore")
> getwd()
[1] "C:/Documents and Settings/MSC/Desktop/Dr.Farzad/Data Science/Course 4/datastore"
> NEI <- readRDS("./summarySCC_PM25.rds")
> SCC <- readRDS("./Source_Classification_Code.rds")
> number.add.width<-800 
> number.add.height<-800  
> require(dplyr)
Loading required package: dplyr

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> install.packages("dplyr")
Error in install.packages : Updating loaded packages
> install.packages("dplyr")
Warning in install.packages :
  package ‘dplyr’ is in use and will not be installed
> library(dplyr)
> total.emissions <- summarise(group_by(NEI, year), Emissions=sum(Emissions))
> clrs <- c("red", "green", "blue", "yellow")
> x1<-barplot(height=total.emissions$Emissions/1000, names.arg=total.emissions$year,
+             xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
+             main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=clrs)
> text(x = x1, y = round(total.emissions$Emissions/1000,2), label = round(total.emissions$Emissions/1000,2), pos = 3, cex = 0.8, col = "black")