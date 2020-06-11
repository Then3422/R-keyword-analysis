##libraries
#install.packages("rentrez")
#install.packages("data.table")

library(tidyverse)
library(rentrez)


articles_number <- function(trm) {
  trm<- paste("\"", trm, "\"")
  pkg_search <- entrez_search(db="pubmed", 
                              term=trm
  )
  return(pkg_search$count) }

keywords <- read.csv("keywords.csv")

pubmed_count <- keywords %>%
  mutate(cnt = sapply(keyword, articles_number))


pubmed_count %>% write_excel_csv("keywords_articlesquotes.csv")
