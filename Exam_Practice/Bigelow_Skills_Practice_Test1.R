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

plot(y=dna$DNA_Concentration_Katy,x=dna$Year_Collected)
plot(dna$Year_Collected,dna$DNA_Concentration_Ben)

dna$DNA_Concentration_Katy-dna$DNA_Concentration_Ben
years <- as.numeric(dna$Year_Collected)
mean(dna$DNA_Concentration_Ben)

for (i in levels(factor(dna$Year_Collected))){
  #print(i)
  #print(mean(dna$DNA_Concentration_Ben))
  #print(mean(dna$DNA_Concentration_Katy))
  
  print (c(i, mean(dna$DNA_Concentration_Ben), mean(dna$DNA_Concentration_Katy)))
}





