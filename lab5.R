# Load necessary library
library(ggplot2)

# Create dataset
data <- data.frame(
  Sunlight_Hours = c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13),
  Solar_Yield = c(1.8, 2.6, 3.5, 4.4, 5.3, 6.1, 7.0, 8.2, 9.1, 10.0, 11.2, 12.5)
)
print(data)  
summary(data)  

# Extract variables
Sunlight_Hours <- data$Sunlight_Hours
Solar_Yield <- data$Solar_Yield

# Calculate Mean
mean_x <- mean(Sunlight_Hours)
mean_y <- mean(Solar_Yield)

# Calculate Slope (a) and Intercept (b)
a <- sum((Sunlight_Hours - mean_x) * (Solar_Yield - mean_y)) / sum((Sunlight_Hours - mean_x)^2)
b <- mean_y - (a * mean_x)

# Display slope and intercept
cat("Slope (a):", a, "\n")
cat("Intercept (b):", b, "\n")

# Predict values using the regression equation
predicted_y <- a * Sunlight_Hours + b

# Plot with ggplot
ggplot(data, aes(x = Sunlight_Hours, y = Solar_Yield)) +
  geom_point(color = "blue", linewidth = 2.3) +  # Scatter plot
  geom_abline(intercept = b, slope = a, color = "red", linewidth = 1) +  # Regression line
  labs(title = "Solar Yield vs. Sunlight Hours",
       x = "Sunlight Hours (per day)",
       y = "Solar Yield (kWh)") +
  theme_minimal()

# New Sunlight Hours (for predictions)
new_sunlight_hours <- data.frame(Sunlight_Hours = c(14, 15, 16))
predicted_new_values <- a * new_sunlight_hours$Sunlight_Hours + b
cat("Predicted Solar Yield for", new_sunlight_hours$Sunlight_Hours, "hours of sunlight:", predicted_new_values, "\n")

# Verify using lm()
model <- lm(Solar_Yield ~ Sunlight_Hours, data = data)
summary(model)

# Model Predictions
lm_predictions <- predict(model, newdata = new_sunlight_hours)

# Compare manual vs lm() predictions
comparison <- data.frame(
  Sunlight_Hours = new_sunlight_hours$Sunlight_Hours,
  Manual_Prediction = predicted_new_values,
  LM_Prediction = lm_predictions
)


print(comparison)


# Error Metrics
mae <- mean(abs(Solar_Yield - predicted_y))  # Mean Absolute Error
mse <- mean((Solar_Yield - predicted_y)^2)  # Mean Squared Error
rmse <- sqrt(mse)  # Root Mean Squared Error

cat("\nError Metrics:\n")
cat("MAE:", mae, "\n")
cat("MSE:", mse, "\n")
cat("RMSE:", rmse, "\n")
