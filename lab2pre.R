library(ggplot2)
# Sample data
data <- data.frame(
  x = 1:10,
  y = (1:10)^2
)
# Create a scatter plot
ggplot(data, aes(x = x, y = y)) +
  geom_point()
#Scatter Plot with Customizations
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Scatter Plot", x = "X-Axis", y = "Y-Axis") +
  theme_minimal()
#Line Plot
ggplot(data, aes(x = x, y = y)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Line Plot")
#Bar Plot
data_bar <- data.frame(
  category = c("A", "B", "C"),
  values = c(10, 20, 15)
)
ggplot(data_bar, aes(x = category, y = values)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Bar Plot")
#Histogram
data_hist <- data.frame(values = rnorm(100))
ggplot(data_hist, aes(x = values)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(title = "Histogram")
#Advanced Features
data_facet <- data.frame(
  x = rep(1:10, 3),
  y = c((1:10)^2, (1:10)^1.5, (1:10)^1.2),
  group = rep(c("A", "B", "C"), each = 10)
)
ggplot(data_facet, aes(x = x, y = y)) +
  geom_line() +
  facet_wrap(~ group) +
  labs(title = "Faceted Line Plot")
#Custom Themes
ggplot(data, aes(x = x, y = y)) +
  geom_point() +
  theme_bw() +
  theme(
    panel.grid.major = element_line(color = "gray"),
    panel.grid.minor = element_blank(),
    axis.title = element_text(size = 14, face = "bold")
  )
