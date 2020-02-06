library(tidyverse)

# load some data

data("iris")

# subset directions for Tidyverse
# iris <- iris %>% filter(Species == "virginica")
iris <- iris %>% filter(Species == "virginica")

glimpse(iris)


# plot Sepal.Length is y-axis; Petal.Length is x-axis
# colored points in scatter plot by Species

plot(iris$Petal.Length,iris$Sepal.Length,col=iris$Species,pch=20,main = "You're gonna Hate Iris",xlab = "Petal Length",ylab = "Sepal Length")

summary(iris)

# Boxplot of Sepal Length as function of Species

plot(iris$Petal.Species,iris$Sepal.Length,main = "You're gonna Hate Iris",xlab = "Petal Length",ylab = "Sepal Length")

hist(iris$Sepal.Length,breaks = 30)

plot(density(iris$Sepal.Length))


#how to save a plot
#jpeg=open door
#give it a file path and directions for what is being saved
#dev.off=close the door to saving. Do not forget this step!!



jpeg("densityplot.jpeg")
plot(density(iris$Sepal.Length))
dev.off()






