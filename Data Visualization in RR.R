#########################################################################
# Data Visualization in R

#NOTE: YOU NEED TO RUN THE CODES SEQUENCIALLY

# Topic 1: Types of Graphic in R

#########################################################################
#########################################################################
#Following are the basic types of graphs, which can be chosen based on 
#the situation and the data available.

# Basic Visualization

# Scatter Plot
# Line Chart
# Bar Plot
# Pie Chart
# Histogram
# Density plot
# Box Plot

# Advanced Visualization
# Mosaic Plot
# 3D charts
# Correlation Plot
#########################################################################
# Basic plot - Scatter Plot

# Example -1
x <- c (1, 2, 3, 4, 5)
y <- c (1, 5, 3, 2, 0)

plot (x, y)

# Example -2
dose <- c(20, 30, 40, 50, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(40, 31, 25, 18, 12)

plot(dose, drugA)
plot(dose, drugB)

help(plot)
#type argument
#"p" for points,
#"l" for lines,
#"b" for both,
#"c" for the lines part alone of "b",
#"o" for both 'overplotted',
#"h" for 'histogram' like (or 'high-density') vertical lines,
#"s" for stair steps,
#"S" for other steps, see 'Details' below,
#"n" for no plotting.

#Different types of plot
plot(dose, drugA, type="p")
plot(dose, drugA, type="l")
plot(dose, drugA, type="b")
plot(dose, drugA, type="c")
plot(dose, drugA, type="o")
plot(dose, drugA, type="h")
plot(dose, drugA, type="s")
plot(dose, drugA, type="n")


# Line Chart
plot(AirPassengers,type="l")  #Simple Line Plot

#Example 2
# Create the data for the chart.
v <- c(7,12,28,3,41)

# Plot the bar chart. 
plot(v,type = "o")

# Plot the bar chart.
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")

#Multiple Lines
# More than line can be drawn on the same chart by using the line() function
# Create the data for the chart.
t <- c(14,7,6,19,3)

lines(t, type = "o", col = "blue")

#################################################################################
###############################################################################
#Pie Chart
#Simple Pie Charts
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")


#Pie Chart with Annotated Percentages
pct <- round(slices/sum(slices)*100)
pct
lbls <- paste(paste(lbls, round(pct),"%",sep=" ")) # add % to
lbls
pie(slices,labels = lbls)
pie(slices,labels = lbls,col=rainbow(length(lbls)), main="Pie Chart of Countries")


#3D Exploded Pie Chart
#install.packages("plotrix")
library(plotrix)

slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany","France")
pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart")

###############################################################################
# Boxplot
vec <- c(3,2,5,6,4,8,1,2,3,2,4,30,36)
?boxplot
boxplot(vec)
boxplot(vec, varwidth = TRUE)

# Boxplot of MPG by Car Cylinders 
# a formula, such as y ~ grp, where y is a numeric vector of data values 
# to be split into groups according to the grouping variable grp (usually a factor).
boxplot(mpg~cyl, data = mtcars)
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon",col=(c("gold","darkgreen","Blue")))


###############################################################################
#########################################################################
# Mosiac Plot
data(HairEyeColor)
mosaicplot(HairEyeColor)

?mosaicplot
###############################################################################
#3D graph with lattice package
library(lattice)
attach(mtcars)

# Change am column to factor as "Automatic" and "Manual"
mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

#3d scatterplot by factor level
cloud(hp~mpg*wt, data = mtcars)
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot")
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl)
cloud(hp~mpg*wt, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)
cloud(hp~mpg*wt|am, data = mtcars, main = "3D Scatterplot", col = cyl, pch = 17)

?cloud

##############################################################
# 3D graph with plotly packaage
install.packages("plotly")
library(plotly)

data(mtcars)

# Basic 3D Scatter Plot
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec)


# Basic 3D Scatter Plot with Color
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E')) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Weight'),
                      yaxis = list(title = 'horsepower'),
                      zaxis = list(title = 'qsec')))


#3D Scatter Plot with color scaling
plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec,
        marker = list(color = ~mpg, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'Weight'),
                      yaxis = list(title = 'horsepower'),
                      zaxis = list(title = 'qsec')),
         annotations = list(
           x = 1.13,
           y = 1.05,
           text = 'Miles/(US) gallon',
           xref = 'paper',
           yref = 'paper',
           showarrow = FALSE
         ))


# Load the `plotly` library
library(plotly)

# Your volcano data
str(volcano)
volcano

# The 3d surface map
plot_ly(z = ~volcano, type = "surface")

#########################################################################
#Correlation Plot
# Load the corrplot library for the corrplot() function
install.packages(corrplot)
library(corrplot)

# Check whether all the variable are numeric or not
str(mtcars)

# Compute the correlation matrix for these variables
corrMat <- cor(mtcars)

# Generate the correlation plot
corrplot(corrMat)

# Generate the correlation ellipse plot
corrplot(corrMat, method = "ellipse")


##################################################################################
##################################################################################
# Topic 2: Graphics with Ggplot2
install.packages(ggplot2)
library(ggplot2)

# ggplot2 Layer: 
###########################################################################
#1. Data Layer
#2. Aesthetic layer: x-axis, y-axis, color, fill, size
#3. Geometric layer: point, line, histogram, barplot, boxplot
#4. Facet layer: column , rows
#5. Statics layer: binning, smoothing
#6. Coordinates layer: fixed, polar, cartesian
#7. Themes Layer: non data link
###########################################################################
# Scatter plot
ggplot(mtcars, aes(x=wt, y = mpg)) # 2 Layer
ggplot(mtcars, aes(x=wt, y = mpg))+ geom_point() # 3 Layer

# Adding color
ggplot(mtcars, aes(x=wt, y = mpg, col = disp))+geom_point() # 3 Layer

#Adding color based on a factor
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()# 3

#Add size
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()


# Add color and shape (4 aesthetics):
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am))) + geom_point()

# Add color shape and size(hp/wt) (5 aesthetics):
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am), size = (hp/wt))) + geom_point()


#############################################################
#Bar Plot
p <- ggplot(mtcars, aes(x= factor(cyl)))
p

p + geom_bar()
ggplot(mtcars, aes(x= factor(cyl), fill = factor(am)))+ geom_bar()


# Histogram
q <- ggplot(mtcars, aes(x= mpg))

q + geom_histogram()
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5)
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black")
ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black", fill = "blue")


# Density plot
q + geom_density(color = "black", fill = "blue")

#Boxplot
ggplot(mtcars, aes(x=factor(cyl), y = mpg))+ geom_boxplot(color = "black", fill = "lightblue")

####################################################################
# Facet Layer
#Split the whole dataset based on a character along row or column
mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), col = qsec)) + 
  geom_point() + 
  facet_grid(.~am)


# Basic scatter plot
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
p

# 1 - Separate rows according to transmission type, am
p + facet_grid(am ~ .)

# 2 - Separate columns according to cylinders, cyl
p + facet_grid(. ~ cyl)

# 3 - Separate by both columns and rows 
p + facet_grid(am ~ cyl)


#################################################################
# Statistics Layer
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method = lm, col = "red")

#Smoothing
# A scatter plot with LOESS smooth
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()

# A scatter plot with an ordinary Least Squares linear model
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm")

# The previous plot, without CI ribbon
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# The previous plot, without points
ggplot(mtcars, aes(x = wt, y = mpg)) +
  stat_smooth(method = "lm", se = FALSE)

#Grouping variables
# 1 - Define cyl as a factor variable
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE)

#################################################################
# Coordinates layer
# Controls plot dimension

ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + 
  stat_smooth(method = lm, col = "red") +
  scale_y_continuous("mpg",limits = c(2,35),expand = c(0,0)) +
  scale_x_continuous("wt",limits = c(0,20), expand = c(0,0)) +
  coord_equal() #1:1 aspect ratio


#Zoomin in
# Basic ggplot() command, coded for you
p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()
p

# Add coord_cartesian(): the proper way to zoom in
p + coord_cartesian(xlim = c(3, 6))


#################################################################
# Theme Layer
# Starting point
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
p
z = p + facet_grid(. ~ cyl)
z

# Plot 1: Change the plot background fill to darkgrey
z + 
  theme(plot.background = element_rect(fill = "darkgrey"))

# Plot 2: Adjust the border to be a black line of size 3
z + 
  theme(plot.background = element_rect(fill = "darkgrey", color = "black", size = 3)) 


# Recycle Theme
# Save Theme
# Use of element_text(), element_line(), element_rect()
mtcar_theme <- theme(panel.background = element_blank(),
                     plot.background = element_rect(fill = "lightyellow"),
                     legend.background = element_blank(),
                     legend.key = element_blank(),
                     strip.background = element_rect(color = "green"),
                     
                     axis.text = element_text(colour = "Blue"),
                     axis.text.x = element_text(angle = 45),
                     strip.text = element_blank(),
                     
                     panel.grid.major = element_line(colour = "lightblue"),
                     panel.grid.minor = element_line(colour = "pink"),
                     axis.line = element_line(colour = "lightblue")
                     
)
mtcar_theme

#Recycle Theme
p
p + facet_grid(am ~ cyl)
p + facet_grid(am ~ cyl) + mtcar_theme


# Inbuilt Theme
p + facet_grid(am ~ cyl) + theme_classic()
p + facet_grid(am ~ cyl) + theme_linedraw()
p + facet_grid(am ~ cyl) + theme_bw()
p + facet_grid(am ~ cyl) + theme_dark()
p + facet_grid(am ~ cyl) + theme_light()
p + facet_grid(am ~ cyl) + theme_gray()
