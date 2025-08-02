print("Data visualization in R using ggplot2")

library(ggplot2)

dataset <- airquality

head(dataset)

summary(dataset)

str(dataset)


class(dataset)

#creating a scatter plot
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Scatter Plot of Ozone vs Temperature", x = "Temperature", y = "Ozone Levels") +
  theme_minimal()

#handle missing values:
sum(is.na(dataaset))
dataset$Ozone[is.na(dataset$Ozone)] <- mean(dataset$Ozone, na.rm = TRUE)


#creating a histogram
ggplot(dataset, aes(x = Ozone)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Ozone Levels", x = "Ozone Levels", y = "Frequency")

#facets
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point() +
  facet_wrap(~ Month) +
  labs(title = "Ozone vs Temperature by Month")

#custom
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point() +
  theme_bw() +
  theme(
    panel.grid.major = element_line(color = "gray"),
    panel.grid.minor = element_blank(),
    axis.title = element_text(size = 14, face = "bold")
  ) +
  labs(title = "Ozone vs Temperature with Custom Theme")




#FINALIZED EVERYTHING
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point(color = "blue", size = 3) +
  scale_x_continuous(limits = c(60, 100), breaks = seq(60, 100, 10)) +
  scale_y_continuous(limits = c(0, 150)) +
  facet_wrap(~ Month) +
  labs(title = "Ozone vs Temperature by Month", x = "Temperature", y = "Ozone Levels") +
  theme_minimal() +
  theme(
    axis.title = element_text(size = 14, face = "bold"),
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5)
  )

#FINALIZED EVERYTHING
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point(color = "cyan", size = 3) +
  scale_x_continuous(limits = c(60, 100), breaks = seq(60, 100, 10)) +
  scale_y_continuous(limits = c(0, 150)) +
  facet_wrap(~ Month) +
  labs(title = "Ozone vs Temperature by Month", x = "Temperature", y = "Ozone Levels") +
  theme_bw() +
  theme(
    axis.title = element_text(size = 14, face = "bold"),
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5)
  )

# Create a scatter plot
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point()

# Scatter Plot with Customizations
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Scatter Plot of Ozone vs Temperature", x = "Temperature", y = "Ozone Levels") +
  theme_minimal()

# Line Plot (for the same variables)
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Line Plot of Ozone vs Temperature")

# Bar Plot (creating a new sample dataset for demonstration)
data_bar <- data.frame(
  category = c("A", "B", "C"),
  values = c(10, 20, 15)
)
ggplot(data_bar, aes(x = category, y = values)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Bar Plot Example")

# Histogram of Ozone Levels
ggplot(dataset, aes(x = Ozone)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Ozone Levels", x = "Ozone Levels", y = "Frequency")

# Faceting: Ozone vs Temperature by Month
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point() +
  facet_wrap(~ Month) +
  labs(title = "Ozone vs Temperature by Month")

# Custom Themes
ggplot(dataset, aes(x = Temp, y = Ozone)) +
  geom_point() +
  theme_bw() +
  theme(
    panel.grid.major = element_line(color = "gray"),
    panel.grid.minor = element_blank(),
    axis.title = element_text(size = 14, face = "bold")
  ) +
  labs(title = "Ozone vs Temperature with Custom Theme")

