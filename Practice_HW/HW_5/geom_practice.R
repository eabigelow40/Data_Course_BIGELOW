library(tidyverse)

#load some data
data("iris")
data("mtcars")
data("diamonds")


#ggplot
# first argument is a dataframe

#scatterplot, colored by species
ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, color = Species)) +
  geom_point()

#bar chart, colored by species
#error: stat_count() must not be used with a y aesthetic
  #geombar used the count statistic
?stat_count


#ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, color = Species)) +
#geom_point()

ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, color = Species)) +
  geom_col()

# bar chart, colored by species
# figure out difference between geom_col and geom_bar
ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, color = Species)) +
  geom_bar(stat = "identity")

# bar chrt showing mean of each species sepal length
ggplot(iris,aes(x = Sepal.Length,y = Sepal.Width, fill = Species)) +
  geom_bar(stat = "identity")

# this shows the sum
ggplot(iris, aes(x=species,y=Sepal.Length)) +
  geom_col()

iris %>% group_by(Species) %>%
  summarize(Mean = mean(Sepal.Length)) %>%

ggplot(aes(x=species,y=Mean,fill=Species)) +
  geom_col()
#ggplot wants just one dataframe wants it to be Tibble or...



#Another scatter plot
#Setosa and versicolor
#scatterplot:x=Sepal.Length, y=Sepal.Width, color=species

#ggplot(iris, aes(x=Sepal.Length,y=Sepal.Width,color = Species))
#shape will fill the data points with color

iris %>% filter(c(setosa,veriscolor))


iris %>% filter(Species %in% c("setosa","versicolor")) %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) +
  geom_point()

iris %>% filter(Species !="virginica") %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) +
  geom_point()


spp <- c("setosa","versicolor")

iris %>% filter(Species %in% spp) %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) +
  geom_point() + 
  geom_smooth(method = "lm")

#can keep stacking stuff to geom just with a plus
#have to give filter a column to work with -> hence the Species within the paranthises
# ~ ="as a function of"
#loess is a best fit line that has no equation for it. Takes every three points and then maps and switches directions if need be.

?geom_smooth


#plot with mpg on y-axis

names(mtcars)
ggplot(mtcars,aes)

mtcars %>%
  ggplot(aes(x=hp,y=mpg)) +
  geom_point() +
  geom_smooth(method = "lm")

# when too many data points, humans have a difficult time reading it
# added colors by googling "color picker" and cp the hashtag number
# alpha aes (aes::alpha -> the alpha function within the aes function) controls the transparancy of the data points
# when using the function "shape", ggplot will only use 6 shapes at a time. By default the other variables will go unplotted
# facets: subplots of the data set that each display one subset of the data
# geom is short for geometrical object that a plot uses to represent data
# https://www.ggplot2-exts.org/gallery/ (extension packages)
# http://rstudio.com/cheatsheets (ggplot2 cheatsheet)


pal <- c("#d6761c", "#f7e411", "#3b11f7")

ggplot(mtcars,aes(x=disp,y=mpg)) + 
  geom_point(aes(color=factor(cyl)), size = 3,shape = 3) + # we wanted geom_point to know about the color but nothing else in the equation
  geom_smooth(method = "lm",color="purple",size=4,linetype=2,se=FALSE) +
  labs(x="displacement",y="Miles per Gallon",title = "MPG ~ Disp",subtitle = "stuff",
       caption = "This is brought to you by the color purple",color="Cylinders") + 
  scale_color_manual(values = pal) +
  theme_bw()
 

   
#ggplot(mtcars,aes(x=disp,y=mpg,color=factor(cyl)) + 
 # geom_point() +
  #geom_smooth(method = "lm")

# online tools: R graph gallery.com(distribution and corolation), ggPlotteR - coding a plot


# examples from the reading

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = iris) + 
  geom_point(mapping = aes(x=Sepal.Length,y=Sepal.Width))

ggplot(mpg,aes(x=cyl,y=hwy)) +
  geom_point()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = displ < 5)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue")) # in this example the color function isn't working correctly because color is included the aes.
# It should be outside the aes parantheses

# facet_wrap should use a discrete variable
# tilde is used as a formula (formula is a data structure within R) 
  #Is tilde a data structure that is created???
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# facet_grid is used when inputing two variables
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

# using a . allows for eliminating the use of either rows or columns
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE)

# se means display confidence interval around smooth? True by default  
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE,show.legend = FALSE)
    
# These two will not look different
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(mpg, aes(x=displ, y=hwy, color = drv, linetype = drv)) +
  geom_point(size = 3) +
  geom_smooth(se = FALSE)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))











