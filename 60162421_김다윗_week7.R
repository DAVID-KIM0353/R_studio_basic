library(ggplot2)
View(mpg)
# p27
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow = 2)
# p28
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)

# p41
library(gridExtra?
a <-ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = drv), size = 5)+
  geom_smooth(mapping = aes(color = drv), se = FALSE)

b <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(co?or = drv), size = 5)+
  geom_smooth(se = FALSE)

c <- ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = drv), size = 5)+
  geom_smooth(mapping = aes(linetype = drv), se = FALSE)

d <- ggplot(data = mpg, mapping = aes?x = displ, y = hwy))+
  geom_point(color = 'white', size = 10)+
  geom_point(mapping = aes(color = drv), size = 5)

grid.arrange(a, b, c, d, nrow =2, ncol = 2)
