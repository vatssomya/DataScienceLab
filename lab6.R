# Load the AirQuality dataset
data("airquality")  

# View first few rows and summary statistics
head(airquality)    
summary(airquality) 

# Remove missing values
airquality <- na.omit(airquality)

# Remove rows where Ozone is NA
airquality <- subset(airquality, !is.na(Ozone))

# Now calculate the statistics
sample_mean <- mean(airquality$Ozone)
median_ozone <- median(airquality$Ozone)
std_dev <- sd(airquality$Ozone)
n <- length(airquality$Ozone)

# Print values
cat("Mean Ozone Level:", sample_mean, "\n")
cat("Median Ozone Level:", median_ozone, "\n")
cat("Standard Deviation:", std_dev, "\n")


# Histogram of Ozone Levels
hist(airquality$Ozone, 
     main="Histogram of Ozone Levels", 
     xlab="Ozone Level", 
     col="skyblue", 
     border="black", 
     breaks=10)

# Add a red dashed line for the sample mean
abline(v=sample_mean, col="red", lwd=2, lty=2)

# Boxplot of Ozone Levels
boxplot(airquality$Ozone, 
        main="Boxplot of Ozone Levels", 
        ylab="Ozone Level", 
        col="lightgreen")

# 3. Hypothesis Testing: One-Sample t-Test

# Null Hypothesis (H₀): μ = 50 (Ozone levels are 50 on average)
# Alternative Hypothesis (H₁): μ ≠ 50 (Ozone levels differ from 50)

t_test_result <- t.test(airquality$Ozone, mu = 50, alternative = "two.sided")
print(t_test_result)

# 4. Hypothesis Testing: Two-Sample t-Test (May vs June)

# Extract Ozone levels for May and June
may_ozone <- airquality$Ozone[airquality$Month == 5]
june_ozone <- airquality$Ozone[airquality$Month == 6]

# Perform two-sample t-test
t_test_months <- t.test(may_ozone, june_ozone, var.equal = TRUE)
print(t_test_months)

# 5. Z-Score Calculation

# Z-score Formula: Z = (X̄ - μ) / (σ / sqrt(n))
population_mean <- 50  # Assumed population mean for hypothesis testing

z_score <- (sample_mean - population_mean) / (std_dev / sqrt(n))
cat("Z-Score:", z_score, "\n")

# Interpretation: If |Z| > 1.96 (for 95% confidence level), reject H₀.
