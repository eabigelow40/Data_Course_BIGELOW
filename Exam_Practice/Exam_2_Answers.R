library(tidyverse)

options(scipen = 999)

dat <- read.csv("./Exam_2/landata-states.csv")

ggplot(dat,aes(x=Year,y=Land.Value,color=region))+
  geom_smooth() + theme_minimal() +
  labs(y="Land Value (USD)",
       color="Region")

dat[which(is.na(dat$region)), "State"] %>%
  unique()

dat2 <- read.csv("Exam_2/unicef-u5mr.csv")

long <- gather(dat2,key=Year,value = Mortality,2:67)

years <- str_remove(long$Year,"U5MR.") %>%
  as.numeric

long$Year <- years



long %>%
  ggplot(aes(x=Year,y=Mortality,color=Continent)) +
  geom_point() + theme_minimal()



long %>% group_by(Continent,Year) %>% summarise(mean(Mortality,na.rm = TRUE)) %>%
  ggplot(aes(x=Year,y=mearMR,color=Continent)) +
  geom_line(size=2) +
  theme_minimal()+
  labs(y="Mean Mortality Rate (deaths per 1000 live births")




long %>%
  ggplot(aes(x=Year,y=Mortality/1000)) +
  geom_point(color="Blue",alpha = .5) +
  facet_wrap(~Region) +
  theme_minimal() +
  theme(strip.background = element_rect(color="Black")) +
  labs(y="Mortality Rate")

