library(tidyverse)
library(patchwork)
library(colorblindr) # get it off of github
library(RColorBrewer)
library(ggimage) # geom_image(aes(image=fn))
library(splines)
library(gganimate)

data("mtcars")

# Always get int an Rproj to do any work


p1 <- ggplot(mtcars,aes(x=disp,y=mpg,color = factor(cyl))) +
  geom_point()
# ggsave("./testplot.png",dpi=600, height=4, width = 4) by default it will save the last plot I made
# usually 300dpi is good publication quality
# pallet_plot() will show me the color pallet I want to use and the hexadecimal code

p1

pal <- c("#5f83b8", "#fcba03", "#af6bd1")

p5 <- p1 + theme_bw() +
  labs(title = "Miles per gallon vs. Displacement",
       x="Engine displacement",
       y="Miles per gallon",
       color="Number of\ncylinders", # \n = new line
       subtitle = "sure, why not",
       caption = "Brought to you by mtcars dataset") +
  scale_color_manual(values = pal)

p5

# google "custom point images for ggplot" "ggimage" makes images on graphs

p5 + 
  theme(title = element_text(color = "blue",
                             face = "italic"),
        panel.background = element_rect(fill = "Blue"),
        plot.background = element_rect(fill = "Red"),
        legend.background = element_rect(fill = "Purple"),
        panel.grid = element_line(size=2),
        legend.text = element_text(size = 20),
        axis.text.y = element_text(angle=180),
        axis.title.x = element_text(angle = 180))


mod <- lm(data=mtcars,formula = mpg ~ disp) # linear regression function/model
sumnmary(mod)
mtcars$resids <- residuals(mod)

ggplot(mtcars,aes(x=sqrt(disp),y=mpg)) +
  geom_point() + geom_smooth(method="lm",se=FALSE)
  # geom_segment(aes(xend=disp,yend=DIFF))

mtcars1 <- mutate(mtcars, DIFF = mgp-resids)



p2 <- ggplot(mtcars,aes(x=disp,y=mpg)) + geom_smooth()
  

p2

ggsave(filename = "./test1.png",device = "png", plot = p1)
ggsave(filename = "./test2.png", plot = p2, device = "png")

p3 <- ggplot(mtcars,aes(x=hp,y=mpg)) +geom_smooth()


(p1+p2)/p3
ggsave("multiplot.png")
p1+p2+p3
p1+p2/p3

p1 +theme_bw()
p4 <- p1 + scale_x_reverse()
p4 + theme_minimal()


df <- read.csv("./Data/mushroom_growth.csv")
glimpse(df)

ggplot(df,aes(x=Nitrogen,y=GrowthRate)) +
  geom_smooth(se=FALSE) + geom_point()


ggplot(df,aes(x=Nitrogen,y=GrowthRate,color=Light)) +
  geom_smooth(method="lm",formula = y ~ poly(x,2),se=FALSE) + 
  geom_point() + facet_wrap(~Species) +
  scale_color_gradient(low="Blue",high='Red')

mod2 <- lm(data=df,GrowthRate ~ poly(Nitrogen,2))

ggimage::list.pokemon()








