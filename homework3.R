# Homework #2 -------------------------------------------------------------


#Load Libraries 
library(tidyverse)
library(quanteda)
library(quanteda.textstats)


#Load Data
data <- read_csv("gop_debates.csv")

# ?textstat_readability

#print the text with who said it
data$text

#measure the readiblity of every line of text
textstat_readability(data$who, measure = "Flesch.Kincaid")


#creates a col in our csv file of readibility scores 
data$Readibility <- textstat_readability(data$who, measure = "Flesch.Kincaid")
data$Readibility

#sort presidents based on name
newdata <- sort(data$who)
newdata$text

#Aggregates the data by candidate and returns a two column data frame: speaker | ave_complexity in descending order of complexity.
