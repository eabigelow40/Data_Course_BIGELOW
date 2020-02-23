data("diamonds")
library(tidyverse)

glimpse(diamonds)
?diamonds




ggplot(diamonds,aes(x=carat,y=price)) + geom_point()

ggplot(diamonds,aes(x=carat,y=price)) + geom_hex(alpha=.25) +
  geom_smooth(method = "lm",aes(color=cut)) +
  coord_cartesian(ylim = c(0,20000)) +
  facet_wrap(~cut)

# slope of the line changes based on the cut
ggplot(diamonds,aes(x=carat,y=price)) + geom_hex(alpha=.25) +
  geom_smooth(method = "lm",aes(color=cut)) +
  coord_cartesian(ylim = c(0,20000))
  
# slope of the line changes based on clarity now
ggplot(diamonds,aes(x=carat,y=price)) + geom_hex(alpha=.25) +
  geom_smooth(method = "lm",aes(color=clarity)) +
  coord_cartesian(ylim = c(0,20000))

ggplot(diamonds,aes(x=carat,y=price)) + geom_hex(alpha=.25) +
  geom_smooth(method = "lm",aes(color=clarity)) +
  coord_cartesian(ylim = c(0,20000)) +
  facet_wrap(~cut)

# ~ = is a function of and left is the dependent variable
mod1 <- lm(data = diamonds, price ~ carat)
mod2 <- lm(data = diamonds,price ~ carat + clarity)

summary(mod1)
summary(mod2) # clarity is an ordered factor which makes it difficult to make a prediction

newdata <- data.frame(carat = c(2,2.1,2.2,2.3))

newdata2 <- data.frame(carat = c(2,2.1,2.2,2.3),
                       clarity = "I1")

predict(mod1,newdata = newdata)

predict(mod2,newdata = newdata2)

# Here are some packages to install for doing my phylogeny = ape,phangorn,msa (installed ape and phangorn already)

# Library(beepr) used as an alarm if I am working on multiple things
# Library(praise) will give me praise randomly haha