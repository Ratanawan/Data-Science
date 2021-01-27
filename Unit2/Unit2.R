####Monday, December 8, 2020

##install qdap, sentimentr, readr, tidytext
x <- c(1,2,3,4,5)
y <- c('fff', 'fyyyy', 'yyyy', 'ggg', 'coco')
z <- c(23, 24, 25, 26, 27)
table1 = data.frame(Sno=x, Name=y, Age=z) 

##Unstructured data
w <- "It is quite natural to be stressed out at work since it happens to everyone on 1998"
#sub('string', 'replacement_text', file)
#gsub('string', 'replacement_text', file)
#grepl('string', file, ignore.case=T)

sub("natural","artificial", w)
gsub('9', '', w)

sub('fff', 'uuu', table1$Name)

f <- read_file("Unit_2_text_class_lecture_1.txt")
q <- read_file("Unit_2_text_class_lecture_2.txt")
m <- read_file("Unit_2_text_class_lecture_3.txt") 

table2 <- data.frame(S.no=1:3, info=c(f,q,m))

sub("natural", "AI", table2)

keyword = c("domino", "company")

grepl(keyword[1], table2, ignore.case=T)

####Tuesday, December 9, 2020
##Topic
#unstructured data
#replace sub, gsub
#keyword
#structure (dataframe) & visualization
#sentiment analysis

x <- "Talking to the moon, because I love the moon"
#replace the first word
sub("moon", "sun", x)

#replace all
gsub("moon", "sun", x)

#check whether the word existed in the file or not, return Boolean
grepl("moon", x, ignore.case = T)

##Text Mining
#1. Create table: data.frame

table1 <- data.frame(S.No=2, Text=x)
tt <- unnest_tokens(table1, info, Text)
count(table1, Text)

#pipe %>% (ctril + shift + m)
#pipe operator %>% is used to breakdown words in the sentences into table and count them 

table1 %>% 
  unnest_tokens(info, Text) %>% 
  count(info)

#You can plot the graph with pipe as well
table1 %>% 
  unnest_tokens(info, Text) %>% 
  count(info) %>% 
  ggplot(aes(n, info)) + geom_col()

#sentimentr package: use to identify words for emotions or bad words 

sentiment(table1$Text)
sentiment_by(table1$Text)
get_sentences(table1$Text)

emotion(table1$Text)
emotion_by(table1$Text)
profanity(table1$Text)
profanity_by(table1$Text)
