#1. Write a R code to Generate 6X6 matrix (A) using the random numbers between 1 to 100 & generate another 6x6 matrix (B) using random numbers between 500 to 600.

a <- matrix(sample(1:100), 6,6, byrow = TRUE)
b <- matrix(sample(500:600), 6,6, byrow = TRUE)

#a.	Find the range of matrices A and B.
#b.	Find the max value from each row of the matrices A and B.
#c. Find the diagonal values of matrices A&B.
diag(a)
diag(b)
#d.	Multiply matrices A and B
a %*% b

#e.	Replace the 4th row of Matrix A with diagonal values of matrix B
a <- diag(b)

#f.	Multiply matrices A & B and store the values on X.
x <- a%*%b

#g.	Divide the matrix A with matrix B.
a / b

#--------------------------------------------------------------
#2. Create a table using dataframe/tibble with the following categories(a to f) 
a <- c("Ratanawan", "Lynan", "Pisethpanha", "Chhay", "Seavpor", "Vengtieng", "Jenny", "Leapheng", "Sokheng", "Ratanak")
b <- c("Thepanom", "Thon", "Chhean", "Sim", "Teng", "Tea", "Sun", "Ty", "Kaing", "Seng")
c <- c(21, 21, 20, 21, 21, 21, 22, 21, 21, 21)
d <- c("Student", "Student", "Student", "Student", "Student", "Student", "Student", "Student", "Student", "Student")
e <- c("TH", "BMC", "PP", "PP", "PP", "PP", "BTB", "BTB", "PP", "PV")
f <- sample(1:10)

table1 <- data.frame("First_name" = a, "Second_name" = b, "Age" = c, "Occuppation" = d, "Place" = e, "Random_number" = f)

#g. Extract the last column
g <- table1$Random_number

#h. Find the sum, mean and length of the extracted column
sum(g)
mean(g)
length(g)


#--------------------------------------------------------------

#3. 

#a. Read the txt. file
chilli_news <- read_file("Chilli_News.txt")

#b.	Perform the Tokenization & count the words
table1 <- data.frame(S.No=1, Text=chilli_news)
table1 %>% 
  unnest_tokens(info, Text) %>% 
  count(info)

#c.Identify the most repeated word and replace that word with "KIT"
gsub("the", "KIT", table1)

#d. Perform the Sentiment analysis
sentiment(chilli_news)

#e.	Plot the graph between "words count" and "words" using geom_col()
table1 <- data.frame(S.No=1, Text=chilli_news)
table1 %>% 
  unnest_tokens(info, Text) %>% 
  count(info) %>% 
  ggplot(aes(n, info)) + geom_col() +
  ggtitle("Text Mining using R") +
  xlab("Number of words") +
  ylab("List of words") + 
  theme(
    plot.title = element_text(colour = "yellow", size = 25, face = "bold", margin = margin(t = 0, r = 0, b = 25, l = 0), hjust = 0.5),
    axis.title.x = element_text(colour = "blue", size = 10, face = "bold", margin = margin(t = 20, r = 0, b = 0, l = 0), hjust = 0.5),
    axis.title.y = element_text(colour = "red", size = 10, face = "bold", margin = margin(t = 0, r = 20, b = 0, l = 0), hjust = 0.5)                            
  )

#--------------------------------------------------------------
#4. 
#a. 
dataset <- read_csv("./ncaa-womens-basketball-tournament-history.csv")
data <- dataset

school <- data[['School']]
Reg_percent <- data[['Reg. %']]
year <- data[['Year']]
conference <- data[['Conference']]

g <- ggplot(data, aes(x=school, y=Reg_percent)) +
  ggtitle("NCAA Womens Basketball Tournament") +
  xlab("School") +
  ylab("Reg %")+
  facet_wrap(~year) +
  geom_col() + 
  theme (
    plot.title = element_text(color = "blue", size=25, face = "bold", margin = margin(t = 0, r = 0, b = 25, l = 0), hjust = 0.5),
    axis.title.x = element_text(color="green", size=10, face="bold", margin = margin(t = 20, r = 0, b = 0, l = 0)),
    axis.title.y = element_text(color="yellow", size=10, face="bold", margin = margin(t = 0, r = 20, b = 0, l = 0))
  )
g


