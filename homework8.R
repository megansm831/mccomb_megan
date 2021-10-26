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


# Analysis with post text--------------------------------------------------------------

# Auto-code for course scheduling 
schedule <- data %>%
  mutate(Message = tolower(post_text),
         robot_schedule = ifelse(str_detect(post_text,"schedule|course|requirements|prereqs|intstructor|professor|timing|easy|hard|class"),1,0))


# Auto-code for major selection
major <- data %>%
  mutate(Message = tolower(post_text),
         robot_major = ifelse(str_detect(post_text,"major|easier|harder|undergrad|postgrad|study|accept"),1,0))

# Auto-code for policy
policy <- data %>%
  mutate(Message = tolower(post_text),
         robot_policy = ifelse(str_detect(post_text,"policy|university|college|program"),1,0))


# Auto-code for financial aid
finaid <- data %>%
  mutate(Message = tolower(post_text),
         robot_finaid = ifelse(str_detect(post_text,"financial aid|finaid|financial|aid|scholarship|grant|apply"),1,0))

# Auto-code for housing
housing <- data %>%
  mutate(Message = tolower(post_text),
         robot_housing = ifelse(str_detect(post_text,"housing|apartment|dorm|house|roommate|roomie|location|price|on campus|off campus"),1,0))

# Auto-code for food
food <- data %>%
  mutate(Message = tolower(post_text),
         robot_food = ifelse(str_detect(post_text,"food|restaurant|Guad|to go|fast|cheap|meal|vegan|vegetarian|gluten free|eat"),1,0))

# Auto-code for course scheduling 
entertainment <- data %>%
  mutate(Message = tolower(post_text),
         robot_enter = ifelse(str_detect(post_text,"entertainment|sport|game|football|ticket|downtown|go out|hang out|res life|nightlife|weekend"),1,0))

# Auto-code for humor
funny <- data %>%
  mutate(Message = tolower(post_text),
         robot_funny = ifelse(str_detect(post_text,"funny|lol|haha|meme|A&M|sucks"),1,0))


# Analysis with title ----------------------------------------------------------------------------------


# Auto-code for course scheduling 
schedule2 <- data %>%
  mutate(Message = tolower(title),
         robot_schedule = ifelse(str_detect(title,"schedule|course|requirements|prereqs|intstructor|professor|timing|easy|hard|class"),1,0))


# Auto-code for major selection
major2 <- data %>%
  mutate(Message = tolower(title),
         robot_major = ifelse(str_detect(title,"major|easier|harder|undergrad|postgrad|study|accept"),1,0))

# Auto-code for policy
policy2 <- data %>%
  mutate(Message = tolower(title),
         robot_policy = ifelse(str_detect(title,"policy|university|college|program"),1,0))


# Auto-code for financial aid
finaid2 <- data %>%
  mutate(Message = tolower(title),
         robot_finaid = ifelse(str_detect(title,"financial aid|finaid|financial|aid|scholarship|grant|apply"),1,0))

# Auto-code for housing
housing2 <- data %>%
  mutate(Message = tolower(title),
         robot_housing = ifelse(str_detect(title,"housing|apartment|dorm|house|roommate|roomie|location|price|on campus|off campus"),1,0))

# Auto-code for food
food2 <- data %>%
  mutate(Message = tolower(title),
         robot_food = ifelse(str_detect(title,"food|restaurant|Guad|to go|fast|cheap|meal|vegan|vegetarian|gluten free|eat"),1,0))

# Auto-code for course scheduling 
entertainment2 <- data %>%
  mutate(Message = tolower(title),
         robot_enter = ifelse(str_detect(title,"entertainment|sport|game|football|ticket|downtown|go out|hang out|res life|nightlife|weekend"),1,0))

# Auto-code for humor
funny2 <- data %>%
  mutate(Message = tolower(title),
         robot_funny = ifelse(str_detect(title,"funny|lol|haha|meme|A&M|sucks"),1,0))

# Finds all the posts that were flagged----------------------------------------------

schedule_post = schedule$robot_schedule + schedule2$robot_schedule
major_post = major$robot_major + major2$robot_major
policy_post = policy$robot_policy + policy2$robot_policy
finaid_post = finaid$robot_finaid + finaid2$robot_finaid
house_post = housing$robot_housing + housing2$robot_housing
food_post = food$robot_funny + food2$robot_food
enter_post = entertainment$robot_enter + entertainment2$robot_enter
funny_post = funny$robot_funny + funny2$robot_funny

