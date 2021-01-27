
library(magrittr)
library(dplyr)
library(tidyverse)
#Dataset: mpg
data<-ggplot2::mpg
help("mpg")
#a
data$Transmission <- ifelse(startsWith(data$trans, 'a'), "automatic", "manual")

#b to h
g <- ggplot(data, aes(x=cty, y=hwy)) +
  ggtitle("Fuel economy data from 1999 to 2008") +
  xlab("City Miles per Gallon") +
  ylab("Highway Miles per Gallon")+
  facet_grid(Transmission ~ year) +
  theme(strip.background = element_rect(fill="blue", color = "red")) +
  theme(strip.text = element_text(color = "white"))+
  geom_col(color="blue", fill="yellow") + 
  theme (
  plot.title = element_text(color = "Red", size = 20, face = "bold", margin = margin(t = 0, r = 0, b = 25, l = 0), hjust = 0.5),
  axis.title.x = element_text(color="green", size=15, face="bold", margin = margin(t = 25, r = 0, b = 0, l = 0)),
  axis.title.y = element_text(color="blue", size=15, face="bold", margin = margin(t = 0, r = 30, b = 0, l = 0))
)

