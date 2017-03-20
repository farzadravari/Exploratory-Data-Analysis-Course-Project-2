#Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008?
#Use the ggplot2 plotting system to make a plot answer this question.
#requires ggplot2 package
#installing ggplot2 package 
> install.packages("ggplot2")
Installing package into ‘C:/Users/farza/OneDrive/Documents/R/win-library/3.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.3/ggplot2_2.2.1.zip'
Content type 'application/zip' length 2761095 bytes (2.6 MB)
downloaded 2.6 MB

package ‘ggplot2’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\farza\AppData\Local\Temp\Rtmp8KrfMm\downloaded_packages
> library(dplyr)
> NEI <- readRDS("./summarySCC_PM25.rds")
> SCC <- readRDS("./Source_Classification_Code.rds")
> require(dplyr)
> require(ggplot2)
> baltcitymary.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
> ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
+     geom_bar(stat="identity") +
+     #geom_bar(position = 'dodge')+
+     facet_grid(. ~ type) +
+     xlab("year") +
+     ylab(expression("total PM"[2.5]*" emission in tons")) +
+     ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
+                                        "City by various source types", sep="")))+
+     geom_label(aes(fill = type), colour = "white", fontface = "bold")
