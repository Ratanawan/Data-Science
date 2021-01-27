# Set Working directory
setwd(dir="/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming")

#get working directory
getwd()

#Change the directory
setwd("/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming")

#General Input
x <- readline(prompt="Enter value: ")
x

#Specific Class
print(x <- as.numeric(readline(prompt = "Enter value: ")))

#use the seq()
#x <- seq(from=1, to=10, by=0.5)
x <- seq(1,10,0.5)

#repeat a single value a number of times
x <- rep(2,10)
f <- c(1:5, rep(seq(2,10,1.5),3),c(1:5))
print(f)
length(f)

#Vectorization
x <- 1:10
log(x)
sqrt(x)
#print the value of index 2
x[2]
#print the values of all the index except 3
x[-3]
#print the values of index 1 and 2
x[1:2]

#vector recycling
#Inner product
(x%*%x)
# outer product
(x%o%x)

#List 
x <- list("kit", NA, 1,3.5)
print(x)

class(x)
#[1] "list"

#Matrix
# dim function
matrix1 <- 1:10
#(row,col)
dim(matrix1) <- c(2,5)
matrix1
#Matrix function
u <- 1:9
f <- matrix(u,3,3,byrow = TRUE)
f
#rbind (by row)
e <- 1:6
k <- 11:16
rbind(e,k)
#cbind (by column)
cbind(e,k)

#Matrix Arithmetic
a <- 1:9
b <- 2:10
x <- matrix(a,3,3,byrow=TRUE)
y <- matrix(b,3,3,byrow = TRUE)
x
y
#Subtraction
x + y
#Abstraction
x - y
#Division
x / y
#Multiplication
x%*%y
x*y
#Inverse
solve(y)
#Transpose
t(x)
#Diagonal
diag(x)
diag(3,3,3)
diag(1:4)
eigen(x)

#Data Frames
n <- c("Ratanawan","Lynan","Jenny")
r <- c("J31","J31","J31")
a <- c(22,21,22)
g <- c("B","C","C")
dt <- data.frame(name = n, room = r, age = a, grade=g)
dt

#Data Import
example = read_csv("/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming/LosingSleep.csv")
example
#print each column
example$Person
#print from top 1-10


#Data Export 
write_csv(dt,"/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming/exportdata.csv",append=TRUE)

write.xlsx(dt, "/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming/dataxlsx.xlsx",append=FALSE, sheetName="Batch4")

#Read data from xlsx
dt <- read.xlsx("/Users/thonlynan/Documents/Academic/Semester VII/Data Science - Mr. Dinesh/R-Programming/dataxlsx.xlsx")
dt
#check whether it is NA or not
is.na(dt)
#return the position of missing value
which(is.na(dt))
#return the missing value as 
apply(is.na(dt),2,which)
#remove NA observations
na.omit(dt)
#calculate mean of age
h <- mean(dt$age, na.rm = TRUE)
h
#Impute Missing value
g <- impute(dt)
g

#Data Manipulation
#install dplyr and ggplot2
x <- ggplot2::mpg
help(mpg)
x
#check row
nrow(x)
#check column
ncol(x)
#check row and col
dim(x)
#select only first 10 row 
head(x,10)
#select only last 5 row
tail(x,5)
#select row and column
x[c(10:15),1:3]
#filter
m <- filter(x, "displ" > 2.0)
m
#arrange
#q <- arrange(x,year)
q <- arrange(x,desc(year))
q
#select
s <- select(x,year,manufacturer)
s
#mutate
u <- mutate(x,test <- cty + hwy)
u
#transmute
t <- transmute(x,test <- cty + hwy)
t
#summarize
e <- summarise(x, f<-log(cty), g<-mean(cty))
e
#rename
r <- rename(x,city = cty)
r
#using Pipes
p <- x %>% filter(cty>18) %>% select(model)
p

#visualization
x <- ggplot2::mpg
x
ggplot(x, mapping = aes(x = cty, y = hwy)) + geom_point(size = 2) + 
  geom_smooth(method = "lm") + coord_cartesian() + 
  xlab("City")+ ylab("Highway")+ ggtitle("MPG DATA")


#Diamonds Dataset
data <- ggplot2::diamonds

ggplot(data, aes(x = carat, y = price, fill = price)) +
  geom_point(size = 4, alpha = 1/9, color = "deepskyblue4") +   
  xlim(0,5)+ ylim(0, 25000) +
  xlab("carat of diamonds") + 
  ylab("price of diamonds") + 
  ggtitle("Diamonds Dataset") +  
  geom_smooth(method = "lm") + 
  facet_grid(color ~ clarity) +
  theme_bw() +
  theme(plot.title = element_text(size = 25, face = "bold", hjust = 0.5, margin = margin(b = 20)),
        axis.title.x = element_text(size = 12, margin = margin(t = 20)),
        axis.title.y = element_text(size = 12, margin = margin(r = 20)),
        strip.background = element_rect(colour = "blue", fill = "red"))



