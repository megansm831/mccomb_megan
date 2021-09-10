# Homework #2 -------------------------------------------------------------

#Download library tinyverse
library(tidyverse)

#sets the working directory to open "datasets" then "gop_frags"
setwd("datasets/gop_frags/")

#creating a list of the files in our working directory called "files"
files <- list.files()

#reads all the files in our list, "files"
data <- map(files,function(x) read_csv(x))

# creates a list of objects by col from files          
gop_data <- map2(files,data, function(x,y) cbind(x,y))
 
#       
gop_df <- do.call(rbind,gop_data)
                 
# the first element in gop_df is named date                 
names(gop_df)[1] <- "date"
                 
# forwarding values from gop_df to df1                 
# seperating dates in the file by "\\."
# seperating speakers in the file by ":"
# sets variable text length to be number of characters in the text                 
df1 <- gop_df %>% 
  separate(date,"date",sep = "\\.") %>% 
  separate(text, "speaker", sep = ":", remove = FALSE) %>% 
  mutate(text_length = nchar(text))
                 
# forwarding values from df1 to df2 
# putting speakers into a group
# creates a row for each group 
# sets total_length variable to the length of the text
# sets ave_length variable to the mean of the text 
# increases the rows in speaker by adding names and values                 
df2 <- df1 %>% 
  group_by(speaker) %>% 
  summarise(talking_turns = n(), 
            total_length = sum(text_length),
            ave_length = mean(text_length)) %>% 
  pivot_longer(-speaker,names_to = "variable", values_to = "value")
