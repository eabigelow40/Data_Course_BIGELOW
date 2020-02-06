library(tidyverse)

df1 = read.delim("./Data/ITS_mapping.csv")

glimpse(df)
table(df$Ecosys_Type)

subset(df,"Ecosystem")

df[df$Ecosys_Type %in% c("Arial", "Marine"),] #base R

df2 <- df %>% filter(Ecosys_Type %in% c("Arial", "Marine")) #tidyverse method, use this because it works with many other things

plot(df2$Lat,df2$Lon)

df2=df %>% filter(Ecosys_Type %in% c("Marine", "Terrestrial"))

summary(df2)

mean(marine$Lat)
