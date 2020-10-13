# Create Plot of Top 20 Words (credit: https://cbail.github.io/SICSS_Dictionary-Based_Text_Analysis.html)

library(tm)
library(stringr)
library(dplyr)
library(tidytext)

tidy_blog <- as.data.frame(blogsamp) %>% unnest_tokens('word',blogsamp)
  
topblogwords<-
  tidy_blog %>%
  anti_join(stop_words) %>%
  count(word) %>%
  arrange(desc(n))

topblogwords<-  topblogwords[-grep("https|t.co|amp|rt",topblogwords$word),]

top_20<-topblogwords[1:20,]

#create factor variable to sort by frequency
topblogwords$word <- factor(topblogwords$word, levels = topblogwords$word[order(topblogwords$n,decreasing=TRUE)])


library(ggplot2)
ggplot(top_20, aes(x=word, y=n, fill=word))+
  geom_bar(stat="identity")+
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  ylab("Number of Times Word Appears in Blog Posts")+
  xlab("")+
  guides(fill=FALSE)