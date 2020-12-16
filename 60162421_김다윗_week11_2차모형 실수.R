library(caret)
library(leaps)
library(datasets)
library(Metrics)

# p12
wages <- read.csv('wages.csv')
hmod <- lm(earn ~ height, data = wages)
summary(hmod)
# earn = -126523 + 2387*height + e

# p37
insurance <- read.csv('insurance.csv')
View(insurance) # 보험요금 : charges
train_index <- createDataPartition(y = insurance$charges, p = .6, list = FALSE)
train_data <- insurance[train_index, ]
test_data <- insurance[-train_index, ]
compare.model <- regsubsets(charges ~ ., data = insurance)
summary(compare.model) # select_x : smoker
model_basic <- lm(charges ~ smoker, data = train_data)
summary(model_basic) # R = 0.6078, Adj_R = 0.6073
yhat_test_basic <- predict(model_basic, newdata = test_data)
mse(test_data$charges, yhat_test_basic) # 53180229
mae(test_data$charges, yhat_test_basic) # 5595.847

# z-score로 변환하여 전처리 한 후 학습시킨 model
model_center <- train(charges ~ smoker, data = train_data, method = 'lm', preProc = c('center', 'scale'))
summary(model_center) # R = 0.6078, Adj_R = 0.6073
yhat_test_center <- predict(model_center, newdata = test_data)
mse(test_data$charges, yhat_test_center) # 53180229
mae(test_data$charges, yhat_test_center) # 5595.847

# data sampling을 통해 학습시킨 model
ctrl <- trainControl(method = 'repeatedcv', number = 10, repeats = 3)
model_ctrl <- train(charges ~ smoker, data = train_data, method = 'lm', trControl = ctrl, metric = 'Rsquared')
summary(model_ctrl) # R = 0.6078, Adj_R = 0.6073
yhat_test_ctrl <- predict(model_ctrl, newdata = test_data)
mse(test_data$charges, yhat_test_ctrl) # 53180229
mae(test_data$charges, yhat_test_ctrl) # 5595.847
