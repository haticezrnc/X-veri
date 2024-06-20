# X-veri
Bu kod, Twitter üzerinde belirli bir hashtag (#datascience) ile ilgili tweetleri çekmeyi ve bu tweetlerin içeriğindeki kelimelerin frekanslarını hesaplamayı sağlar. Ayrıca, en sık kullanılan ve en az kullanılan kelimelerin çubuk grafiklerini ve pasta dilimi grafiklerini oluşturur.
Kodun genel akışı şu adımlardan oluşur:
Gerekli paketlerin yüklenmesi ve ilgili kütüphanelerin çağrılması.
Twitter API kimlik bilgilerinin tanımlanması ve yetkilendirme yapılması.
Belirli bir hashtag ile ilgili tweetlerin çekilmesi.
Çekilen tweetlerin metinlerinin bir Corpus nesnesine dönüştürülmesi.
Metin temizleme fonksiyonunun tanımlanması ve temizleme işleminin uygulanması.
Temizlenmiş metinlerin kelime düzeyinde ayrıştırılması ve tüm kelimelerin birleştirilmesi.
Kelime frekanslarının hesaplanması ve en sık kullanılan kelimelerin belirlenmesi.
En sık kullanılan kelimeler için çubuk grafik ve pasta dilimi grafiklerinin oluşturulması.
En az kullanılan kelimelerin belirlenmesi ve çubuk grafiklerinin oluşturulması.
Bu kod, Twitter API kullanarak tweetleri çekmek ve metin işleme yöntemlerini kullanarak kelimelerin frekanslarını hesaplamak için rtweet, tm, NLP, stringr ve ggplot2 gibi R paketlerini kullanır.
Kullanılan Dil : R
Kullanılan Paketler : rtweet tm NLP stringr ggplot2
Kullanılan API : X API
