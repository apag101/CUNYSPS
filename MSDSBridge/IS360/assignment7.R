#Week Assignement 7 Datasets

x<- c(10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0)
y<- c(8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68)
I <- data.frame(x,y)

x<- c(10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0)
y<- c(9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 7.26, 4.74)
II <-data.frame(x, y)

x<- c(10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0)
y<- c(7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73)
III <-data.frame(x,y)

x<- c(8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 19.0, 8.0, 8.0, 8.0)
y<- c(6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.50, 5.56, 7.91, 6.89)
IV <- data.frame(x, y)

D <- data.frame(I, II, III, IV)

barplot(t(as.matrix(D)), beside = TRUE)
hist(as.matrix(D))
D %>% select(as.integer(x), as.integer(y), as.integer(x.1), as.integer(y.1), as.integer(x.2), as.integer(y.2), as.integer(x.3), as.integer(y.3)) %>%
    + summarise(mean(x), mean (y), mean(x.1), mean(y.1), mean(x.2), mean(y.2), mean(x.3), mean(y.3))
