# Homework #8  ------------------------------------

# This R script preforms an automated summative content analysis according to the coding schema provided.


# Pre-Flight --------------------------------------------------------------

#load libraries 
library(tidyverse)
library(tidytext)
library(stringr)
library(textstem)
library(irr)

#load data
data <- read_csv("utreddit.csv")


# Analysis --------------------------------------------------------------

# Auto-code for course scheduling 
schedule <- data %>%
  mutate(Message = tolower(post_text),
         robot_schedule = ifelse(str_detect(post_text,"schedule"),1,0))


# Auto-code for major selection
major <- data %>%
  mutate(Message = tolower(post_text),
         robot_major = ifelse(str_detect(post_text,"major"),1,0))

# Auto-code for policy
policy <- data %>%
  mutate(Message = tolower(post_text),
         robot_policy = ifelse(str_detect(post_text,"policy"),1,0))


# Auto-code for financial aid
finaid <- data %>%
  mutate(Message = tolower(post_text),
         robot_finaid = ifelse(str_detect(post_text,"financial aid"),1,0))

# Auto-code for housing
housing <- data %>%
  mutate(Message = tolower(post_text),
         robot_housing = ifelse(str_detect(post_text,"housing"),1,0))

# Auto-code for food
food <- data %>%
  mutate(Message = tolower(post_text),
         robot_food = ifelse(str_detect(post_text,"food"),1,0))

# Auto-code for course scheduling 
entertainment <- data %>%
  mutate(Message = tolower(post_text),
         robot_enter = ifelse(str_detect(post_text,"entertainment"),1,0))

# Auto-code for humor
funny <- data %>%
  mutate(Message = tolower(post_text),
         robot_funny = ifelse(str_detect(post_text,"funny"),1,0))

