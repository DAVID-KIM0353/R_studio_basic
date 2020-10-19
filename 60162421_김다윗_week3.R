# P29
A <- c('a', 'b', 'c')
B <- c('c', 'd', 'e')
C <- c('a', 'b', 'd')
all('a'%in%A, 'a'%in%B, 'a'%in%C)

all(c('a'%in%A, 'a'%in%B, 'a'%in%C))

# P33
w <- c(-1, 0, 1)
x <- c(5, 15)
y <- c('February')
z <- c('Monday', 'Tuesday', 'Friday')

# w의 값들이 양???인가?
w > 0
# x가 10보다 크고, 20보다 작은가?
(10 < x)&(x < 20)
# y가 'February' 인가?
y == 'February'
# z에 있는 값들이 모두 요일에 해당되는 값인가?
week <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
all(z %in% week)

? p38
# diamonds 데이터에서 x변수가 3보다 크고, 5보다 작은 subset 데이터를 생성하시오.
library(ggplot2)
head(diamonds, 5)
subset <- (diamonds$x>3)&(diamonds$x<5)
diamonds[subset, ]
