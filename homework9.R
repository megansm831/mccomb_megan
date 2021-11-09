# Homework #9  ------------------------------------

# This R script develops a Spam detection AI for the spam_ham.CSV


# Pre-Flight --------------------------------------------------------------

#load libraries 
library(tidyverse)
library(tidytext)
library(stringr)
library(textstem)
library(irr)

#load data
data <- read_csv("spam_ham.csv")


#Analysis -----------------------------------------------------------------

# Auto-code for call to action Spam words
cta <- data %>%
  mutate(Message = tolower(Message),
         cta_spam = ifelse(str_detect(Message,"text|txt|claim|call|collect|join|click|win|go to|send"),1,0))

# codes a "1" for spam messsages and a "0" for ham messages
spammsg <- cta$cta_spam




