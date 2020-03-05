library(tidyverse)

data("midwest")

?midwest

midwest

ggplot(midwest) # this is an empty ggplot because there are no geoms to display the data and there is nothing sent to aes for an x/y axis

ggplot(midwest,aes(x=area, y=poptotal)) +
  geom_point()

ggplot(midwest,aes(x=area, y=poptotal)) +
  geom_point() + geom_smooth(method = "lm")

p <- ggplot(midwest,aes(x=area, y=poptotal)) +
  geom_point() + geom_smooth(method = "lm")

p

p + lims(x=c(0,0.1),y=c(0,1000000)) # This drew boundries that allowed to view a specific portion of the data. This method does eliminate data that fallw outside the specified range

p + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) # This also zoomed in but it did not eliminate any of the data points

p2 <- p + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))

p2 + labs(title = "Area vs Population",
          subtitle = "From midwest dataset",
          y="Population",
          x="Area",
          caption = "Midwest Demographics")

ggplot(midwest,aes(x=area,y=poptotal)) +
  geom_point(color = "steelblue",size = 3) + geom_smooth(method = "lm", color = "firebrick") +
  coord_cartesian(xlim=c(0,0.1),ylim = c(0,1000000)) +
  labs(title = "Area vs Population",
       subtitle = "From midwest dataset",
       y="Population",
       x="Area",
       caption = "Midwest Demographics") # This also changed the size of the data points

ggplot(midwest,aes(x=area,y=poptotal)) +
  geom_point(aes(color = state),size = 3) + geom_smooth(method = "lm", color = "firebrick") +
  coord_cartesian(xlim=c(0,0.1),ylim = c(0,1000000)) +
  labs(title = "Area vs Population",
       subtitle = "From midwest dataset",
       y="Population",
       x="Area",
       caption = "Midwest Demographics")

p3 <- ggplot(midwest,aes(x=area,y=poptotal)) +
  geom_point(aes(color = state),size = 3) + geom_smooth(method = "lm", color = "firebrick") +
  coord_cartesian(xlim=c(0,0.1),ylim = c(0,1000000)) +
  labs(title = "Area vs Population",
       subtitle = "From midwest dataset",
       y="Population",
       x="Area",
       caption = "Midwest Demographics")

p3

p3 + scale_color_brewer(palette = "set1")

pal = c("#c4a113","#c1593c","#643d91","#820616","#477887","#688e52",
        "#12aa91","#705f36","#8997b2","#753c2b","#3c3e44","#b3bf2d",
        "#82b2a4","#894e7d","#a17fc1","#262a8e","#abb5b5","#000000")

p3 + scale_color_manual(values = pal)

p3 + scale_x_reverse() # Reverses the graph
p3 + theme_minimal() # Reduces the look/aesthetics of the graph
p3 + theme_dark() # Gives the graph a dark back ground

p4 <- ggplot(midwest,aes(x=area/max(midwest$area),y=log10(poptotal))) +
  geom_point(aes(color=state),size=3) + geom_smooth(method = "lm", color = "firebrick") +
  labs(title = "Area vs Population",subtitle = "From midwest dataset",color = "State",
       y="Log10 Population",x="Area (proportion of max)",caption = "Midwest Demographics") +
  theme_minimal() +
  scale_color_manual(values = pal)

p4

p4 + facet_wrap(~state)

p4 + facet_wrap(~state, scales = "free")

p4 + facet_wrap(~state) + 
  theme(legend.position = "none", 
        strip.text.x = element_text(size = 12, face="bold"))

p4 + facet_wrap(~ state) + 
  theme(legend.position = "none",
        strip.text.x = element_text(size = 12, face="bold"), # found in the theme command
        strip.background = element_rect(fill = "lightblue"))

p5 = ggplot(midwest, aes(x=state,y=percollege, fill=state)) + 
  labs(x="State",y="Percent with college degree")

p5

p5 + geom_boxplot()
p5 + geom_violin()
p5 + geom_bar(stat="identity") # Doesn't look right

data("MplsStops")
ggplot(MplsStops, aes(x=lat)) + geom_histogram() + 
  labs(title = "Latitude of police stops in Minneapolis - 2017")
ggplot(MplsStops, aes(x=lat, fill = race)) + 
  geom_density(alpha = .5) + labs(title = "Latitude of police stops in Minneapolis - 2017")


ggplot(MplsStops, aes(x=lat, fill = race)) + 
  geom_histogram() + labs(title = "Latitude of police stops in Minneapolis - 2017") +
  facet_wrap(~race)

ggplot(MplsStops, aes(x=lat, fill = race)) + 
  geom_density(alpha = .5) + labs(title = "Latitude of police stops in Minneapolis - 2017") +
  facet_wrap(~race)

ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_point() + theme_minimal()

ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_point() + theme_minimal() + facet_wrap(~race) # "overplotting!?"
ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_point(alpha=.05) + theme_minimal() + facet_wrap(~race)

ggplot(MplsStops, aes(x=lat,y=long,color=race)) + geom_density_2d() + theme_minimal() + facet_wrap(~race)

ggplot(MplsStops, aes(x=lat,y=long)) + geom_bin2d()

ggplot(MplsStops, aes(x=lat,y=long)) + geom_bin2d() + facet_wrap(~race)


data("MplsDemo")

names(MplsDemo)

income = as.numeric(as.character(plyr::mapvalues(MplsStops$neighborhood, from=MplsDemo$neighborhood, to = MplsDemo$hhIncome)))

MplsStops$income <- income

ggplot(MplsStops, aes(x=lat,y=long,color=income)) + geom_point(alpha=.2)

ggplot(MplsStops, aes(x=income)) + geom_histogram(bins = 30)

counts = as.data.frame(table(MplsStops$income))
counts$Var1 <- as.numeric(as.character(counts$Var1))
mod1 = lm(Freq ~ Var1, data = counts)

ggplot(counts, aes(x=Var1,y=Freq)) + geom_point() + geom_smooth(method="lm") +
  labs(x="Mean neighborhood income",y="Numer of police stops",title = "Police stop counts in each neighborhood",
       subtitle = paste0("Adjusted R-sq. value = ",signif(summary(mod1)$adj.r.squared),3)) + 
  theme_minimal()

random_data = data.frame( x=rnorm(20000, 10, 1.9), y=rnorm(20000, 11, 4.5) )

plot(random_data$x)

ggplot(random_data, aes(x=x, y=y) ) +
  geom_point()









