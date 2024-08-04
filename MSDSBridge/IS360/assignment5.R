#Using dplyr package to transform data

m <- mtcars %>%
select(cyl, am, mpg, wt) %>%
filter(mpg > 20)

aggregate(cbind(mpg, wt) ~ cyl + am, m, mean) %>%
arrange(cyl, am)
