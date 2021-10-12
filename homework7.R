# Homework #7 -----------------------------------------------------

# This script will answer the following: Is there a meaningful difference in the frequency of fear words used per talking turn when comparing Bush, Cruz, and Fiorina to Trump? 


# Pre-Flight --------------------------------------------------------------

# Load libraries 
library(tidyverse)
library(tidytext)
install.packages("textdata")

# Load data
data <- read_csv("gop_debates.csv")

# Separate Speakers between Bush, Cruz, Fiorina, and Trump -------------------------------------------------------

bush <- filter(data, who == "BUSH")
cruz <- filter(data, who == "CRUZ")
fiorina <- filter(data, who == "FIORINA")
trump <- filter(data, who == "TRUMP")

# Explore Sentiment Dictionaries ------------------------------------------
afin <- get_sentiments("afinn")
bing <- get_sentiments("bing")
nrc <- get_sentiments("nrc")

# Exploratory Analysis for Bush's data ----------------------------------------------------

# Tokenize by word 
bush %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Again, but with another dictionary (nrc)
bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)



# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Batch analysis
nrc_analysis <- bush %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)

#Aggregate the data
nrc_analysis %>% count(sentiment) %>% pivot_wider(names_from = "sentiment", values_from=n)


# Exploratory Analysis for Cruz's data ----------------------------------------------------

# Tokenize by word 
cruz %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Again, but with another dictionary (nrc)
cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)



# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Batch analysis
nrc_analysis <- cruz %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)

#Aggregate the data
nrc_analysis %>% count(sentiment) %>% pivot_wider(names_from = "sentiment", values_from=n)


# Exploratory Analysis for Fiorina's data ----------------------------------------------------

# Tokenize by word 
fiorina %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Again, but with another dictionary (nrc)
fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)



# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Batch analysis
nrc_analysis <- fiorina %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)

#Aggregate the data
nrc_analysis %>% count(sentiment) %>% pivot_wider(names_from = "sentiment", values_from=n)



# Exploratory Analysis for Trump's data----------------------------------------------------

# Tokenize by word 
trump %>%
  unnest_tokens(word, text, token = "words")

# Analyze with AFIN
trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  left_join(afin)

# Again, but with an auto-filter for unknown words
trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)


# Again, but with another dictionary (bing)
trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(bing)


# Again, but with another dictionary (nrc)
trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)


# Comparative Analyses  ---------------------------------------------------

# Batch analysis
afin_analysis <- trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(afin)

#Aggregate the data
afin_analysis %>% summarise(sent_score = sum(value))


# Batch analysis
nrc_analysis <- trump %>%
  unnest_tokens(word, text, token = "words") %>% 
  inner_join(nrc)

#Aggregate the data
nrc_analysis %>% count(sentiment) %>% pivot_wider(names_from = "sentiment", values_from=n)



