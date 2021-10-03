# Homework #6 -----------------------------------------------------

# This script will do the following: 1. Imports the appropriate dataset. 2. Conducts a lemmatized framegram analysis comparing each of the named candidates.  3. Visualizes the top 10 most frames for each of the named candidates. 


# Pre-Flight --------------------------------------------------------------

# Load libraries 
library(tidyverse)
library(tidytext)
library(textstem)

# Load data
data <- read_csv("gop_debates.csv")

# Separate Speakers between Trump, Cruz, and Rubio -------------------------------------------------------

trump <- filter(data, who == "TRUMP")
cruz <- filter(data, who == "CRUZ")
rubio <- filter(data, who == "RUBIO")

# Framegrams --------------------------------------------------------------

#stringr::str_detect()
?str_detect()

# Stem and lemmatize with synonyms
stem_strings("immigration displacement migration")
lemmatize_strings("immigration displacement migration")

# Save terms for later
immig_terms <- "immigration|displacement|migration|immigr|displac|migrat"

# Immigration framegram (with added terms)
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,immig_terms)) %>% 
  filter(n > 2) %>% # note filter change 
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Addressing Stop Words ----------------------------------------------------

#stringr::str_count()
?str_count()

#paste
paste(stop_words$word, collapse = "|")

#creates bounded stop words
stop_words_bounded <- paste0("\\b", stop_words$word, "\\b", collapse = "|")


# Top 15 Economic terms framegram (remove double stopwords) 
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,immig_terms)) %>% 
  filter(str_count(trigram,stop_words_bounded) < 1) %>% 
  mutate(trigram = reorder(trigram, n)) %>%
  slice(1:15) %>% # top 10 
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()
