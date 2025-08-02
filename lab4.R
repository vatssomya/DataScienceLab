
# Install necessary packages if not already installed
install.packages("mlbench")  
install.packages("ggplot2")
install.packages("corrplot")
install.packages("reshape2")


# Load required libraries
library(mlbench)
library(ggplot2)
library(corrplot)
library(reshape2)

# Load the Pima Indians Diabetes dataset from the mlbench package
data(PimaIndiansDiabetes)
data <- PimaIndiansDiabetes  # Storing the dataset in the 'data' variable

# Inspecting the first few rows of the dataset
head(data)

# Summary statistics and structure of the dataset
summary(data)  
str(data)  
class(data)

# Feature Scatter Matrix for visualizing pairwise relationships between features
pairs(data[, 1:8], main="Feature Scatter Matrix")

# Correlation Matrix: Compute the correlation between all numerical features
cor_matrix <- cor(data[, 1:8])

# Plot the Correlation Matrix using a color-coded heatmap
corrplot(cor_matrix, method="color", 
         col=colorRampPalette(c("red", "white", "blue"))(200),
         addCoef.col="black", tl.cex=0.8, number.cex=0.7)

# Covariance Matrix: Calculate the covariance for features excluding the 'diabetes' column
cov_matrix <- cov(data[, 1:8])  # Excluding the 'diabetes' column (categorical)
print(cov_matrix)

# Covariance Heatmap for better visualization of the relationships between features
melted_cov <- melt(cov_matrix)
ggplot(data = melted_cov, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() +
  scale_fill_gradient2(low="red", high="blue", mid="white", midpoint=0) +
  theme_minimal() +
  ggtitle("Covariance Heatmap")

# Correlation Heatmap: Recalculate and plot the correlation matrix for features
cor_matrix <- cor(data[, 1:8])  # Excluding the 'diabetes' column (categorical)
corrplot(cor_matrix, method="color",
         col=colorRampPalette(c("red", "white", "blue"))(200),
         addCoef.col="black", tl.cex=0.8, number.cex=0.7)

# Pairwise scatter plots using GGally::ggpairs for all features, color-coded by diabetes status
ggpairs(data[, 1:8], aes(col=diabetes))

# Scatter Plots for Glucose vs each feature:

# Glucose vs Pregnant
ggplot(data, aes(x=pregnant, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Pregnant vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs Blood Pressure
ggplot(data, aes(x=pressure, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Blood Pressure vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs Triceps Skinfold
ggplot(data, aes(x=triceps, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Triceps Skinfold vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs Insulin
ggplot(data, aes(x=insulin, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Insulin vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs BMI
ggplot(data, aes(x=bmi, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("BMI vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs Pedigree Function
ggplot(data, aes(x=pedigree, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Pedigree Function vs Glucose (Diabetes Prediction)") +
  theme_minimal()

# Glucose vs Age
ggplot(data, aes(x=age, y=glucose, color=diabetes)) +
  geom_point() +
  ggtitle("Age vs Glucose (Diabetes Prediction)") +
  theme_minimal()
