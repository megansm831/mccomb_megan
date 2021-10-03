# Homework #6 -----------------------------------------------------

# This script will do the following: 1. Imports the appropriate dataset. 2. Conducts a lemmatized framegram analysis comparing each of the named candidates.  3. Visualizes the top 10 most frames for each of the named candidates. 


# Pre-Flight --------------------------------------------------------------

# Load libraries 
library(tidyverse)
library(tidytext)
library(textstem)


# Load data
data <- read_csv("gop_debates.csv")

# Trigrams ----------------------------------------------------------------

# Visualize most commonly occurring terms
data %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(n > 200) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(x=word, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Visualize most commonly occurring trigrams (take 1)
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(n > 200) %>%
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()


# Visualize most commonly occurring trigrams (take 2)
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(n > 200) %>%
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Visualize most commonly occurring trigrams (take 3)
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(n > 100) %>%
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()



# Framegrams --------------------------------------------------------------

#stringr::str_detect()
?str_detect()


# Immigration framegram 
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,"immigration")) %>% 
  filter(n > 2) %>% # note filter change 
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()


# Stem and lemmatize 
stem_words("immigration")
lemmatize_words("immigration")


# Immigration framegram (stemmed)
data %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,"immigr|immigration")) %>% 
  filter(n > 2) %>% # note filter change 
  mutate(trigram = reorder(trigram, n)) %>%
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()


# Now with synonyms 
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
