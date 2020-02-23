# Assignment Week 3
library(tidyverse)



# topics:   type conversions, factors, plot(), making a data frame from "scratch",
#           reordering, 


# vector operations!

vector1 = c(1,2,3,4,5,6,7,8,9,10)
vector2 = c(5,6,7,8,4,3,2,1,3,10)

vector1*vector2

list.files()

# Lizzy used this to make dat work. setwd("/Users/<username>/Desktop/Data_Course/Data")

dat = read.csv("./Data/thatch_ant.csv") #???
names(dat)

#why are these plots different???
plot(x=dat$Headwidth..mm., y=dat$Mass)
plot(x=dat$Size.class, y=dat$Mass)

# Because Size.class is factor data which classifies catagorical data

#check the classes of these vectors
class(dat$Headwidth..mm.)
#"numeric"
class(dat$Size.class)
#"factor"

# plot() function behaves differently depending on classes of objects given to it!

# Check all classes (for each column in dat)
str(dat)

# Two of them are "Factor" ....why is the column "Headwidth" a factor? It looks numeric!

# we can try to coerce one format into another with a family of functions
# as.factor, as.matrix, as.data.frame, as.numeric, as.character, as.POSIXct, etc....

#make a numeric vector to play with:
nums = c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
class(nums) # make sure it's numeric

# convert to a factor
as.factor(nums) # show in console
nums_factor = as.factor(nums) #assign it to a new object as a factor
class(nums_factor) # check it

#check it out
plot(nums) 
plot(nums_factor)
# take note of how numeric vectors and factors behave differently in plot()

# Let's modify and save these plots. Why not!?
?plot()
plot(nums, main = "nums graph", xlab = "Occurance", ylab = "Elements")
plot(nums_factor, main = "nums_factor graph", xlab = "Occ", ylab = "Ele")

?jpeg()
jpeg("nums_graph.jpeg") 
plot(nums, main = "nums graph", xlab = "Occurance", ylab = "Elements")
dev.off()



# back to our ant data...
dat$Headwidth
levels(dat$Headwidth) # levels gives all the "options" of a factor you feed it

# I notice a couple weird ones in there: "" and "41mm"
# The "" means a missing value, basically. The "41mm" sure looks like a data entry error.
                                            # It should probably be "41.000"

# FIND WHICH ONES HAVE "41mm"
dat$Headwidth[dat$Headwidth == "41mm"] <- "41.000"


# CONVERT THOSE TO "41.000"
#replace(dat$Headwidth [1031] == ("41mm") <- "41.000" #This is wrong????

# DO THE SAME FOR "", BUT CONVERT THOSE TO "NA"
dat$Headwidth[dat$Headwidth == ""] <- NA


# NOW, REMOVE ALL THE ROWS OF "dat" THAT HAVE AN "NA" VALUE
dat2 <- na.omit(dat)

#At this point why does it still look like 41mm is still there?

# NOW, CONVERT THAT PESKY "Headwidth" COLUMN INTO A NUMERIC VECTOR WITHIN "dat"
levels(dat2$Headwidth)
unique(dat2$Headwidth)


factor(dat2$Headwidth, levels = unique(dat2$Headwidth))
dat2$Headwidth <- factor(dat2$Headwidth, levels = unique(dat2$Headwidth))

as.numeric(as.character(dat2$Headwidth)) #same as tidyverse method
#tidyverse method 
dat2$Headwidth %>% as.character() %>% as.numeric()

dat2$Headwidth <- dat2$Headwidth %>% as.character() %>% as.numeric() #saved it as an object

plot(dat2$Headwidth,dat2$Mass) #plot this




# LET'S LEARN HOW TO MAKE A DATA FRAME FROM SCRATCH... WE JUST FEED IT VECTORS WITH NAMES!



# make some vectors *of equal length* (or you can pull these from existing vectors)
col1 = c("hat", "tie", "shoes", "bandana")
col2 = c(1,2,3,4)
col3 = factor(c(1,2,3,4)) # see how we can designate something as a factor             

# here's the data frame command:
data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # colname = vector, colname = vector....
df1 = data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # assign to df1
df1 # look at it...note column names are what we gave it.



# Make a data frame from the first 20 rows of the ant data that only has "Colony" and "Mass"
# save it into an object called "dat3"

colA = c(dat$Colony[1:20])
colB = c(dat$Mass[1:20])

data.frame(Colony = colA, Mass = colB)
dat3 = data.frame(Colony = colA, Mass = colB)


###### WRITING OUT FILES FROM R #######
?write.csv()


# Write your new object "dat3" to a file named "LASTNAME_first_file.csv" in your PERSONAL git repository
write.csv(dat3, file = "BIGELOW_first_file.csv")

plot(y=dat2$Mass,x=dat2$Size.class)

under30_mass <- dat2 %>% filter(Size.class == "<30") %>%
  select(Mass)

mean(under30_mass)




### for loops in R ###

#simplest example:
for(i in 1:10){
  print(i)
}

#another easy one
for(i in levels(dat$Size.class)){
  print(i)
}

# can calculate something for each value of i ...can use to subset to groups of interest
for(i in levels(dat$Size.class)){
  print(i) 
  print(mean(dat2[dat2$Size.class == i,"Mass"]))
}

# my example -> mean(dat2[dat2$Size.class == "<30","Mass"])
# more complex:
# define a new vector or data frame outside the for loop first
new_vector = c() # it's empty
# also define a counter
x = 1

for(i in levels(dat2$Size.class)){
  new_vector[x] = mean(dat2[dat2$Size.class == i,"Mass"]) #asking it subset
  x = x+1 # add 1 to the counter (this will change the element of new_vector we access each loop)
}
  
#check it
new_vector



# PUT THIS TOGETHER WITH THE LEVELS OF OUR FACTOR SO WE HAVE A NEW DATA FRAME:
# FIRST COLUMN WILL BE THE FACTOR LEVELS....
# SECOND COLUMN WILL BE NAMED "MEAN" AND WILL BE VALUES FROM  new_vector

#fill it in

MEAN <- new_vector #???

size_class_mean_mass = data.frame(Size_Class = levels(dat2$Size.class), MEAN = new_vector)

size_class_mean_mass


dat2summary <- dat2 %>% group_by(Size.class) %>%
  summarise(MEAN = mean(Mass)) #?????, left of = becomes column name and right of the = becomes the data 



############ YOUR HOMEWORK ASSIGNMENT ##############

# 1.  Make a scatterplot of headwidth vs mass. See if you can get the points to be colored by "Colony"

plot(dat2$Headwidth,dat2$Mass, main = "Thatch Ant Stats", xlab = "Headwidth", ylab = "Mass")

# 2.  Write the code to save it (with meaningful labels) as a jpeg file

jpeg("Thatch_Ant_Stats.jpeg")
plot(dat2$Headwidth,dat2$Mass, main = "Thatch Ant Stats", xlab = "Headwidth", ylab = "Mass")
dev.off()

# 3.  Subset the thatch ant data set to only include ants from colony 1 and colony 2

dat2 %>% filter(dat2$Colony) %>% filter(dat2$Colony[1:2])
dat2$Colony[1:2]

# 4.  Write code to save this new subset as a .csv file

csv("Colonies_1:2.csv")
dat2 %>% filter(dat2$Colony) %>% filter(dat2$Colony[1:2])
dev.off()

# 5.  Upload this R script (with all answers filled in and tasks completed) to canvas
      # I should be able to run your R script and get all the plots created and saved, etc.
