library(ggplot2)
data(package = 'ggplot2')
mpg
mean(mpg$hwy)
summary(mpg$hwy)
table(mpg$class)
qplot(displ, hwy, data = mpg, color = class)
