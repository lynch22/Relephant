
r_exacttarget<- searchTwitter("#exacttarget", n=1500, cainfo="cacert.pem")
#save text
r_exacttarget_text <- sapply(r_exacttarget, function(x) x$getText())
#create corpus
r_exacttarget_text_corpus <- Corpus(VectorSource(r_exacttarget_text))
#clean up
r_exacttarget_text_corpus <- tm_map(r_exacttarget_text_corpus, tolower) 
r_exacttarget_text_corpus <- tm_map(r_exacttarget_text_corpus, removePunctuation)
r_exacttarget_text_corpus <- tm_map(r_exacttarget_text_corpus, function(x)removeWords(x,stopwords()))
wordcloud(r_exacttarget_text_corpus)
