library(tidyverse)
data("iris")

ggplot(iris,aes(x=Sepal.Length,y=Petal.Length,color = Species)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Sepal Length vs Petal Length",
       subtitle = "for three iris species") +
  theme_minimal()

png()

ggplot(iris,aes(x=Petal.Width, fill = Species)) +
  geom_density(alpha = .4) +
  labs(title = "Distribution of Petal Widths",
       subtitle = "for three Iris species") +
  theme_minimal()

ggplot(iris,aes(x=Sepal.Width,y=Petal.Width,fill = Species)) +
  geom_boxplot() + theme_minimal() +
  labs(title = "Sepal- to Petal-Width Ratio",
       subtitle = "for three iris species",
       x = "Species",
       y = "Ratio of Sepal Width to Petal Width") # + coord_cartesian(xlim = c(0,2),ylim = c(0,1))
