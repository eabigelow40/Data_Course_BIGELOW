# my new file
#load tidyverse
library(tidyverse)
# load loblolly data set
data("Loblolly")

?Loblolly

class(Loblolly$Seed)
class(Loblolly$height)
num1 <- Loblolly$Seed[1]
num1+1

str(Loblolly)
summary(Loblolly)

table(Loblolly$Seed)
levels(Loblolly$Seed)

as.numeric(Loblolly$Seed)
as.character(Loblolly$Seed) 

as.numeric(as.character(Loblolly$Seed))

nums1 <- as.character(Loblolly$Seed) %>%
  as.numeric()

nums1[1] + 1

glimpse(Loblolly)

hist(Loblolly$height)
hist(Loblolly$height,breaks = 84)

plot(y=Loblolly$height,x=Loblolly$age,col=Loblolly$Seed,pch=19,main = "age vs height",xlab = "Tree Age",
     ylab = "Tree Height")
plot(x=Loblolly$Seed,y=Loblolly$height)
table(Loblolly$Seed,Loblolly$age)
plot(Loblolly$Seed,Loblolly$age)


