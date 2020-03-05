library(tidyverse)
library(modelr) #works with tidyverse
library(GGally) #summary stats and looking at model predictions
library(lindia)
library(skimr)
library(patchwork) #sticks plots together
library(caret)

data(mtcars)

# what variables are explanatory?
# cyl, hp, wt, vs, drat, and am
# after looking at mtcars in ggpairs, I can see that wt and hp have a neg. corr while drat has a positive corr

# what is the simplest model that has explanatory power?
# yet to be seen

mtcars %>% ggpairs
mtcars %>% filter()

mod1 <- lm(data = mtcars,formula = mpg ~ factor(cyl))
mod2 <- lm(data = mtcars,formula = mpg ~ factor(vs))
mod3 <- lm(data = mtcars,formula = mpg ~ drat)
mod4 <- lm(data = mtcars,formula = mpg ~ factor(am))
mod5 <- lm(data = mtcars,formula = mpg ~ hp)

# adding factor changes everything and made the predictions a little less accurate

summary(mod1)
summary(mod2)
summary(mod3)
summary(mod4)
summary(mod5)

# So far mpg ~ cyl is the best explanatory variable

gg_diagnose(mod1)
gg_diagnose(mod2)
gg_diagnose(mod3)
gg_diagnose(mod4)
gg_diagnose(mod5)

# mod3 displayed the most randomness

anova(mod1, mod2)
anova(mod1, mod3)
anova(mod1, mod4)
anova(mod1, mod5)
anova(mod2, mod3)
anova(mod2, mod4) # doesn't have a p-value
anova(mod2, mod5)
anova(mod3, mod4)
anova(mod3, mod5) # no p-value
anova(mod4, mod5)


mod1mse <- mean(residuals(mod1)^2)
mod2mse <- mean(residuals(mod2)^2)
mod3mse <- mean(residuals(mod3)^2)
mod4mse <- mean(residuals(mod4)^2)
mod5mse <- mean(residuals(mod5)^2)

mod1mse; mod2mse; mod3mse; mod4mse; mod5mse

# mod1 has the lowest mse

df_mod1 <- add_predictions(mtcars,mod1)
df_mod1

df <- gather_predictions(mtcars, mod1,mod2,mod3,mod4,mod5)
df
skim(df)
names(df)

p1 <- add_predictions(mtcars,mod2) %>%
  ggplot(aes(x=factor(vs),color=factor(cyl))) +
  geom_point(aes(y=mpg)) +
  geom_smooth(method = "lm", aes(y=pred))

p2 <- add_predictions(mtcars,mod3) %>%
  ggplot(aes(x=drat,color=factor(cyl))) +
  geom_point(aes(y=mpg)) +
  geom_smooth(method = "lm", aes(y=pred))

p3 <- add_predictions(mtcars,mod4) %>%
  ggplot(aes(x=factor(am),color=factor(cyl))) +
  geom_point(aes(y=mpg)) +
  geom_smooth(method = "lm", aes(y=pred))

p4 <- add_predictions(mtcars,mod5) %>%
  ggplot(aes(x=hp,color=factor(cyl))) +
  geom_point(aes(y=mpg)) +
  geom_smooth(method = "lm", aes(y=pred))

p2/p3
p1/p2
p4

set.seed(1213)
set <- caret::createDataPartition(mtcars$mpg, p=.5)
set <- set$Resample1

train <- mtcars[set,]
test <- mtcars[-set,]

formula(mod5)
mod5_cv <- lm(data=train, formula = formula(mod5))
mtcarstest <- add_predictions(test,mod5_cv)

ggplot(mtcarstest,aes(x=hp,color=factor(cyl))) +
  geom_point(aes(y=mpg),alpha = .25) +
  geom_point(aes(y=pred),shape=5)

testedresiduals <- (mtcarstest$pred - mtcarstest$mpg)

mod5mse
mean(testedresiduals^2)

df2 <- gather_predictions(mtcars,mod5,mod5_cv)
df2

ggplot(df2,aes(x=hp,color=factor(cyl))) +
  geom_point(aes(y=mpg),alpha=.2) +
  geom_smooth(method = "lm",aes(linetype=model,y=pred)) +
  theme_bw()











