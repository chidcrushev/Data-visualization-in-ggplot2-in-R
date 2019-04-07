#read the csv file
data <- read.csv(file.choose())
data

#Gives the factors of the data set
# Computers recognize the large data sets using factors(ex.1,2,3, for "High Income", "Low Income", "Very Low Income")
# Levels are used to identify the values corresponding to each factor.
str(data)

#Gives the max,min and median values of the data set
summary(data)

#Conversion of non-factor column value into factor
colnames(data) <-
  c("Name",
    "Genre",
    "Criticsratings",
    "Audienceratings",
    "Budget",
    "Year")
head(data)
data$Year <- factor(data$Year)
head(data)
str(data)
#output
#'data.frame':	562 obs. of  6 variables:
#  $ Name            : Factor w/ 562 levels "(500) Days of Summer ",..: 1 2 3 4 5 6 7 8 9 10 ...
#$ Genre           : Factor w/ 7 levels "Action","Adventure",..: 3 2 1 2 3 1 3 5 3 3 ...
#$ Critics ratings : int  87 9 30 93 55 39 40 50 43 93 ...
#$ Audience ratings: int  81 44 52 84 70 63 71 57 48 93 ...
#$ Budget          : int  8 105 20 18 20 200 30 32 28 8 ...
#$ Year            : Factor w/ 5 levels "2007","2008",..: 3 2 3 4 3 3 2 1 5 5 ...

#ggplot2
library(ggplot2)
a <-
  ggplot(data = data, aes(x = Criticsratings, y = Audienceratings, colour =
                            Genre))

a + geom_point()
a + geom_line()
#Multiple layers
a + geom_point() + geom_line()

#overriding aesthetics
#Mapping
# It assigns colour to each specific category of budget
a + geom_point(aes(colour = Budget))

#Setting
#It sets colour to be blue for all categories
a + geom_point(colour = "blue")

#To create histograms
y <- ggplot(data = data, aes(x = Criticsratings))
y + geom_histogram(binwidth = 5, aes(fill = Year), colour = "Black")

#To create density charts
y + geom_density(aes(fill = Genre))

#ggplot2
#seven layers
#1.Data 2.Aesthetics 3.Geometry 4. Statistics 5. Coordinates 6. Facets  7.Theme

#statistics
a + geom_point(aes(colour = Genre), size = 1) + geom_smooth(fill = NA)

#box plots and jitter
a + geom_boxplot(size = 1) + geom_jitter(size = 0.1)

#facets
y + geom_histogram(binwidth = 5, aes(fill = Year), colour = "Black") +
  facet_grid(Year ~ ., scales = "free")

a + geom_point() +
  facet_grid(Genre ~ ., scales = "free")

#coordinates
a + geom_point() + xlim(50, 100) + ylim(0, 60)

#zooming in
a + geom_point() + xlim(50, 100) + coord_cartesian(ylim = c(40, 60))


#Theme
a + xlab("Critics") + ylab("Audience") +
  ggtitle("Critics Ratings vs Audience Ratings") +
  theme(
    axis.title.x = element_text(colour = "Red"),
    axis.title.y = element_text(colour = "Red"),
    plot.title = element_text(colour = "Blue"),
    legend.text = element_text(colour = "Blue")
  )
