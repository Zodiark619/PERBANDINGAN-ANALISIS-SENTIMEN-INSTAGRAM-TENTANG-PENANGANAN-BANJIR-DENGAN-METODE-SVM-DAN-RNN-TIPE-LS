setwd("D:agimaulana/agi")
library("readxl")
bucin <- read_excel("comments.xlsx")
bucin1 <- read_excel("comments_banjir1.xlsx")
bucin2 <- read_excel("comments_banjir2.xlsx")
bucin3=rbind(bucin,bucin1,bucin2)
bucin4 <- plyr::rename(bucin3, c(comment="text"))
bucin4$name <- NULL
bucin4$sentiment=c(1)
write.csv(bucin4,"bucin1.csv")
grades3 <-read.csv("bucin1.csv",header=TRUE)



library(textclean)
library(devtools)
library(tokenizers)
library(katadasaR)
library(dplyr)
library(tm)
library(dplyr)
library(tibble)
library(tidyverse)
library(wordcloud)
install_github("nurandi/katadasar")

#tweets=read.csv("neo.csv")
tweets=grades3$text %>% as.character()
head(tweets)
nrow(tweets)
tweets=gsub("\n"," ",tweets)
tweets=tweets %>% replace_html() %>% replace_url()
tweets=tweets %>% replace_emoji(.) %>% replace_html(.)
tweets=tweets %>% replace_tag(tweets, pattern="@([A-Za-z0-9_]+)",replacement="") %>% 
  replace_hash(tweets, pattern="#([A-Za-z0-9_]+)",replacement="")
tweets=strip(tweets)
tweets=as.character(tweets)

tweets= tweets %>% as.data.frame() %>% distinct()
#tweets= tweets %>% as.data.frame()
nrow(tweets)
tweets=as.character(tweets$.)
library(tm)
library(dplyr)
library(tibble)
library(tidyverse)

toto=as.data.frame(t(tweets)) 
View(toto)

susu=toto %>% 
  rownames_to_column() %>% 
  gather(variable,value,-rowname) %>% 
  spread(rowname,value)
write.csv(susu,file="bucin10.csv")
gogo=read.csv("bucin10.csv")


juh <- plyr::rename(dok, c(X.1.="text"))
juh$tringsAsFactors <- NULL
dok$X.variable. <- NULL
mydata <- edit(mydata)
juh=read.csv("databersih.csv")
juh=as.character(juh)
view(juh)


library(tm)
library(NLP)
library(stringr)
library(caret)
library(dplyr)
library(katadasaR)
library(tau)
library(parallel)

#dok=read.csv("bucin10.csv", stringsAsFactors = TRUE)
dok=read.csv("bucin10.csv",quote="",stringsAsFactors=FALSE)
corpusdok <- Corpus(VectorSource(dok$text))
inspect(corpusdok[1:10])
dok_casefolding <- tm_map(corpusdok, content_transformer(tolower))
inspect(dok_casefolding[1:10])
removeURL <- function(x) gsub("http[^[:space:]]*", "", x)
dok_URL <- tm_map(dok_casefolding, content_transformer(removeURL))
inspect(dok_URL[1:10])
remove.mention <- function(x) gsub("@\\S+", "", x)
dok_mention <- tm_map(dok_URL, remove.mention)
inspect(dok_mention[1:10])

remove.hashtag <- function(x) gsub("#\\S+", "", x)
dok_hashtag <- tm_map(dok_mention, remove.hashtag)
dok_punctuation<-tm_map(dok_hashtag,content_transformer(removePunctuation))
dok_nonumber<-tm_map(dok_punctuation, content_transformer(removeNumbers))
cStopwordID<-readLines("stoplist.txt")
dok_stopword <- tm_map(dok_nonumber, removeWords, cStopwordID)
dok_whitespace<-tm_map(dok_stopword,stripWhitespace)
databersih<-data.frame(text=unlist(sapply(dok_whitespace,`[`)), tringsAsFactors=F)
write.csv(databersih,file="databersih.csv")


juh <- plyr::rename(juh, c(X.1.="text"))
juh$tringsAsFactors <- NULL
juh$X <- NULL
juh <- edit(juh)
juh=read.csv("databersih.csv")
juh$sentiment=c(1)
jug=read.csv("proposal3.csv")
write.csv(meon,"databersih3.csv")
meon=rbind(jug,juh)

setwd("D:agimaulana/agi")
library("readxl")
goco=read.csv("databersih3.csv")
goco=edit(goco)

write.csv(guna,"databersih_hasilakhir.csv")
guna=read.csv("databersih_hasilakhir.csv")
view(guna)
guna$X.2 <- NULL

