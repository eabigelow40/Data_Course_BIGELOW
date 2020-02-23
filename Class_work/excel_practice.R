library(readxl)
library(tidyverse)
data("iris")

read_xlsx()

# load some data
dat <- read_xlsx("./Data/wide_data_example.xlsx") # excel spreadsheet
data("iris")

# One variable per column...is clean data
# `` has to be used when there is a space in the column names
ggplot(dat,aes(x=`Treatment 1`,y=`Treatment 2`)) +
  geom_point()

# Clean the data
# find and destroy the "?" 
dat$`Treatment 1`[dat$`Treatment 1` =="?"] <- NA
# convert treatment 1 to numeric
dat$`Treatment 1` <- as.numeric(dat$`Treatment 1`)

# CHange the column names so I don't have to keep using the backticks...clean column names
names(dat) <- c("SampleID","Treatment1","Treatent2") 

dat
# tidy it to "long format" = 
long <- gather(dat,key = "Watering",value = "Height",2:3)

long

ggplot(long,aes(x=SampleID,y=Height,color=Watering)) + geom_boxplot()

# get rid of treatment text
long$Watering <- str_replace(long$Watering,"Treatment","")

# Save it
write.csv(long,"./Data/long_and_tidy.csv",row.names = FALSE)



ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,image=img)) +
  geom_point() + theme_minimal()













