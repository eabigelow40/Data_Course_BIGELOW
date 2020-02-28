library(tidyverse)
options(scipen = 999)

names(landdata_states)

landdata_states$Year


# plot 1
ggplot(landdata_states,aes(x=Year,y=Land.Value,color=region)) +
  geom_smooth() + 
  coord_cartesian(ylim = c(0,600000)) +
  labs(y="Land Value (USD)") +
  theme_minimal()

jpeg("./Bigelow_Fig_1.jpeg")
ggplot(landdata_states,aes(x=Year,y=Land.Value,color=region)) +
  geom_smooth() + 
  coord_cartesian(ylim = c(0,600000)) +
  labs(y="Land Value (USD)") +
  theme_minimal()
dev.off()

landdata_states %>% filter(region == "NA")

names(unicef_u5mr)

df2 <- gather(unicef_u5mr,key = Year,value = Mortality_Rates,2:67)

names(df2)


# plot 2
ggplot(df2,aes(x=Year,y=Mortality_Rates,color=Continent)) +
  geom_point(size = 7.5) + theme_minimal() +
  labs(y="Mortality Rate") + theme(panel.grid.minor.x = element_blank())

jpeg("./Bigelow_Fig_2.jpeg")
ggplot(df2,aes(x=Year,y=Mortality_Rates,color=Continent)) +
  geom_point(size = 7.5) + theme_minimal() +
  labs(y="Mortality Rate")
dev.off()


# plot 3

ggplot(df2,aes(x=Year,y=Mortality_Rates,color = Continent)) +
  # geom_path() + 
  theme_minimal() + geom_line() +
  labs(y="Mean Mortality Rate (deaths per 1000 live births")

jpeg("./Bigelow_Fig_3.jpeg")
ggplot(df2,aes(x=Year,y=Mortality_Rates,color = Continent)) +
  # geom_path() + 
  theme_minimal() + geom_line() +
  labs(y="Mean Mortality Rate (deaths per 1000 live births")
dev.off()


# plot 4

ggplot(df2,aes(x=Year,y=Mortality_Rates)) +
  geom_point(color = "Blue") + facet_wrap(~Region) +
  theme_minimal()

jpeg("./Bigelow_Fig_4.jpeg")
ggplot(df2,aes(x=Year,y=Mortality_Rates)) +
  geom_point(color = "Blue") + facet_wrap(~Region) +
  theme_minimal()
dev.off()