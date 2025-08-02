data <- airquality

head(data)
summary(data)
str(data)
class(data)


# Checking for missing values in the dataset
total_missing <- sum(is.na(airquality))
cat("Total missing values in the dataset:", total_missing, "\n")

summary(airquality)

# Counting missing values by column
missing_per_column <- colSums(is.na(airquality))
print(missing_per_column)

# Remove rows with any missing values
cleaned_airquality <- na.omit(airquality)
cat("Cleaned dataset (na.omit):\n")
print(head(cleaned_airquality))

# Mean imputation for the 'Ozone' column (example)
mean_ozone <- mean(airquality$Ozone, na.rm = TRUE)
airquality$Ozone[is.na(airquality$Ozone)] <- mean_ozone
cat("\nDataset after mean imputation:\n")
print(head(airquality))

# Install and load VIM package for KNN imputation
install.packages("VIM")


# Perform KNN imputation
library(VIM)
airquality_imputed <- kNN(airquality, k = 5)
cat("\nDataset after KNN imputation:\n")
print(head(airquality_imputed))


# Boxplot to detect outliers
boxplot(airquality$Ozone, main = "Boxplot for Ozone", col = "lightblue")

# Removing outliers (example for Ozone)
airquality_no_outliers <- airquality[airquality$Ozone >= lower_bound & airquality$Ozone <= upper_bound, ]
cat("\nDataset after removing outliers:\n")
print(head(airquality))


boxplot(airquality$Ozone, main = "Boxplot for Ozone", col = "red")
