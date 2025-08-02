
data(iris)
summary(data)

iris_data <- iris[, -5]

set.seed(123)
k_result <- kmeans(iris_data, centers = 3, nstart = 20)

iris$cluster <- as.factor(k_result$cluster)  

library(ggplot2)
  
# Plotting using Sepal features
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = cluster)) +
  geom_point(size = 2) +
  labs(title = "K-Means Clustering on Iris Dataset", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()
