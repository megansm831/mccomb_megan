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

# Stem and lemmatize with synonyms
stem_strings("immigration displacement migration")
lemmatize_strings("immigration displacement migration")

# Save terms for later
immig_terms <- "immigration|displacement|migration|immigr|displac|migrat"

# Addressing Stop Words ----------------------------------------------------

#paste
paste(stop_words$word, collapse = "|")

#creates bounded stop words
stop_words_bounded <- paste0("\\b", stop_words$word, "\\b", collapse = "|")


# Top 10 immigration terms framegram for Trump (remove double stopwords) 
trump %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,immig_terms)) %>% 
  filter(str_count(trigram,stop_words_bounded) < 1) %>% 
  mutate(trigram = reorder(trigram, n)) %>%
  slice(1:10) %>% # top 10 
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Top 10 immigration terms framegram for Cruz (remove double stopwords) 
cruz %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,immig_terms)) %>% 
  filter(str_count(trigram,stop_words_bounded) < 1) %>% 
  mutate(trigram = reorder(trigram, n)) %>%
  slice(1:10) %>% # top 10 
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

# Top 10 immigration terms framegram for Rubio (remove double stopwords) 
rubio %>%
  unnest_tokens(trigram, text, token = "ngrams", n=3) %>% 
  #anti_join(stop_words) %>%
  count(trigram, sort = TRUE) %>%
  filter(str_detect(trigram,immig_terms)) %>% 
  filter(str_count(trigram,stop_words_bounded) < 1) %>% 
  mutate(trigram = reorder(trigram, n)) %>%
  slice(1:10) %>% # top 10 
  ggplot(aes(x=trigram, y=n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()


# Conclusion -------------------------------------------------------------

# We can tell based on the trigrames that Trump, Cruz, and Rubio have different ideas
# of immigration. Trump uses phrases like "stop illegal immigration" and "horribly
# illegal immigration" to show his negative thoughts on immigration. Cruz uses phrases 
# like "hiring illegal immigrants" and "embrace legal immigrants" to show his accepting 
# view on immigration. Rubio uses phrases like "celebrate legal immigration" and "allowing
# undocumented immigrants" to show his acceptance of immigrants as well. The most salient
# differences in how each spoke was that Trump spoke about them more negatively and Cruz
# and Rubio spoke about immigrants more positively/ in a welcoming manner.