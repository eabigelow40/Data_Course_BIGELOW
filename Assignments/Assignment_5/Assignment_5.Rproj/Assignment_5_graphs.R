library(tidyverse)
data("iris")

# make a plot
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length,color = Species)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Sepal Length vs Petal Length",
       subtitle = "for three iris species") +
  theme_minimal()

# save the plot
png("./iris_fig1.png")
ggplot(iris,aes(x=Sepal.Length,y=Petal.Length,color = Species)) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Sepal Length vs Petal Length",
       subtitle = "for three iris species") +
  theme_minimal()
dev.off()

#make a plot
ggplot(iris,aes(x=Petal.Width, fill = Species)) +
  geom_density(alpha = .4) +
  labs(title = "Distribution of Petal Widths",
       subtitle = "for three Iris species") +
  theme_minimal()

# save a plot
png("./iris_fig2.png")
ggplot(iris,aes(x=Petal.Width, fill = Species)) +
  geom_density(alpha = .4) +
  labs(title = "Distribution of Petal Widths",
       subtitle = "for three Iris species") +
  theme_minimal()
dev.off()

# make a plot
ggplot(iris,aes(x=Sepal.Width,y=Petal.Width,fill = Species)) +
  geom_boxplot() + theme_minimal() +
  labs(title = "Sepal- to Petal-Width Ratio",
       subtitle = "for three iris species",
       x = "Species",
       y = "Ratio of Sepal Width to Petal Width") # + coord_cartesian(xlim = c(0,2),ylim = c(0,1))

# save a plot
png("iris_fig3.png")
ggplot(iris,aes(x=Sepal.Width,y=Petal.Width,fill = Species)) +
  geom_boxplot() + theme_minimal() +
  labs(title = "Sepal- to Petal-Width Ratio",
       subtitle = "for three iris species",
       x = "Species",
       y = "Ratio of Sepal Width to Petal Width")
dev.off()

iris$`flower name` <- rownames(iris)
iris$Sepal.Length_z <- round((iris$Sepal.Length - mean(iris$Sepal.Length))/
                               sd(iris$Sepal.Length),2)
iris$Sepal.Length_type <- ifelse(iris$Sepal.Length_z < 0, "below","above")
iris <- iris[order(iris$Sepal.Length_z),]
iris$`flower name` <- factor(iris$`flower name`,levels = iris$`flower name`)

ggplot(iris,aes(x = `flower name`, y = Sepal.Length_z, color = Species)) +
  geom_bar(stat = "identity", aes(fill = Sepal.Length_type), width = .5) +
  #scale_fill_manual(name = "Species") +
  labs(title = "Sepal length deviance from the mean of all observations",xlab(""),ylab("")) +
  coord_flip()









