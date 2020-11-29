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

# 2차 모형
full.model <- lm(charges ~ (.^2), data = train_data)
summary(full.model)
stepwise.model <- step(full.model, direction = 'both')
formula(stepwise.model)
summary(stepwise.model) # R-squared:  0.8573,	Adjusted R-squared:  0.8554

# MSE/MAE
yhat_test <- predict(stepwise.model, newdata = test_data)
mse(test_data$charges, yhat_test) # MSE: 25746145
mae(test_data$charges, yhat_test) # MAE: 2955.542
