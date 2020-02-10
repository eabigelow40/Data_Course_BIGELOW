library(tidyverse)

df = read.csv("../../../Data/ITS_mapping.csv")

df = read.delim("../../../Data/ITS_mapping.csv")

summary(df)
dim(df)
str(df)
names(df)

plot(df$Ecosystem,df$Lat)

png("../silly_boxplot.png")
plot(df$Ecosystem,df$Lat)
dev.off()