
r_zynga<- searchTwitter("#zynga", n=1500, cainfo="cacert.pem")
#save text
r_zynga_text <- sapply(r_zynga, function(x) x$getText())
#create corpus
r_zynga_text_corpus <- Corpus(VectorSource(r_zynga_text))
#clean up
r_zynga_text_corpus <- tm_map(r_zynga_text_corpus, tolower) 
r_zynga_text_corpus <- tm_map(r_zynga_text_corpus, removePunctuation)
r_zynga_text_corpus <- tm_map(r_zynga_text_corpus, function(x)removeWords(x,stopwords()))
wordcloud(r_zynga_text_corpus)

r_zynga.text = laply(r_zynga, function(t)t$getText())
pos = scan('c:/sentiment/poswords.txt', what='character', comment.char'
neg = scan('c:/sentiment/negwords.txt', what='character', comment.char=';')
source('c:/sentiment/sentiment.R')
exc = scan('c:/sentiment/excwords.txt', what='character', comment.char=';')
analysis = score.sentiment(r_zynga.text, pos, neg, exc)
table(analysis$score)

mean(analysis$score)
median(analysis$score)
hist(analysis$score)