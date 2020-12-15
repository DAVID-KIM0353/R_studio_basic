library(class)
library(caret)

# k-nn
iris <- read.csv('iris.csv')
inTrain <- createDataPartition(y = iris$Species, p = .6, list = FALSE)
train <- iris[inTrain, ]
test <- iris[-inTrain, ]

fitControl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

knn_model <- train(Species ~ ., data = train, method = 'knn', trControl = fitControl, preProcess = c('center', 'scale'))
knn_model

predictions <- predict(knn_model, test)
predictions_f <- as.factor(predictions)
test_f <- as.factor(test$Species)
confusionMatrix(predictions_f, test_f)

library(Metrics)
accuracy(test$Species, predictions)

# 의사결정나무(분류)
library(rpart)
library(caret)

iris <- read.csv('iris.csv')

inTrain <- createDataPartition(y = iris$Species, p = .6, list = FALSE)
train <- iris[inTrain, ]
test <- iris[-inTrain, ]

fitControl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

tree.model <- train(Species ~ ., data = train, method = 'rpart', trControl = fitControl, preProcess = c('center', 'scale'))
tree.model                    

plot(tree.model)
tree.model$bestTune

prediction <- predict(tree.model, test)
predictios_f <- as.factor(prediction)
test_f <- as.factor(test$Species)
confusionMatrix(predictions_f, test_f)

plot(tree.model$finalModel)
text(tree.model$finalModel)

library(rattle)
fancyRpartPlot(tree.model$finalModel)

# 의사결정나무(회귀)
wages <- read.csv('wages.csv')

inTrain <- createDataPartition(y = wages$earn, p = .6, list = FALSE)
train <- wages[inTrain, ]
test <- wages[-inTrain, ]

fitControl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

regtree.model <- train(earn ~., data = train, method = 'rpart', trControl = fitControl)
regtree.model

plot(regtree.model)
regtree.model$bestTune

library(Metrics)
predictions <- predict(regtree.model, test)
rmse(test$earn, predictions)
mae(test$earn, predictions)
mape(test$earn, predictions)

plot(regtree.model$finalModel)
text(regtree.model$finalModel)

library(rattle)
fancyRpartPlot(regtree.model$finalModel)

# 로지스틱 회귀분석
michelin <- read.csv('michelin.csv')

michelin$InMichelin <- factor(michelin$InMichelin)

michelin <- subset(michelin, select = -Restaurant.Name)
unique(michelin)

inTrain <- createDataPartition(y = michelin$InMichelin, p = .6, list = FALSE)
train <- michelin[inTrain, ]
test <- michelin[-inTrain,]

fitControl <- trainControl(method = 'repeatedcv', number = 10, repeats = 5)

log.model <- train(InMichelin ~ ., data = train, method = 'glm', family = 'binomial', trControl = fitControl, preProcess = c('center', 'scale'))
log.model

predictions <- predict(log.model, test, type = 'raw')
confusionMatrix(test$InMichelin, predictions, positive = '1')

predicted_prob <- predict(log.model, type = 'prob')
confusionMatrix(test$InMichelin, predicted_prob, positive = '1')

# 신규데이터 예측
testdata <- data.frame(Food = 18, Decor = 17, Service = 15, Price = 40)
testdata
predict(log.model, type = 'raw', newdata = testdata)
predict(log.model, type = 'prob', newdata = testdata)
