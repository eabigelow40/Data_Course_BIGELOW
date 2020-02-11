library(tidyverse)

read.csv("./DNA_Conc_by_Extraction_Date.csv")

dna = read.csv("./DNA_Conc_by_Extraction_Date.csv")

names(dna)
summary(dna)
class(dna)
dim(dna)
str(dna)

hist(dna$DNA_Concentration_Katy,main = "Katy Stats",xlab = "Concentrations")
hist(dna$DNA_Concentration_Ben,main = "Katy Stats",xlab = "Concentrations")

boxplot(DNA_Concentration_Katy~Year_Collected, data=dna, xlab="year", ylab="DNA concentration", col= "violet")
boxplot(DNA_Concentration_Ben~Year_Collected, data = dna, xlab = "year", ylab = "DNA concentration", col = "light green")

jpeg("./Bigelow_Plot1.jpeg")
boxplot(DNA_Concentration_Katy~Year_Collected, data=dna, xlab="year", ylab="DNA concentration", col= "violet")
dev.off()

jpeg("./Bigelow_Plot2.jpeg")
boxplot(DNA_Concentration_Ben~Year_Collected, data = dna, xlab = "year", ylab = "DNA concentration", col = "light green")
dev.off()

bvk <- (dna$DNA_Concentration_Ben-dna$DNA_Concentration_Katy)
min(bvk)
dna$Year_Collected[diff == min(diff)]

downlab <- dna %>% filter(Lab == "Downstairs")
downlab$Date_Collected <- as.POSIXct(downlab$Date_Collected)
#dna$Date_Collected <- as.character(dna$Date_Collected)

class(dna$Date_Collected)
plot(downlab$Date_Collected,downlab$DNA_Concentration_Ben,main = "Ben's Data Over Time",xlab = "Date Collected",ylab = "Concentration")

jpeg("./Practice_Ben_DNA_over_time.jpg")
plot(downlab$Date_Collected,downlab$DNA_Concentration_Ben,main = "Ben's Data Over Time",xlab = "Date Collected",ylab = "Concentration")
dev.off()