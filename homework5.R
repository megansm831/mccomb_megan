# Homework #5 -------------------------------------------------------------

# This script 1) Imports the appropriate data from the shared data sets. 2) Conducts a TF-IDF analysis comparing each of the 2015 debates. And 3) Visualizes the top 10 most common terms for each of the 2015 debates. 


# Pre-flight --------------------------------------------------------------

#load libraries 
library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(dplyr)
library(janeaustenr)
library(tidytext)

#load data
data <- read_csv("datasets/gop_debates.csv")


# Analyze Speaking Complexity ---------------------------------------------
data <- data %>% 
  bind_cols(textstat_readability(.$text,measure = "ELF")) # bind ELF score to each row


# Aggregate & Arrange Data ------------------------------------------------
data %>% 
  select(speaker=who,ELF) %>% # select columns of interest and rename who as speaker 
  group_by(speaker) %>%  
  