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
textstat_readability(data$text, measure = "Flesch.Kincaid")

#calculate lexical diversity
textstat_lexdiv(
  data$text,
  measure = c("TTR", "C", "R", "CTTR", "U", "S", "K", "I", "D", "Vm", "Maas", "MATTR",
              "MSTTR", "all"),
  remove_numbers = TRUE,
  remove_punct = TRUE,
  remove_symbols = TRUE,
  remove_hyphens = FALSE,
  log.base = 10,
  MATTR_window = 100L,
  MSTTR_segment = 100L,
)
