library(twitteR);
library(tm);
library(wordcloud);
library(RColorBrewer);
library(ROAuth);
library(RCurl);
library(digest);

##download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")


##consumer key
twit_consumer_key='###';
##consumer secret
twit_consumer_secret='###';
##request token URL
twit_request_url='https://api.twitter.com/oauth/request_token';
##access token URL
twit_access_url='https://api.twitter.com/oauth/access_token';
##authorize URL
twit_authorize_url='https://api.twitter.com/oauth/authorize';

cred <- OAuthFactory$new(consumerKey=twit_consumer_key,
                         consumerSecret=twit_consumer_secret,
                         requestURL=twit_request_url,
                         accessURL=twit_access_url,
                         authURL=twit_authorize_url);
cred$handshake(cainfo='cacert.pem');

save(cred, file="twitter authentication.Rdata")
registerTwitterOAuth(cred)


r_stats<- searchTwitter("#Rstats", n=1500, cainfo="cacert.pem")
#save text
r_stats_text <- sapply(r_stats, function(x) x$getText())
#create corpus
r_stats_text_corpus <- Corpus(VectorSource(r_stats_text))
#clean up
r_stats_text_corpus <- tm_map(r_stats_text_corpus, tolower) 
r_stats_text_corpus <- tm_map(r_stats_text_corpus, removePunctuation)
r_stats_text_corpus <- tm_map(r_stats_text_corpus, function(x)removeWords(x,stopwords()))
wordcloud(r_stats_text_corpus)
