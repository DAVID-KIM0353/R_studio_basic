library(ggplot2)
library(dplyr)
bnames <- read.csv('bnames.csv.bz2', stringsAsFactors = FALSE)
head(bnames)

# p14
filter(bnames, (year == 1900 | year == 2000) & sex == 'girl')

# p19
arrange(bnames, desc(prop)) # 1번, John was most popular in 1880s
David ?- bnames[bnames$name == 'David', ] # 2번
David
arrange(David, desc(prop)) # in 1955

# p24
head(David)
mutate(David, percent = prop * 100) # 1번
summarise(David, min = min(prop), mean = mean(prop), max = max(prop)) # 2번

# p35
head(bnames)
head(Births)
bn?mes2 <- left_join(bnames, Births, by = c('year', 'sex')) # 1번
mutate(bnames2, n = round(prop * births)) # 2번

# p52~63
bnames <- read.csv('bnames.csv.bz', stringsAsFactors = FALSE)
birth <- read.csv('birth.csv')
bnames2 <- left_join(bnames, birth, by = c?'year', 'sex'))
head(bname2)

# 실습1
bnames2 <- mutate(bnames2, n = round(prop * births)) 
bnames2 %>% group_by(soundex) %>% summarise(total = sum(n))
soundex_group <- bnames2 %>% group_by(soundex) %>% summarise(total = sum(n))
head(soundex_group)
arrange?soundex_group, desc(total)) # J500
head(bnames2)
soundex_filter <- filter(bnames2, soundex == 'J500')
head(soundex_filter)
soundex_filter %>% group_by(name) %>% summarise(total = sum(n))
group_name <- soundex_filter %>% group_by(name) %>% summarise(total =?sum(n))
arrange(group_name, desc(total)) # John

# 실습2
head(bnames2)
year_sex <- group_by(bnames2, year, sex)
year_sex_total <- summarise(year_sex, total = sum(n))
library(reshape2)
dcast(year_sex_total, year ~ sex, value.var = 'total')

# 실습3
head(bna?es2)
year_sex <- group_by(bnames2, year, sex)
ranks <- mutate(year_sex, rank = rank(desc(prop)))
head(ranks)
ones <- filter(ranks, rank == 1)
ones <- select(ones, year, sex, name)
dcast(ones, year ~ sex, value = 'name')
