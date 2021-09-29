# Homework #5 -------------------------------------------------------------

# This script 1) Imports the appropriate data from the shared data sets. 2) Conducts a TF-IDF analysis comparing each of the 2015 debates. And 3) Visualizes the top 10 most common terms for each of the 2015 debates. 


# Pre-flight --------------------------------------------------------------

#load libraries 
library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(tidytext)
library(tidyverse)
library(rmarkdown)
library(dplyr)

#load data
data <- read_csv("gop_debates.csv")

#Conducts a TF-IDF analysis comparing each of the 2015 debates. 
data = data %>% 
  mutate(issue_code = paste0(title, full_date)) %>%
  group_by(issue_code, word) %>%
  tally() %>% 
  arrange(desc(n))

data %>% bind_tf_idf(word, issue_code, n)

# Visualizes the top 10 most common terms for each of the 2015 debates. 
data %>% 
  bind_tf_idf(word, issue_code, n) %>% 
  arrange(desc(tf_idf))