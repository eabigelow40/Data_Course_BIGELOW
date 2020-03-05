library(tidyverse)

# VARIABLES PLOTTED OVER TWO COLUMNS WON'T EVER WORK <- I HAVE TO TURN ALL THE DATA I WANT INTO ONE COLUMN

# load "wide" data examples
df1 <- read.csv("./Data/FacultySalaries_1995.csv")

df2 <- read.csv("Data/wide_income_rent.csv")

# make boxplot (x-axis = Professor Rank, y-axis = 1995 Salary)

# gives the column names
names(df1)

# "key" new column name, "value" name of column for new data
long <- gather(df1,key = Rank,value = Salary,5:7)

long$Rank

# clean it up to say "FullProf"; HAVE TO CONVERT TO LONG FORMAT BEFORE BEING ABLE TO MAKE BOXPLOT
# tell it what to remove; also left side applies to the second str_remove as well
newranknames <- str_remove(long$Rank,"Avg") %>% str_remove("Salary")

long$Rank <- newranknames                     

ggplot(long,aes(x=Rank,y=Salary,fill=Rank)) + geom_boxplot() +
  scale_fill_brewer(palette = 2)

# same plot but with Avg Compensation for each prof rank

names(long)

long2 <- long %>% gather(key = CompRank,value = Compensation,6:8)

ggplot(long2,aes(x=Rank,y=Compensation,fill=Rank)) + geom_boxplot()



names(long2)

long3 <- gather(long2,key = Type,value = Dollars,c(13,14))

names(long3)

long3$Dollars = as.numeric(long3$Dollars)
ggplot(long3,aes(x=Rank,y=Dollars,fill=Rank)) + geom_boxplot() +
  facet_wrap(~Type)


glimpse(long3)
library(patchwork)

p1 <- ggplot(long2,aes(x=Rank,y=Compensation,fill=Rank)) + geom_boxplot() +
  theme(legend.position = "none")

p2 <- ggplot(long2,aes(x=Rank,y=Salary,fill=Rank)) + geom_boxplot()

# plot them together
p1+p2


names(df2)

longstate <- df2 %>% gather(key = State,value = MeanRent,2:53)

df2 %>% gather(key = State,value = MeanRent,2:53) %>%
ggplot(aes(x=State,y=MeanRent)) + geom_point() + facet_grid(~variable)















