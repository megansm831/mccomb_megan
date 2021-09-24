# Homework #4 -------------------------------------------------------------

# This script 1) Imports the appropriate data from the shared data sets. 2) Analyzes the speaking complexity of each speaking turn using an appropriate complexity metric. And 3) Calculates and visualizes the mean difference in speaking complexity for each of the above named candidates.  


# Pre-flight --------------------------------------------------------------

#load libraries 
library(tidyverse)
library(quanteda)
library(quanteda.textstats)

install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)    # alternatively, this also loads %>%


#load data
data <- read_csv("gop_debates.csv")


# Analyze Speaking Complexity ---------------------------------------------
data <- data %>% 
  bind_cols(textstat_readability(.$text,measure = "ELF")) # bind ELF score to each row


# Aggregate & Arrange Data ------------------------------------------------
data %>% 
  select(speaker=who,ELF) %>% # select columns of interest and rename who as speaker 
  group_by(speaker) %>%  
  summarise(ave_complexity = mean(ELF)) %>% # get average speaking complexity  
  dif <- data.frame(diff(as.matrix(ave_complexity))) # find the difference between the speaking complexities
  mean(dif) # find the mean of the differences
  
  
