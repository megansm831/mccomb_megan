# Homework #7 -----------------------------------------------------

# This script will answer the following: Is there a meaningful difference in the frequency of fear words used per talking turn when comparing Bush, Cruz, and Fiorina to Trump? 


# Pre-Flight --------------------------------------------------------------

# Load libraries 
library(tidyverse)
library(tidytext)
library(textstem)

# Load data
data <- read_csv("gop_debates.csv")

# Separate Speakers between Bush, Cruz, Fiorina, and Trump -------------------------------------------------------

bush <- filter(data, who == "BUSH")
cruz <- filter(data, who == "CRUZ")
fiorina <- filter(data, who == "FIORINA")
trump <- filter(data, who == "TRUMP")


