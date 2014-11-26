
r_hadoop<- searchTwitter("#hadoop", n=1500, cainfo="cacert.pem")
#save text
r_hadoop_text <- sapply(r_hadoop, function(x) x$getText())
#create corpus
r_hadoop_text_corpus <- Corpus(VectorSource(r_hadoop_text))
#clean up
r_hadoop_text_corpus <- tm_map(r_hadoop_text_corpus, tolower) 
r_hadoop_text_corpus <- tm_map(r_hadoop_text_corpus, removePunctuation)
r_hadoop_text_corpus <- tm_map(r_hadoop_text_corpus, function(x)removeWords(x,stopwords()))
wordcloud(r_hadoop_text_corpus)
