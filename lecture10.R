# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)

# create token named "twitter_token"
#twitter_token <- create_token(
#  app = appname,
#  consumer_key = key,
#  consumer_secret = secret,
#  access_token = access_token,
#  access_secret = access_secret)




covid_tweets <- search_tweets(q = "#covid", n = 500)
head(rstats_tweets, n = 3)

covid_tweets_clean <- covid_tweets %>%
  dplyr::select(text) %>%
  unnest_tokens(word, text)

data("stop_words")

covid_tweet_words <- covid_tweets_clean %>%
  anti_join(stop_words)


