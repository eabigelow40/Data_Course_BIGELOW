library(ggplot2)
ggplot(mtcars, aes(x=wt,y=mpg,color = factor(disp))) +
  geom_point(size = 75) + geom_smooth(method = "lm") +
  labs(title = "Effect of Miles per Gallon on Weight",
       x = "tons and tons", y = "Miles per Gallon",
       color = "Displacement", subtitle = "Why does weight affect mpg anyway?") +
  theme(axis.text.x = element_text(angle = 270, color = "orange"),
        axis.text.y = element_text(angle = 90, color = "orange"), title = element_text(color = blues9),
        legend.text = element_text(size = 20, color = "orange"), 
        panel.background = element_rect(color = "light blue"), 
        plot.background = element_rect(fill = "orange"),
        panel.grid = element_line(size = 5, color = "orange"),
        legend.background = element_rect(fill = "light blue"))



ggsave("./ugly78.png",height = 20,width = 20)

