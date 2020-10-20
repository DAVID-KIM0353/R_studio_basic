# p2
library(ggplot2)
diamonds
diamonds$x[diamonds$x == 0] <- NA
diamonds$x[is.na(diamonds$x)] <- 1000
diamonds_0 = diamonds[diamonds$x != 1000,]
diamonds_1 <- diamonds[diamonds$x >= 10,]
diamonds$h <- 1
diamonds$h[(diamonds$x > 1)&(diamonds$y > 2)] <- 100?diamonds$h[(diamonds$y>6)|(diamonds$z>7)] <- 200

# p32
library(reshape2)
raw <- read.csv('titanic2.csv', check.names = F, stringsAsFactors = FALSE)
head(raw)
tidy <- melt(raw, id = c('class', 'age', 'fate'), variable.name = 'sex', value.name = 'count')
he?d(tidy)
tidy <- dcast(tidy, class + age + sex ~ fate, value.var = 'count')
head(tidy)
tidy$rate <- round(tidy$survived/(tidy$survived + tidy$perished), 2)
tidy$rate
head(tidy)
