ggplot(mtcars, aes(x=wt,y=mpg,color = factor(disp))) +
  geom_point() + geom_smooth(method = "lm") +
  labs(title = "Effect of Weight on Miles per Gallon",
       x = "Weight", y = "Miles per Gallon",
       color = "Displacement")