data("mtcars")
str(mtcars)

?mtcars

df <- subset(mtcars, am == 0)

write.csv(df,"./df.csv")

ggplot(mtcars,aes(x=hp,y=mpg)) +
  geom_point() +
  geom_smooth(method = "lm",se = FALSE) +
  labs(title = "Miles per Gallon as a Function of Horsepower",
       x="Horsepower",
       y="Miles per Gallon") +
  theme_minimal()

png("./mpg_vs_hp_auto.png")
ggplot(mtcars,aes(x=hp,y=mpg)) +
  geom_point() +
  geom_smooth(method = "lm",se = FALSE) +
  labs(title = "Miles per Gallon as a Function of Horsepower",
        x="Horsepower",
        y="Miles per Gallon") +
  theme_minimal()
dev.off()

ggplot(mtcars, aes(x=wt,y=mpg,color = factor(am))) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Effect of Weight on Miles per Gallon",
       x = "Weight\nin tons", y = "Miles per Gallon",
       color = "Transmission") +
  theme_classic()

tiff("./mpg_vs_wt_auto.tiff")
ggplot(mtcars, aes(x=wt,y=mpg,color = factor(am))) +
  geom_point() + geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Effect of Weight on Miles per Gallon",
       x = "Weight\nin tons", y = "Miles per Gallon",
       color = "Transmission") +
  theme_classic()
dev.off()

df2 <- subset(mtcars, disp <= 200)

write.csv(df2,"./mtcars_max200_disp.csv")

mtcars_max <- max(mtcars$hp)

transmission_max <- max(df$hp)

displacement_max <- max(df2$hp)

hp_max <- c(mtcars_max,transmission_max,displacement_max)

write.table(hp_max,"./hp_maximums.txt")



