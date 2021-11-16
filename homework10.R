# Homework #10 -------------------------------------------------------------

# This code reveals how Twitter users feel about Zendaya's appearance in the movie, Dune
# For background, Zendaya was promoted to be a big character in the movie, but surprisingly made a brief appearance in the film


# Pre-Flight --------------------------------------------------------------

# install packages
install.packages("rtweet")
install.packages("ggplot2")
install.packages("textdata")

# load libraries
library(rtweet)
library(ggplot2)
library(tidyverse)
library(tidytext)

# input api key information from Twitter Developer
api_key <- "1TYgmTRqIDEg2vayDlEGqDspE"
api_secret_key <- "lvjBygE53m8HyobJ2IW1bSctTbJ5BsOVqgQItsRRsVVGDuc0eQ"

# authenticate via web browser
token <- create_token(
  app = "Zendaya assignment",
  consumer_key = api_key,
  consumer_secret = api_secret_key)

## search for 18000 tweets using the words "Zendaya" and "Dune"
rt <- search_tweets(
  "zendaya|dune", n = 18000, include_rts = TRUE
)
## preview tweets data
rt

## preview users data
users_data(rt)

## plot time series (if ggplot2 is installed)
ts_plot(rt)

## plot time series of tweets
ts_plot(rt, "3 hours") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of Zendaya's mention in Dune movie from past 9 days",
    subtitle = "Twitter status (tweet) counts aggregated using three-hour intervals",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )

##### LEAD INTO FINAL PROJECT #####
# Deciding between a positive or negative reaction --------------------------------------------------------------------
## Sentiment Analysis

afin <- get_sentiments("afinn")

# Tokenize by word 
zen %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
zen %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
zen %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- zen %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))



