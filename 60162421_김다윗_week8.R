library(ggplot2)
View(diamonds)
names(diamonds)
ggplot(data = diamonds, mapping = aes(x = cut))+
  geom_bar() # count로 출력
demo <- data.frame(cut = c('Fair', 'Good', 'VeryGood', 'Premium', 'Ideal'),
                   freq = c(1610, 4906, 12082, 13791, 2?551))
head(demo)
ggplot(data = demo, mapping = aes(x = cut, y = freq))+
  geom_bar(stat = 'identity') # y축과 같이 출력시킴
ggplot(data = diamonds, mapping = aes(x = cut, y = ..prop.., group = 1))+
  geom_bar() # ..prop.., group = 1 전체 합 1에서의 비율을 ???타냄
ggplot(data = diamonds, mapping = aes(x = color, fill = cut))+
  geom_bar(position = 'stack') # stack : 비율
ggplot(data = diamonds, mapping = aes(x = color, fill = cut))+
  geom_bar(alpha = 0.2, position = 'identity') # idendity 겹처보이게 하기
ggplo?(data = diamonds, mapping = aes(x = color, fill = cut))+
  geom_bar(position = 'dodge') # dodge : 각각의 그래프
ggplot(data = diamonds, mapping = aes(x = color, fill = cut))+
  geom_bar(position = 'fill') # fill : 전체가 1일때의 비
ggplot(data = mpg, mappi?g = aes(x = reorder(class, hwy, FUN = median), y = hwy))+
  geom_boxplot() # class를 hwy기준으로 median 값 순으로 boxplot을 정렬, 그리겠다.
ggplot(data = diamonds, mapping = aes(x = carat))+
  geom_histogram(binwidth = 1) # binwidth : 막대 폭
ggplot(data =?diamonds, mapping = aes(x = carat))+
  geom_histogram(binwidth = 0.1)
ggplot(data = diamonds, mapping = aes(x = price, fill = cut))+
  geom_histogram(alpha = 0.2, position = 'identity', binwidth = 500)
ggplot(data = diamonds, mapping = aes(x = price, fill ? cut))+
  geom_histogram(binwidth = 500)+
  facet_wrap(~cut)
ggplot(data = diamonds, mapping = aes(x = price, color = cut))+
  geom_freqpoly(binwidth = 500)
ggplot(data = diamonds, mapping = aes(x = price, color = cut, ..density..))+
  geom_freqpoly(binwid?h = 500)
ggplot(data = diamonds, mapping = aes(x = price, color = cut))+
  geom_density() # 위에꺼랑 binwidth 빼면 같음!
ggplot(data = diamonds, mapping = aes(x = cut, fill = cut))+
  geom_bar()+
  coord_flip() # 축 변경
ggplot(data = diamonds, mapping = a?s(x = cut, fill = cut))+
  geom_bar()+
  coord_polar() # 원형으로 표현!
ggplot(data = diamonds, mapping = aes(x = price))+
  geom_histogram(binwidth = 500)+
  coord_cartesian(xlim =  c(0, 20000), ylim = c(0, 10000))
ggplot(data = mpg, mapping = aes(x = dis?l, y = hwy))+
  geom_point(mapping = aes(color = class))+
  geom_smooth(se = FALSE)+
  labs(
    title = 'Fuel',
    subtitle = 'Two!!',
    caption = 'Data from dudu',
    x = 'Engine',
    y = 'Highway',
    color = 'Car type'
  )
names(mpg)
ggplot(data ? mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = class))+
  geom_label(mapping = aes(label = model), nudge_y = 2, alpha = 0.5)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = class))+
  ?heme(legend.position = 'bottom') # left, right, top, bottom
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(mapping = aes(color = class))+
  scale_x_continuous(breaks = c(2, 4, 6), labels = c('two', 'four', 'six'))+
  scale_y_continuous?breaks = seq(15, 45, by = 5))
ggplot(data = diamonds, mapping = aes(x = carat, y = price))+
  geom_point()+
  scale_x_log10()+
  scale_y_log10()
ggplot(data = diamonds, mapping = aes(x = carat, y = price))+
  geom_point()+
  scale_x_sqrt()+
  scale_y_sqrt(?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy))+
  geom_point(position = 'jitter')
ggsave('my-plot.pdf')
