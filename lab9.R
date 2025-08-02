install.packages("rpart")
install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

data(iris)
head(iris)
tree_model <- rpart(Species ~ ., data = iris, method = "class")
summary(tree_model)
rpart.plot(tree_model)
predictions <- predict(tree_model, iris, type = "class")
table(Predicted = predictions, Actual = iris$Species)


#why different if dataset same


data("Titanic")
titanic_df <- as.data.frame(Titanic)
titanic_expanded <- titanic_df[rep(1:nrow(titanic_df), titanic_df$Freq), 1:4]

titanic_expanded$Survived <- factor(titanic_expanded$Survived)
titanic_expanded$Sex <- factor(titanic_expanded$Sex)
titanic_expanded$Class <- factor(titanic_expanded$Class)
titanic_expanded$Age <- factor(titanic_expanded$Age)
  
titanic_model <- rpart(Survived ~ ., data = titanic_expanded, method = "class")
summary(titanic_model)
rpart.plot(titanic_model)

preds <- predict(titanic_model, titanic_expanded, type = "class")
table(Predicted = preds, Actual = titanic_expanded$Survived)
