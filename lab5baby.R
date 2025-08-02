library(ggplot2)

dataset <- iris

summary(dataset)
head(dataset)

# Split the dataset into 80% train and 20% test 
set.seed(123)  # Setting seed for reproducibility
train_indices <- sample(1:nrow(dataset), size = 0.8 * nrow(dataset))  # 80% for training
train_data <- dataset[train_indices, ]
test_data <- dataset[-train_indices, ]

# Fit the linear model on the training data
model <- lm(Sepal.Length ~ Petal.Length, data = train_data)
summary(model)

# Make predictions on the test data
predictions <- predict(model, newdata = test_data)

# Compare predicted vs. actual values for the test data
results <- data.frame(Actual = test_data$Sepal.Length, Predicted = predictions)
print(results)



# Calculate error metrics
mae <- mean(abs(results$Actual - results$Predicted))  # Mean Absolute Error
mse <- mean((results$Actual - results$Predicted)^2)   # Mean Squared Error
rmse <- sqrt(mse)  # Root Mean Squared Error

# Print error metrics
cat("Mean Absolute Error (MAE):", mae, "\n")
cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")


# Plotting the regression line using the test data
ggplot(test_data, aes(x = Petal.Length, y = Sepal.Length)) +
  geom_point(color = "blue", size = 2) +  # Scatter plot
  geom_smooth(method = "lm", formula = y ~ x, color = "red") +  # Regression line
  labs(title = "Petal Length vs. Sepal Length (Test Data)",
       x = "Petal Length (cm)",
       y = "Sepal Length (cm)") +
  theme_minimal()

# New data to make predictions (for new petal lengths)
new_petal_length <- c(1.5, 3.0, 4.5)
predicted_sepal_length <- predict(model, newdata = data.frame(Petal.Length = new_petal_length))
print(predicted_sepal_length)
