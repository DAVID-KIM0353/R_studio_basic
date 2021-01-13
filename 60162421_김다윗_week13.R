install.packages('arules')
library(arules)

# 연관성 규칙
lotto_trans <- read.transactions('lotto.csv', format = 'basket', sep = ',', skip = 0)
rules <- apriori(lotto_trans, parameter = list(support = 0.02, confidence = 0.2, minlen = 2))
inspect(rules[1:20])
inspect(sort(rules, by = 'lift')[1:20])
inspect(sort(rules, by = 'confidence')[1:20])

# 계층적 클러스터링
driving_data <- data.frame( x1 = c(4, 20, 3, 19, 17, 8, 19, 18),
                            x2 = c(15, 13, 13, 4, 17, 11, 12, 6))
dist <- dist(driving_data, method = 'euclidean')
hc1 <- hclust(dist, method = 'single')
hc2 <- hclust(dist, method = 'complete')
hc3 <- hclust(dist, method = 'average')
plot(hc1);plot(hc2);plot(hc3)

# k-means clustering
iris <- read.csv('iris.csv')
train_x <- iris[, 1:4]
train_y <- iris[ , 5]
model_kmeans <- kmeans(train_x, centers = 3, iter.max = 10000)
model_kmeans$centers
model_kmeans$cluster
table(model_kmeans$cluster, train_y)

SSE = c()
for (k in 1:15){
  km = kmeans(train_x, k)
  SSE[k] = sum(km$withinss)
}
plot(1:15, SSE, type = 'l')
points(SSE)

install.packages('NbClust')
library(NbClust)
nc <- NbClust(train_x, min.nc = 2, max.nc = 15, method = 'kmeans')

# 실습문제
wine <- read.csv('wine.csv')
train_x <- wine[, 1:11]
test_x <- wine[, 12]

library(NbClust)
nc <- NbClust(train_x, min.nc = 2, max.nc = 15, method = 'kmeans')

model_kmeans <- kmeans(train_x, centers = 3, iter.max = 10000)
model_kmeans$centers
model_kmeans$cluster
table(model_kmeans$cluster, train_y)
