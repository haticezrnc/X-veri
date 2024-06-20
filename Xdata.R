install.packages("rtweet")
install.packages("lifecycle")
install.packages("tm")
install.packages("NLP")
install.packages("stringr")
install.packages("ggplot2")

library(rtweet)
library(lifecycle)
library(tm)
library(NLP)
library(ggplot2)
library(stringr)

api_key <- "VjTQWvXTar3GgFaVyAlYYTrc2"
api_secret <- "TbuouNwUHakp70zZcm2LPnrg9cEsq74WdwKhKdQyppkPliE4XD"
access_token <- "1803553464678584321-R5NlGFHi6tiKWh2mvRyHXjeWeOlb1D"
access_secret <- "u0R4am4apD8ciGQhuolRUNRKp9z3P4RjiS4HDzq2Fh4RH"

auth <- rtweet::create_token(
  app = "HaticeXveri",
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_secret
)

rtweet::auth_as(auth)


# Veri çekme
tweets <- search_tweets(q = "#datascience", n = 1000, include_rts = FALSE)

head(tweets)


# Metinleri bir Corpus nesnesine dönüştür
corpus <- Corpus(VectorSource(tweets$text))

# Temizleme fonksiyonları
clean_text <- function(text) {
  text <- tolower(text)
  text <- removePunctuation(text)
  text <- removeNumbers(text)
  text <- removeWords(text, stopwords("english"))
  text <- stripWhitespace(text)
  return(text)
}

# Tweet metinlerini temizleme
clean_corpus <- tm_map(corpus, content_transformer(clean_text))

# Temizlenmiş metinleri elde etmek için corpus'u metin vektörüne dönüştür
clean_tweets <- sapply(clean_corpus, as.character)

clean_text <- function(text) {
  text <- tolower(text)
  text <- removePunctuation(text)
  text <- removeNumbers(text)
  text <- removeWords(text, stopwords("english"))
  text <- stripWhitespace(text)
  return(text)
}

clean_corpus <- tm_map(corpus, content_transformer(clean_text))
clean_tweets <- sapply(clean_corpus, as.character)

library(tm)
library(stringr)

# Temizlenmiş metinleri elde etmek için corpus'u metin vektörüne dönüştür
clean_tweets <- unlist(sapply(clean_corpus, as.character))

# Boşluk karakterine göre metinleri ayrıştırma
words <- strsplit(clean_tweets, "\\s+")

# Tüm kelimeleri birleştirme
all_words <- unlist(words)

# Kelime frekansı hesaplama
word_freq <- table(all_words)
word_freq <- sort(word_freq, decreasing = TRUE)
top_words <- head(word_freq, 20)
print(top_words)

# Çubuk grafik oluşturma
barplot(top_words, horiz = TRUE, main = "En Sık Kullanılan Kelimeler", xlab = "Frekans", ylab = "Kelime")

# Her kelime için ayrı bir tablo oluşturma
word_tables <- lapply(unique(all_words), function(word) {
  freq <- word_freq[word]
  data.frame(Word = word, Frequency = freq)
})

# Her kelimenin frekansını içeren tabloları birleştirme
combined_table <- do.call(rbind, word_tables)

# Tabloyu frekansa göre sıralama
combined_table <- combined_table[order(combined_table$Frequency, decreasing = TRUE), ]

# Tabloyu ekrana yazdırma
print(combined_table)

pie_data <- data.frame(Word = names(top_words), Frequency = as.numeric(top_words))
ggplot(pie_data, aes(x = "", y = Frequency, fill = Word)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "En Sık Kullanılan Kelimeler")

# Kelime frekansını hesaplama
word_freq <- table(all_words)
word_freq <- sort(word_freq, decreasing = FALSE)

# En az kullanılan kelimeleri seçme
bottom_words <- tail(word_freq, 10)

# Pasta dilimi grafiği oluşturma
pie_data <- data.frame(Word = names(bottom_words), Frequency = as.numeric(bottom_words))
ggplot(pie_data, aes(x = "", y = Frequency, fill = Word)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "En Az Kullanılan Kelimeler")
# Çubuk grafiği oluşturma
bar_data <- data.frame(Word = names(bottom_words), Frequency = as.numeric(bottom_words))
ggplot(bar_data, aes(x = reorder(Word, -Frequency), y = Frequency)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "En Az Kullanılan Kelimeler", x = "Kelime", y = "Frekans")



