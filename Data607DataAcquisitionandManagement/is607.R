#Getting data from Github
library(RCurl) x <- getURL("https://raw.github.com/aronlindberg/latent_growth_classes/master/LGC_data.csv") y <- read.csv(text = x)


junk<-data.frame(x = rep(LETTERS[1:4], 3), y=letters[1:12], stringsAsFactors = FALSE)
junk

library(tidyverse)
library(stringr)
str_length(c("a","R for data science", NA))
str_c("x","y", sep = ",")
x <-c("apple","strawberry", "bananna")
str_sub(x,1,3)
str_to_upper(str_sub(x,1,3))
str_sort(x)
str_view(x, "a.")
str_view(x, "a{1}")
str_view(x, "(..)\\1", match = TRUE)
str_detect(x, "e")
sum(str_detect(x, "^b"))
mean(str_detect(x, "[aeiou]$"))
!str_detect(x, "[aeiou]$")
str_count(x, "a")
df <- tibble(word = words, i = seq_along(word))
df %>%
    mutate(
        vowels = str_count(word, "[aeior]"),
        consonants = str_count(word, "[^aeiou]")
    )
colors <- c("orange","red","yellow","green","blue","purple")
length(sentences)
color_match<- str_c(colors, collapse = "|")
color_match
has_color <- str_subset(sentences, color_match)
matches <-str_extract(has_color, color_match)
head(matches)
more<-sentences[str_count(sentences, color_match)>1]
str_extract_all(more, color_match, simplify = TRUE)
x<- c("a", "a b", "a b c")
str_extract_all(x, "[a-z]", simplify = TRUE)
library(lubridate)
library(nycflights13)
flights %>%
    select(year, month, day, hour, minute) %>%
    mutate(
        departure = make_datetime(year,month,hour,minute)
    )
as_datetime(today())
as_date(now()) 
year(now())
month(now())
mday(now())
yday(now())
wday(now())
month(now(), label=TRUE)
wday(now(), label = TRUE, abbr = FALSE)
flights %>%
    mutate(wday = wday(dep_time, label = TRUE)) %>%
    ggplot(aes(x = wday)) +
    geom_bar()
Sys.timezone()

#Tinyr
require(tidyr)
require(dplyr)
dadmom <- foreign::read.dta("https://stats.idre.ucla.edu/stat/stata/modules/dadmomw.dta")  
dadmom %>%
    gather(key,value, named:incm) %>%
    separate(key, c("variable", "type"), -1) %>%
    spread(variable, value, convert = TRUE)

library(dplyr)
library(hflights)
data(hflights)
head(hflights)
flights<- tbl_df(hflights)
print(flights, n=20)
data.frame(head(flights))
flights[flights$Month==1 & flights$DayofMonth==1, ]#R
filter(flights, Month==1, DayofMonth==1)#Dplyr
filter(flights, UniqueCarrier=="AA"  | UniqueCarrier =="UA")
filter (flights, UniqueCarrier %in% c("AA", "UA"))
flights[, c("DepTime", "ArrTime", "FlightNum")]#R
select(flights, DepTime, ArrTime, FlightNum) #Dplyr
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))
filter(select(flights, UniqueCarrier, DepDelay), DepDelay>60)
flights%>%
    select(UniqueCarrier, DepDelay) %>%
    filter(DepDelay>60)#Same as above except with chaining
x1 <- 1:5; x2<-2:6
sqrt(sum((x1-x2)^2))#Same as above except with chaining
(x1-x2)^2%>% sum() %>% sqrt()
flights[order(flights$DepDelay), c("UniqueCarrier", "DepDelay")]
flights %>%
    select(UniqueCarrier, DepDelay) %>%
    arrange(DepDelay)#Same as above except with chaining
flights %>%
    select(UniqueCarrier, DepDelay)%>%
    arrange(desc(DepDelay))
flights$Speed <- flights$Distance/flights$AirTime*60
flights[,c("Distance", "AirTime", "Speed")]
flights%>%
    select(Distance, AirTime) %>%
    mutate(Speed = Distance/AirTime*60)#Same as above except with chaining
flights<- flights%>% mutate(Speed = Distance/AirTime*60)
head(with(flights, tapply(ArrDelay, Dest, mean, na.rm= TRUE)))
head(aggregate(ArrDelay ~ Dest, flights, mean))
flights %>%
    group_by(Dest)%>%
    summarise(avg_delay = mean(ArrDelay, na.rm=TRUE))#Same as above except with chaining
flights%>%
    group_by(UniqueCarrier)%>%
    summarise_each(funs(mean), Cancelled, Diverted)
flights%>%
    group_by(UniqueCarrier)%>%
    summarise_each(funs(min(., na.rm=TRUE), max(., na.rm=TRUE)), matches("Delay"))
flights%>%
    group_by(Month, DayofMonth)%>%
    summarise(flight_count = n())%>%
    arrange(desc(flight_count))
flights%>%
    group_by(Month, DayofMonth)%>%
    tally(sort = TRUE)#Same as above except with tally
flights%>%
    group_by(Dest)%>%
    summarize(flight_count = n(), plane_count=n_distinct(TailNum))
flights%>%
    group_by(Dest)%>%
    select(Cancelled)%>%
    table()%>%
    head()

#Dplyr Windows Functions
flights%>%
    group_by(UniqueCarrier) %>%
    select(Month, DayofMonth, DepDelay)%>%
    filter(min_rank(desc(DepDelay))<=2)%>%
    arrange(UniqueCarrier, desc(DepDelay))
flights%>%
    group_by(UniqueCarrier) %>%
    select(Month, DayofMonth, DepDelay)%>%
    top_n(2)%>%
    arrange(UniqueCarrier, desc(DepDelay))#Same as above excempt wit top_n
flights%>%
    group_by(Month)%>%
    summarise(flight_count = n())%>%
    mutate(change = flight_count - lag(flight_count))
flights%>%
    group_by(Month)%>%
    tally()%>%
    mutate(change = n - lag(n))#Same as about except with tally
flights %>% sample_n(5)
flights %>% sample_frac(.25, replace = TRUE)
str(flights)
glimpse((flights))#Dplyr for R str

#Dplyr Connect to Db
my_db <- src_sqlite("my_db.sqlite3", create = TRUE)
flights_tbl <- tbl(my_db, "hflights")

#Dplyr advanced
rm(flights)
library(nycflights13)
flights%>% select(carrier, flight)
flights%>% select(-month, -day)
flights%>% select(-contains("time"))
cols<- c("carrier","flight", "tailnum")
flights%>%select(one_of(cols))
flights%>%select(tail = tailnum)
flights%>%rename(tail = tailnum)
flights%>%select(-(dep_time:arr_delay))
flights%>%filter(dep_time>=600, dep_time <=605)
flights %>% filter(is.na(dep_time))
flights%>% slice(1000:1005)
flights%>%filter(between(dep_time, 600, 605))
flights%>%group_by(month,day)%>% slice(1:3)
flights%>%group_by(month,day)%>% sample_n(3)
flights%>%group_by(month,day)%>% top_n(3, dep_delay)
flights%>%group_by(month,day)%>% top_n(3, dep_delay)%>%
    arrange(desc(dep_delay))
flights%>%select(origin, dest)%>%unique()
flights%>%select(origin, dest)%>%distinct()
flights%>%select(origin, dest)%>%distinct#if not including arguments no parenthesis needed
flights%>%mutate(speed = distance/air_time*60)
flights%>%transmute(speed = distance/air_time*60)
mtcars%>%head
mtcars%>% add_rownames("models")%>%head()
mtcars %>%tbl_df
flights%>%group_by(month)%>%summarise((cnt = n()))
flights%>%group_by(month)%>%tally()
flights%>%count(month, sort= TRUE)
flights%>%group_by(month)%>%summarise(dist = sum(distance))
flights%>%group_by(month)%>%tally(wt = distance)
flights%>%count(month, wt = distance)
flights%>%group_by(month) %>% group_size()
flights%>%group_by(month) %>% n_groups()
flights%>%group_by(month, day)%>%
    summarise(cnt = n())%>%
                  ungroup()%>%
                  arrange(desc(cnt))
data_frame(a=1:6, b = a*2, c= 'string', 'd+e' =1)%>%
    glimpse()

#dplyr Joins
a<- data_frame(color = c("green", "yellow", "red"), num = 1:3)
b<- data_frame(color = c("green", "yellow", "pink"), size = c("s", "m", "l"))
inner_join(a, b)
full_join(a, b)
left_join(a, b)
right_join(a, b)
left_join(b,a)
semi_join(a,b)
anti_join(a,b)
b<-b%>%rename(col = color)
inner_join(a, b, by=c("color" = "col"))
flights%>%print(n = 15)
flights%>%print(width = Inf)
flights%>%View()
options(dplyr.width = Inf, dplyr.print_min = 6)
options(dplyr.width = NULL, dplyr.print_min)

#GGPlot2
ggplot(data = mpg)+
    geom_point(mapping = aes(x = displ, y = hwy, shape = class, color=class, stroke = 2)) +
    facet_wrap(~class, nrow = 2)

ggplot(data = mpg, mapping = aes(x = displ, y= hwy))+
    geom_point(mapping = aes(color = class)) +
    geom_smooth(
        data = filter(mpg, class == "subcompact")
    )

ggplot(data = diamonds)+
    stat_summary(
        mapping = aes(x = cut, y = depth),
        fun.ymin = min,
        fun.ymax = max,
        fun.y= median
    )

ggplot(data = diamonds)+
    geom_bar(mapping =aes(x = cut, fill = clarity, alpha = 1/5, position = "identity"))

bar<- ggplot(data = diamonds)+
    geom_bar(
        mapping = aes(x=cut, fill = cut),
        show.legend = FALSE,
        width = 1
    )+
    theme(aspect.ratio = 1)+
    labs(x = NULL, y= NULL)

bar+ coord_flip()
bar+ coord_polar()

glimpse(diamonds)
str(diamonds)
class(diamonds)
diamonds%>%
    select(-cut, -color, -clarity)%>%
    summary()
#Group by diamond color
diamonds%>%
    group_by(color)%>%
    tally()
#Group by diamond cut and color
diamonds%>%
    group_by(cut,color)%>%
    tally()%>%
    View()
#Group by diamond cut and color
diamonds2<-diamonds%>%
    group_by(cut,color)%>%
    tally()%>%
library(ggplot2)
ggplot(data= diamonds)+
    geom_bar(mapping = aes(x = cut, fill = clarity), 
             position= "dodge")

ggplot(data= diamonds,mapping = aes(x = cut, y = carat))+
    geom_point()
glimpse(diamonds)

##URLs
home = url("http://www.r-project.org/")
isOpen(home)
moby_url= url("http://gutenberg.org/ebooks/2701.txt.utf-8")
readLines(moby_url, n=5)

download.file("http://www.gutenberg.org/cache/epub/2701/pg2701.txt", "mobydick.txt", mode = "wb")

iris_file = "http://archive.ics.uci/edu/ml/machine-learning-databases/iris/iris.data"
library(RCurl)
iris_url = getURL(iris_file)
iris_data = read.csv(textConnection(iris_url), header = FALSE)
head(iris_data)

library(XML)
swim_wiki = "https://en.wikipedia.org/wiki/World_record_progression_1500_metres_freestyle"
swim1500 = readHTMLTable(swim_wiki, which = 1, stringsAsFactors = FALSE)
head(swim1500)

travelbooks = "https://maths-people.anu.edu.au/~johnm/r/misc-data/travelbooks.R"
source(travelbooks)

library(RCurl)
curlVersion()$protocols

cat(getURL("http://httpbin.org/headers", 
           useragent = str_c(R.version$platform,
                             R.version$version.string,
                             sep = ", ")))

getURL("http://httpbin.org/headers", 
           httpheader = c(From = "test@test.com"))

names(getCurlOptionsConstants())

handle<- getCurlHandle()
url <- "r-datacollection.com/materials/http/helloworld.html"
res <- getURl(url = url, curl = handle)
handleInfo <- getCurlInfo(handle)
names(handleInfo)
handleInfo[c("total.time", "pretransfer.time")]
handleInfo$primary.ip

#Web Scraping with Rvest
library(rvest)
library(stringr)
library(tidyr)

url <- 'https://www.baseball-reference.com/leagues/MLB/2018.shtml'
webpage <- read_html(url)

sb_table <- html_nodes(webpage, 'table')
sb <- html_table(sb_table)[[1]]
head(sb)
sb <- sb[-(1:24), ]
names(sb) <- c("Team", "Batting", "Age", "RunsPerGame")
head(sb)

library (httr)
r<- GET("https://trends.google.com/trends/explore")
r
library(jsonlite)
toJSON(list(a = 1, b=2, c=3))

r<-GET("http://httpbin.org/get")
r$status_code
http_status(r)
headers(r)
r$content
content(r, "text")
l<-content(r, "parse")
l<-r$content
l$doc
l[2]

library(RCurl)
library(XML)
library(stringr)

baseurl <- htmlParse("https://www.transparency.org/news/pressreleases/top/97")
xpath<- "//div[@id='Page']strong[2]"
total_pages<-as.numeric(xpathApply(baseurl, xpath, xmlValue))
total_pages

info<-debugGatherer()
handle<- getCurlHandle(cookiejar = "",
                       followlocation = TRUE,
                       autoreferer = TRUE,
                       debugfunc = info$update,
                       verbose = TRUE,
                       httpheader = list(
                           from = "apag101@yahoo.com",
                           'user-agent' = str_c(R.version$version.string,
                                                ", ", R.version$platform)
                       ))
search_url <- "www.biblio.com/search.php?keyisbn=data"
cart_url <- "www.biblio.com/cart.php"
search_page<- htmlParse(getURL(url = search_url, curl = handle))
xpathApply(search_page, "//div[@class='order-box'][position()<2]/form")

library(devtools)
install_github(repo = "Rwebdriver", username = "crubba", force = TRUE)

library(Rwebdriver)
library(XML)
start_session(root = "http://localhost:4444/wd/hub/", browser = "Chrome")

###Sentiment analysis
library(gutenbergr)
View(gutenberg_subjects)

library(tidytext)
library(tidyr)
library(topicmodels)
library(tidyverse)
library(tm)
data("AssociatedPress")
AssociatedPress
terms<- Terms(AssociatedPress)
head(terms)    
ap_td <-tidy(AssociatedPress)
ap_td
ap_sentiments <-ap_td%>%
    inner_join(get_sentiments("bing"), by = c(term = "word"))
ap_sentiments

library(ggplot2)
ap_sentiments%>%
    count(sentiment, term, wt = count)%>%
    ungroup()%>%
    filter(n >= 200)%>%
    mutate(n = ifelse(sentiment == "negative", -n, n))%>%
    mutate(term = reorder(term, n))%>%
    ggplot(aes(term, n, fill = sentiment))+
    geom_bar(stat = "identity")+
    ylab("Contribution to sentiment")+
    coord_flip()

data("data_corpus_inaugural", package = "quanteda")
inaug_dfm<- quanteda::dfm(data_corpus_inaugural, verbose=FALSE)
inaug_dfm
inaug_td <-tidy(inaug_dfm)
inaug_td
inaug_tf_idf<- inaug_td%>%
    bind_tf_idf(term, document, count)%>%
    arrange(desc(tf_idf))
inaug_tf_idf

library(tidyr)
year_term_counts<-inaug_td%>%
    extract(document, "year", "(\\d+)", convert = TRUE)%>%
    complete(year, term, fill = list(count = 0))%>%
    mutate(year_total = sum(count))
year_term_counts %>%
    filter(term %in% c("god", "america", "foreign", "union", "constitution", "freedom"))%>%
    ggplot(aes(year, count/year_total))+
    geom_point()+
    geom_smooth()+
    facet_wrap(~ term, scales = "free_y")+
    scale_y_continuous(labels = scales::percent_format())+
    ylab("% frequency of word in inaugural address")

ap_td%>%
    cast_tdm(document, term, count)
ap_td%>%
    cast_dfm(document, term, count)

library(Matrix)
m<-ap_td%>%
    cast_sparse(document, term, count)
class(m)
dim(m)

library(janeaustenr)
austen_dtm<- austen_books() %>%
    unnest_tokens(word, text)%>%
    count(book, word)%>%
    cast_dtm(book, word, n)
austen_dtm

data("acq")
acq[[1]]
acq_td<-tidy(acq)
acq_td
acq_tokens <- acq_td%>%
    select(-places)%>%
    unnest_tokens(word, text)%>%
    anti_join(stop_words, by="word")

acq_tokens %>%
    count(word, sort = TRUE)
acq_tokens %>%
    count(id, word)%>%
    bind_tf_idf(word, id, n)%>%
    arrange(desc(tf_idf))

library(tm.plugin.webmining)
library(purrr)
library(dplyr)
company<- c("microsoft", "Apple", "Google", "Amazon", "Facebook",
            "Twitter", "IBM", "Yahoo", "Netflix")
symbol <- c("MSFT", "APPL", "GOOG", "AMZN", "FB", "TWTR",
            "IBM", "YHOO", "NFLX")
download_articles<-function(symbol){
    WebCorpus(GoogleFinanceSource(paste0("NASDAQ:", symbol)))
}

stock_articles<- data_frame(company = company, 
                            symbol = symbol) %>%
    mutate(corpus = map(symbol, download_articles))

library(tidytext)
library(topicmodels)
data("AssociatedPress")
AssociatedPress
ap_lda<-LDA(AssociatedPress, k=2, control = list(seed =1234))
ap_lda
ap_topics<-(tidy(ap_lda, matrix = "beta"))
ap_topics

library(ggplot2)
library(dplyr)

ap_top_terms<- ap_topics %>%
    group_by(topic) %>%
    top_n(10, beta) %>%
    ungroup()%>%
    arrange(topic, -beta)

ap_top_terms %>%
    mutate(term = reorder(term, beta)) %>%
    ggplot(aes(term, beta, fill = factor(topic))) +
    geom_col(show.legend = FALSE) +
    facet_wrap(~ topic, scales = "free")+
    coord_flip()

library(tidyr)
beta_spread <- ap_topics %>%
    mutate(topic = paste0("topic", topic)) %>%
    spread(topic, beta) %>%
    filter(topic1>.001 | topic2 > .001) %>%
    mutate(log_ratio = log2(topic2/topic1))
beta_spread

ap_documents <- tidy(ap_lda, matrix = "gamma")
ap_documents

tidy(AssociatedPress)%>%
    filter(document ==6)%>%
    arrange(desc(count))


