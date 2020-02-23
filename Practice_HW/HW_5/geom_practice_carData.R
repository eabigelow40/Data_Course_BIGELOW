# load new package for dataset
library(carData)
library(plotly) # makes the graph interactive
library(RColorBrewer)

# carData::

library(tidyverse)
library(skimr)

# load some data sets from carData package

df <- MplsStops
df2 <- MplsDemo

# set global options
options(scipen = 999) # gets rid of scientific notation


# quick look at data
skim(df) # "skim" overall summary, each column is broken down into its data types
skim(df2)

?MplsStops

# identify dependent and independent variables of interest -> this is the next step to understanding the data
# vehicle searches based on race

p <- ggplot(df,aes(x=lat, y=long, color=race)) +
  geom_point(alpha = .1)

# Can combine based on neighborhood
names(df)
names(df2)

# need to combine demographics info with stop info...
# make a new data frame that has everything in it
# full_join is in tidyverse
df3 <- full_join(df,df2,by="neighborhood")

ggplot(df3,aes(x=lat,y=long,color=black,size=collegeGrad)) +
  geom_point(alpha=.5)

ggplotly(p) # making the plot interactive

# topographical map = geom_dnesity_2D
ggplot(df3,aes(x=lat,y=long,fill=race)) +
  geom_density_2d() 


ggplot(df3,aes(x=lat,y=long,fill=race)) +
  geom_hex(alpha=.5)

ggplot(df3,aes(x=lat,y=long,fill=race)) +
  geom_density_2d()

# the next two display the same graph
ggplot(df2,aes(x=foreignBorn,y=collegeGrad,size=hhIncome)) +
  geom_point() +
  geom_smooth(method="lm",show.legend = FALSE)

ggplot(df2,aes(x=foreignBorn,y=collegeGrad)) +
  geom_point(aes(size=hhIncome)) +
  geom_smooth(method="lm") +
  
# switching the geoms will layer them differently on top of each other on the graph
ggplot(df2,aes(x=foreignBorn,y=collegeGrad)) +
  geom_point(aes(size=hhIncome),color="purple",alpha=.5) +
  geom_smooth(method="lm",color="black") +
  labs(size="Household Income",x="Foreign-Born Residents",y="% College Grads") +
  theme_bw()

df4 <- carData::Friendly
?Friendly

ggplot(df4,aes(x=condition,y=correct,fill=condition)) +
  geom_boxplot(alpha=.25) + geom_point(alpha=1) + theme_bw() +
  geom_violin() + geom_jitter(height = 0)

df5 <- carData::Chile
?Chile
skim(df5)

ggplot(df5,aes(x=sex,y=income)) +
  geom_violin()

df5 %>% 
  filter(vote %in% c("N","Y")) %>%
  ggplot(aes(x=statusquo,y=age,color=vote)) +
  geom_point(alpha=.5) +
  facet_wrap(~region)
#facet_wrap makes multiple plots

ggplot(df5,aes(x=age,y=statusquo)) +
  geom_smooth(method="lm") + geom_point()

ggplot(df5,aes(x=statusquo,fill=sex)) +
  geom_density(alpha=.5) + facet_wrap(~region) + theme_minimal() +
  labs(x="Status Quo Score",y="Density",fill="Sex")


# research/learn about scale_fill_discrete and scale_fill_manual
ggplot(df5,aes(x=statusquo,fill=sex)) +
  geom_density(alpha=.5) + facet_wrap(~region) + theme_minimal() +
  labs(x="Status Quo Score",y="Density",fill="Sex") +
  scale_fill_discrete(labels=c("Female","Male"))

pal <- c("#14438f","#145717")

ggplot(df5,aes(x=statusquo,fill=sex)) +
  geom_density(alpha=.5) + facet_wrap(~region) + theme_minimal() +
  labs(x="Status Quo Score",y="Density",fill="Sex") +
  scale_fill_manual(labels=c("Female","Male"),values = pal)



ggplot(df5,aes(x=income,fill=sex)) +
  geom_density(alpha=.5) + facet_wrap(~region)

ggplot(df5,aes(x=income,y=statusquo)) +
  geom_smooth(method="lm") + geom_point()

df6 <- carData::Adler

skim(df6)

ggplot(df6,aes(x=rating,y=expectation)) + # not an informative graph
  geom_point()

ggplot(df6,aes(x=expectation,fill=rating)) +
  geom_density() + facet_wrap(~instruction) # shows a pattern; when given priming instructions, "experimentors" judged according to instructions that primed them

df7 <- carData::AMSsurvey

?carData::AMSsurvey
  
df7 %>% filter(sex %in% c("Male","Female")) %>% 
  ggplot(aes(x=type,y=count)) +
  geom_point(method = "lm")
  
?carData::Angell

df8 <- carData::Angell

carData::Angell
  
ggplot(df8,aes(x=hetero,y=moral)) +
  geom_point(aes(color=hetero)) + geom_smooth(method = "lm",se=FALSE)
  
  
  
  
  
  
  
  

