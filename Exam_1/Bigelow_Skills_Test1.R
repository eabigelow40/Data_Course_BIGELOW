library(tidyverse)

read.csv("./DNA_Conc_by_Extraction_Date.csv")

df = read.csv("./DNA_Conc_by_Extraction_Date.csv")

summary(df)
class(df)
summarise(df)
glimpse(df)

hist(df$DNA_Concentration_Katy, main = "Katy's Work", xlab = "Concentration Stats")

hist(df$DNA_Concentration_Ben, main = "Ben's Work", xlab = "Concentration Stats")

