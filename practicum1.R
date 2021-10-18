# Practicum #1 -----------------------------------------------------

# This script will conduct the following: compare texts classified as spam or not spam to determine if there is a measurable and meaningful difference in average number of positive and negative words per text.


# Pre-Flight --------------------------------------------------------------

# Load libraries 
library(tidyverse)
library(tidytext)
install.packages("textdata")

# Load data
data <- read_csv("spam_ham.csv")

# Separate Speakers into Spam and Ham -------------------------------------------------------

spam <- filter(data, Type == "spam")
ham <- filter(data, Type == "ham")


# Explore Sentiment Dictionaries ------------------------------------------
afin <- get_sentiments("afinn")
bing <- get_sentiments("bing")

# Exploratory Analysis for Spam's data ----------------------------------------------------

# Tokenize by word 
spam %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
spam %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
spam %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
spam %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- spam %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Exploratory Analysis for ham's data ----------------------------------------------------

# Tokenize by word 
ham %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
ham %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
ham %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
ham %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- ham %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Batch analysis
nrc_analysis <- ham %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)


