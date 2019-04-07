data <- read.csv(file.choose())
head(data)

colnames(data) <-
  c(
    "ReleaseDay",
    "Director",
    "Genre",
    "Title",
    "ReleaseDate",
    "Studio",
    "AdjustedGross",
    "Budget",
    "Gross",
    "Imdbrating",
    "MovieLensRating",
    "OverseasGross",
    "OverseasPercent",
    "Profit",
    "ProfitPercent",
    "Runtime",
    "USGross",
    "USGrossPercent"
  )
studios <-
  c("Buena Vista Studios",
    "Fox",
    "Paramount Pictures",
    "Sony",
    "Universal",
    "WB")
genre <- c("action", "adventure", "animation", "comedy", "drama")

data <- data[data$Studio %in% studios & data$Genre %in% genre,]
head(data)
str(data)
#Task it to create box plot
#install.packages("ggplot2")
library(ggplot2)

a <-
  ggplot(data = data, aes(x = Genre, y = USGrossPercent))
a + geom_jitter(aes(colour = Studio, size = Budget)) +
  geom_boxplot(alpha = 0.5) +
  scale_size(range = c(0, 3.5)) +
  xlab("Genre") + ylab("Gross%US") +
  ggtitle("Domestic Gross %  By Genre") +
  theme(
    axis.title.x = element_text(colour = "Blue"),
    axis.title.y = element_text(colour = "Blue"),
    plot.title = element_text(
      colour = "Black",
      face = "bold",
      hjust = 0.5
    )
  )
