# instalacja i wczytanie bibliotek 
install.packages("openxlsx")
install.packages("dplyr")
install.packages("plotly")
install.packages("plotrix")
install.packages("ggplot")
install.packages("stringr")
install.packages("reshape2")
install.packages("scales")
install.packages("tseries")
install.packages("RColorBrewer")
library(RColorBrewer)
library(tseries)
library(openxlsx)
library(dplyr)
library(plotly)
library(plotrix)
library(ggplot2)
library(stringr)
library(reshape2)
library(scales)

# wczytywanie danych z excela od 6 wiersza; przpisanie do zmiennej
dane <- read.xlsx("Plik_z_danymi_źródłowymi.xlsx",
                  sheet =  1, startRow = 6)


# tworzenie wektora z nazwami; przypisanie nazw do odpowiednich kolumn
kolumny <- c("Okres","ogolem - przewozy ladunkow", "transport kolejowy - ladunki", 
             "transport samochodowy - ladunki", "transport morski - ladunki", 
             "ogolem - przewozy pasazerow", "transport kolejowy - pasazerowie", 
             "transport samochodowy - pasazerowie", "transport lotniczy - pasazerowie")
colnames(dane) <- kolumny

str(dane)

# PARAMETRY OPISOWE

# wyznaczanie podstawowych parametrów opisowych dla przewozow ladunkow
# wartosci max
max(dane$`transport kolejowy - ladunki`) 
max(dane$`transport samochodowy - ladunki`) 
max(dane$`transport morski - ladunki`) 

# wartosci min
min(dane$`transport kolejowy - ladunki`)
min(dane$`transport samochodowy - ladunki`) 
min(dane$`transport morski - ladunki`) 

# odchylenie standardowe
sd(dane$`transport kolejowy - ladunki`)
sd(dane$`transport samochodowy - ladunki`) 
sd(dane$`transport morski - ladunki`)

# srednia
mean(dane$`transport kolejowy - ladunki`)
mean(dane$`transport samochodowy - ladunki`) 
mean(dane$`transport morski - ladunki`)

# mediana
median(dane$`transport kolejowy - ladunki`)
median(dane$`transport samochodowy - ladunki`) 
median(dane$`transport morski - ladunki`)

# kwartyl 3/4
quantile(dane$`transport kolejowy - ladunki`,3/4)
quantile(dane$`transport samochodowy - ladunki`,3/4) 
quantile(dane$`transport morski - ladunki`,3/4)

# kwartyl 1/4
quantile(dane$`transport kolejowy - ladunki`,1/4)
quantile(dane$`transport samochodowy - ladunki`,1/4) 
quantile(dane$`transport morski - ladunki`,1/4)

# rozstep miedzykwartylowy
IQR(dane$`transport kolejowy - ladunki`)
IQR(dane$`transport samochodowy - ladunki`) 
IQR(dane$`transport morski - ladunki`)

# wariancja probkowa
var(dane$`transport kolejowy - ladunki`)
var(dane$`transport samochodowy - ladunki`) 
var(dane$`transport morski - ladunki`)

# wspolczynnik korelacji
cor(dane$`transport kolejowy - ladunki`,dane$`transport samochodowy - ladunki`)
cor(dane$`transport kolejowy - ladunki`,dane$`transport morski - ladunki`)
cor(dane$`transport samochodowy - ladunki`,dane$`transport morski - ladunki`)

# kowariancja
cov(dane$`transport kolejowy - ladunki`,dane$`transport samochodowy - ladunki`)
cov(dane$`transport kolejowy - ladunki`,dane$`transport morski - ladunki`)
cov(dane$`transport samochodowy - ladunki`,dane$`transport morski - ladunki`)

# statystyka podsumowujaca
summary(dane$`transport kolejowy - ladunki`)
summary(dane$`transport samochodowy - ladunki`) 
summary(dane$`transport morski - ladunki`)

# wyznaczanie podstawowych parametrów opisowych dla przewozow pasazerow
# wartosci max
max(dane$`transport kolejowy - pasazerowie`) 
max(dane$`transport samochodowy - pasazerowie`) 
max(dane$`transport lotniczy - pasazerowie`) 
 
# wartosci min
min(dane$`transport kolejowy - pasazerowie`)
min(dane$`transport samochodowy - pasazerowie`) 
min(dane$`transport lotniczy - pasazerowie`) 

# odchylenie standardowe
sd(dane$`transport kolejowy - pasazerowie`)
sd(dane$`transport samochodowy - pasazerowie`) 
sd(dane$`transport lotniczy - pasazerowie`) 

# srednia
mean(dane$`transport kolejowy - pasazerowie`)
mean(dane$`transport samochodowy - pasazerowie`) 
mean(dane$`transport lotniczy - pasazerowie`) 

# mediana
median(dane$`transport kolejowy - pasazerowie`)
median(dane$`transport samochodowy - pasazerowie`) 
median(dane$`transport lotniczy - pasazerowie`) 

# kwartyl 3/4
quantile(dane$`transport kolejowy - pasazerowie`,3/4)
quantile(dane$`transport samochodowy - pasazerowie`,3/4) 
quantile(dane$`transport lotniczy - pasazerowie`,3/4) 

# kwartyl 1/4
quantile(dane$`transport kolejowy - pasazerowie`,1/4)
quantile(dane$`transport samochodowy - pasazerowie`,1/4) 
quantile(dane$`transport lotniczy - pasazerowie`,1/4) 

# rozstep miedzykwartylowy
IQR(dane$`transport kolejowy - pasazerowie`)
IQR(dane$`transport samochodowy - pasazerowie`) 
IQR(dane$`transport lotniczy - pasazerowie`) 

# wariancja probkowa
var(dane$`transport kolejowy - pasazerowie`)
var(dane$`transport samochodowy - pasazerowie`) 
var(dane$`transport lotniczy - pasazerowie`) 

# wspolczynnik korelacji
cor(dane$`transport kolejowy - pasazerowie`,dane$`transport samochodowy - pasazerowie`)
cor(dane$`transport kolejowy - pasazerowie`,dane$`transport lotniczy - pasazerowie`)
cor(dane$`transport samochodowy - pasazerowie`,dane$`transport lotniczy - pasazerowie`)

# kowariancja
cov(dane$`transport kolejowy - pasazerowie`,dane$`transport samochodowy - pasazerowie`)
cov(dane$`transport kolejowy - pasazerowie`,dane$`transport lotniczy - pasazerowie`)
cov(dane$`transport samochodowy - pasazerowie`,dane$`transport lotniczy - pasazerowie`)

# statystyka podsumowujaca
summary(dane$`transport kolejowy - pasazerowie`)
summary(dane$`transport samochodowy - pasazerowie`) 
summary(dane$`transport lotniczy - pasazerowie`) 


# GRAFICZNA PREZENTACJA DANYCH

# wykresy kolowe

# obliczenie srednich dla przewozow ladunkow
a <- mean(dane$`transport kolejowy - ladunki`)
b <- mean(dane$`transport samochodowy - ladunki`)
g <- mean(dane$`transport morski - ladunki`)

# obliczenie srednich dla przewozow pasazerow
d <- mean(dane$`transport kolejowy - pasazerowie`)
e <- mean(dane$`transport samochodowy - pasazerowie`)
f <- mean(dane$`transport lotniczy - pasazerowie`)

# tworzenie wektorow
x <- c(a, b, g)
y <- c(d, e, f)

# definicja etykiet dla kazdej wartosci
etykiety_ladunkow <- c("Transport kolejowy", "Transport samochodowy", "Transport morski")
etykiety_pasazerow <- c("Transport kolejowy", "Transport samochodowy", "Transport lotniczy")

# tworzenie wykresu kolowego dla przewozow ladunkow 
pie(x, labels = paste0(etykiety_ladunkow, "\n", round(100 * x / sum(x), 1), "%"),
    col = hcl.colors(length(x), palette = "Pastel1"),
    main = "Przewozy ładunków",
    radius = -1,
    cex = 1.2)  # zwiększenie rozmiaru etykiet

# tworzenie wykresu kołowego dla przewozu pasazerow 
pie(y, labels = paste0(etykiety_pasazerow, "\n", round(100 * y / sum(y), 1), "%"),
    col = hcl.colors(length(y), "BluYl"),
    main = "Przewozy pasażerów",
    radius = -1,
    cex = 1.2) 


# Wykresy liniowe

# wykres liniowy, ktory przedstawia przewoz ladunków i pasazerów w latach 2010-2022

# tworzenie szeregow czasowych
tr_ladunkow <- ts(dane$`ogolem - przewozy ladunkow` , frequency = 12, start = c(2010,1))
tr_pasazerow <- ts(dane$`ogolem - przewozy pasazerow` , frequency = 12, start = c(2010,1))

# tworzenie wykresu liniowego
plot(tr_pasazerow, 
     type = "n", 
     main = "Przewozy ładunków i pasażerów w latach 2010-2022", 
     xlab = "Rok", 
     ylab = "Wartości [tyś.]", 
     col = "violet", 
     ylim = c(min(tr_ladunkow, tr_pasazerow), max(tr_ladunkow, tr_pasazerow)))

# dodawanie linii poziomych w tle
abline(h = seq(0, max(tr_pasazerow), by = 5000), col = "lightgray", lty = 2)

# dodawanie linii pionowych w tle
abline(v = seq(2010, 2022, by = 1), col = "lightgray", lty = 2)

# rysowanie danych
lines(tr_pasazerow, col = "violet")
lines(tr_ladunkow, col = "blue")

legend(x = "topright", legend = c("Transport pasażerów", "Transport ładunków"),
       col = c("violet", "blue"), lty = 1, cex = 1, lwd = 3)



# wykres liniowy, ktory przedstawia przewoz ladunkow z wyszczegolnieniem rodzaju transportu w latach 2010-2022

# tworzenie szeregow czasowych
tr_kolejowy_ladunkow <- ts(dane$`transport kolejowy - ladunki`, frequency = 12, start = c(2010,1))
tr_samochodowy_ladunkow <- ts(dane$`transport samochodowy - ladunki`, frequency = 12, start = c(2010,1))
tr_morski_ladunkow <-ts(dane$`transport morski - ladunki` , frequency = 12, start = c(2010,1))

# tworzenie wykresu liniowego
plot(tr_kolejowy_ladunkow, 
     type = "n", 
     main = "Przewóz ładunków z wyszczgólnieniem rodzaju transportu w latach 2010-2022", 
     xlab = "Rok", 
     ylab = "Wartości [tyś.]", 
     col = "green", 
     ylim = c(min(tr_kolejowy_ladunkow, tr_samochodowy_ladunkow, tr_morski_ladunkow), 
              max(tr_kolejowy_ladunkow, tr_samochodowy_ladunkow, tr_morski_ladunkow)))

# dodawanie linii poziomych w tle
abline(h = seq(0, max(tr_samochodowy_ladunkow), by = 1000), col = "lightgray", lty = 2)

# dodawanie linii pionowych w tle
abline(v = seq(2010, 2022, by = 1), col = "lightgray", lty = 2)

# rysowanie danych
lines(tr_kolejowy_ladunkow, col = "green")
lines(tr_samochodowy_ladunkow, col = "darkgreen")
lines(tr_morski_ladunkow, col = "darkseagreen4")

legend(x = "topleft", legend = c("Transport kolejowy", "Transport samochodowy", "Transport morski"),
       col = c("green", "darkgreen","darkseagreen4"), lty = 1, cex = 0.6, lwd = 1)



# wykres liniowy, ktory przedstawia przewoz pasazerow z wyszczegolnieniem rodzaju transportu w latach 2010-2022

# tworzenie szeregow czasowych
tr_kolejowy_pasazerow <- ts(dane$`transport kolejowy - pasazerowie`, frequency = 12, start = c(2010,1))
tr_samochodowy_pasazerow <- ts(dane$`transport samochodowy - pasazerowie`, frequency = 12, start = c(2010,1))
tr_lotniczy_pasazerow <-ts(dane$`transport lotniczy - pasazerowie`, frequency = 12, start = c(2010,1))

# tworzenie wykresu liniowego
plot(tr_kolejowy_pasazerow, 
     type = "n", 
     main = "Przewóz pasażerów z wyszczgólnieniem rodzaju transportu w latach 2010-2022", 
     xlab = "Rok", 
     ylab = "Wartości [tyś.]", 
     col = "hotpink4", 
     ylim = c(min(tr_kolejowy_pasazerow, tr_samochodowy_pasazerow, tr_lotniczy_pasazerow), 
              max(tr_kolejowy_pasazerow, tr_samochodowy_pasazerow, tr_lotniczy_pasazerow)))

# dodawanie linii pionowych w tle
abline(v = seq(2010, 2022, by = 1), col = "lightgray", lty = 2)

# dodawanie linii poziomych w tle
abline(h = seq(0, max(tr_samochodowy_pasazerow), by = 5000), col = "lightgray", lty = 2)

# rysowanie danych
lines(tr_kolejowy_pasazerow, col = "hotpink4")
lines(tr_samochodowy_pasazerow, col = "purple3")
lines(tr_lotniczy_pasazerow, col = "orchid")

legend(x = "topright", legend = c("Transport kolejowy", "Transport samochodowy", "Transport lotniczy"),
       col = c("hotpink4", "purple3","orchid"), lty = 1, cex = 0.7, lwd = 3)



# Histogramy

# tworzenie histogramu dla przewozow ladunkow ogolem
h <- hist(dane$`ogolem - przewozy ladunkow`, 
          col = rgb(0.5, 0.0, 0.5, alpha = 0.5),  # kolor z polprzezroczystoscia 
          main = "Histogram - Przewozy ładunków ogółem",
          xlab = "Wartości", ylab = "Częstość")

# dodanie etykiet licznosci na szczycie slupkow
text(h$mids, h$counts, labels = h$counts, adj = c(0.5, -0.7))

# dodanie cienkich linii poziomych
abline(h = seq(0, max(h$counts), by = 10), col = "gray", lwd = 0.5)


# tworzenie histogramu dla przewozow pasazerów ogolem
h <- hist(dane$`ogolem - przewozy pasazerow`, 
          col = rgb(0.13, 0.55, 0.13, alpha = 0.5),  # kolor z polprzezroczystoscia
          main = "Histogram - Przewozy pasażerów ogółem",
          xlab = "Wartości", ylab = "Częstość")

# dodanie etykiet licznosci na szczycie slupkow
text(h$mids, h$counts, labels = h$counts, adj = c(0.5, -0.7))

# dodanie cienkich linii poziomych
abline(h = seq(0, max(h$counts), by = 10), col = "gray", lwd = 0.5)


# Wykresy slupkowe

# Wykres slupkowy przewozow ladunkow w poszczegolnych latach z podziaoem na rodzaj transportu

# grupowanie danych i sumowanie wartości dla kazdego roku
dane_suma <- dane %>%
  mutate(Rok = substr(Okres, 1, 4)) %>%  # dodanie kolumny z rokiem
  group_by(Rok) %>%
  summarise(
    suma_transport_kolejowy = sum(`transport kolejowy - ladunki`),
    suma_transport_samochodowy = sum(`transport samochodowy - ladunki`),
    suma_transport_morski = sum(`transport morski - ladunki`)
  ) %>%
  ungroup()

# przeksztalcenie danych do formatu dlugiego
dane_suma_long <- melt(dane_suma, id.vars = "Rok", variable.name = "Typ_transportu", value.name = "Suma_ladunkow")

# tworzenie wykresu slupkowego
wykres_suma <- ggplot(dane_suma_long, aes(x = Rok, y = Suma_ladunkow, fill = Typ_transportu)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7, alpha = 0.7) +
  labs(title = "Suma przewozów ładunków w poszczególnych latach",
       x = "Rok", y = "Suma przewozów") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("violet", "cadetblue1", "chartreuse1"),
                    name = "Typ transportu", 
                    labels = c("Kolejowy", "Samochodowy", "Morski")) +
  scale_y_continuous(labels = scales::comma) +
  theme(legend.title = element_text(hjust = 0.5), 
        plot.title = element_text(hjust = 0.5))

print(wykres_suma)


# Wykres słupkowy przewozow pasazerow w poszczegolnych latach z podzialem na rodzaj transportu

# grupowanie danych i sumowanie wartosci dla kazdego roku
dane_suma_pasażerowie <- dane %>%
  mutate(Rok = substr(Okres, 1, 4)) %>%  # dodanie kolumny z rokiem
  group_by(Rok) %>%
  summarise(
    suma_transport_kolejowy = sum(`transport kolejowy - pasazerowie`),
    suma_transport_samochodowy = sum(`transport samochodowy - pasazerowie`),
    suma_transport_lotniczy = sum(`transport lotniczy - pasazerowie`)
  ) %>%
  ungroup()

# przeksztalcenie danych do formatu dlugiego
dane_suma_pasażerowie_long <- melt(dane_suma_pasażerowie, id.vars = "Rok", variable.name = "Typ_transportu", value.name = "Suma_pasażerow")

# tworzenie wykresu slupkowego
wykres_suma_pasażerowie <- ggplot(dane_suma_pasażerowie_long, aes(x = Rok, y = Suma_pasażerow, fill = Typ_transportu)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7, alpha = 0.7) +
  labs(title = "Suma przewozów pasażerów w poszczególnych latach",
       x = "Rok", y = "Suma pasażerów") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = c("slateblue1", "lightsteelblue1", "aquamarine"),
                    name = "Typ transportu", 
                    labels = c("Kolejowy", "Samochodowy", "Lotniczy")) +
  scale_y_continuous(labels = scales::comma) +
  theme(legend.title = element_text(hjust = 0.5), 
        plot.title = element_text(hjust = 0.5))

print(wykres_suma_pasażerowie)


# Wykresy punktowe

# wykres punktowy dla przewozow pasazerow (kolejowy vs samochodowy)
plot(dane$`transport kolejowy - pasazerowie`, 
     dane$`transport samochodowy - pasazerowie`,
     main = "Wykres punktowy - Przewozy pasażerów (kolejowy vs samochodowy)",
     xlab = "Transport kolejowy",
     ylab = "Transport samochodowy",
     col = c("slateblue3", "magenta"), # Dwa różne kolory punktow
     pch = 16, # Ksztalt punktow (kolka)
     cex = 1) # Rozmiar punktow

# dodanie siatki
grid()

# dodanie legendy
legend("topleft", legend = c("Transport kolejowy", "Transport samochodowy"),
       col = c("slateblue3", "magenta"), pch = 16, cex = 0.8)



# wykres punktowy dla przewozow ladunkow (kolejowy vs samochodowy)
plot(dane$`transport kolejowy - ladunki`, 
     dane$`transport samochodowy - ladunki`,
     main = "Wykres punktowy - Przewozy ładunków (kolejowy vs samochodowy)",
     xlab = "Transport kolejowy",
     ylab = "Transport samochodowy",
     col = c("chartreuse1", "lightskyblue"), # kolor punktow z przezroczystoscia 0.5
     pch = 16, # Kształt punktow (kolka)
     cex = 1) # Rozmiar punktow

# dodanie siatki
grid()

# dodanie legendy
legend("topleft", legend = c("Transport kolejowy", "Transport samochodowy"),
       col = c("chartreuse1", "lightskyblue"), pch = 16, cex = 0.8)



# Wykresy pudełkowe

# tworzenie wykresu pudelkowego dla transportu kolejowego, samochodowego i morskiego (przewoz ladunkow)
# Tworzenie wykresu pudełkowego
wp1 <- boxplot(
  dane$`transport kolejowy - ladunki`, 
  dane$`transport morski - ladunki`,
  dane$`transport samochodowy - ladunki`,
  main = "Wykres pudełkowy - Transport ładunków",
  xlab = "Rodzaj transportu",
  ylab = "Ilość ładunków [tyś. ton]",
  col = c("lightcyan4", "lightcyan3", "lightcyan2"),
  names = c("Transport kolejowy", "Transport morski", "Transport samochodowy")
)

# Dodawanie parametrów opisowych na wykresie
text(1, wp1$stats[2, 1], labels = sprintf("Q1: %.2f", wp1$stats[2, 1]), pos = 4, offset = 11)
text(1, wp1$stats[3, 1], labels = sprintf("Mediana: %.2f", wp1$stats[3, 1]), pos = 2, offset = -18)
text(1, wp1$stats[4, 1], labels = sprintf("Q3: %.2f", wp1$stats[4, 1]), pos = 2, offset = -16)
text(1, wp1$stats[1, 1], labels = sprintf("Min: %.2f", wp1$stats[1, 1]), pos = 2, offset = -11)
text(1, wp1$stats[5, 1], labels = sprintf("Maks: %.2f", wp1$stats[5, 1]), pos = 2, offset = -12)

text(3, wp1$stats[2, 3], labels = sprintf("Q1: %.2f", wp1$stats[2, 3]), pos = 2, offset = 11)
text(3, wp1$stats[3, 3], labels = sprintf("Mediana: %.2f", wp1$stats[3, 3]), pos = 2, offset = 12)
text(3, wp1$stats[4, 3], labels = sprintf("Q3: %.2f", wp1$stats[4, 3]), pos = 2, offset = 11)
text(3, wp1$stats[1, 3], labels = sprintf("Min: %.2f", wp1$stats[1, 3]), pos = 2, offset = 6)
text(3, wp1$stats[5, 3], labels = sprintf("Maks: %.2f", wp1$stats[5, 3]), pos = 2, offset = 6)

# Dodanie siatki
grid()



# tworzenie wykresu pudelkowego dla transportu morskiego
wp2 <- boxplot(dane$`transport morski - ladunki`, main = "Transport morski - Przewozy ładunków", 
        ylab = "Liczba ładunków [tyś. ton]",
        col =  "lightcyan2")
# Dodanie siatki
grid()

# Dodawanie parametrów opisowych na wykresie
text(1, wp2$stats[2, 1], labels = sprintf("Q1: %.2f", wp2$stats[2, 1]), pos = 4, offset = 16)
text(1, wp2$stats[3, 1], labels = sprintf("Mediana: %.2f", wp2$stats[3, 1]), pos = 2, offset = -22)
text(1, wp2$stats[4, 1], labels = sprintf("Q3: %.2f", wp2$stats[4, 1]), pos = 2, offset = -20)
text(1, wp2$stats[1, 1], labels = sprintf("Min: %.2f", wp2$stats[1, 1]), pos = 2, offset = -15)
text(1, wp2$stats[5, 1], labels = sprintf("Maks: %.2f", wp2$stats[5, 1]), pos = 2, offset = -15)


# Wykres gestosci

# tworzenie ramki danych dla kazdego okresu
okres_wczesniejszy <- dane$`transport kolejowy - ladunki`[1:78]  # wczesniejszy okres obejmuje pierwsze 78 miesiecy
okres_pozniejszy <- dane$`transport kolejowy - ladunki`[79:156]  # późniejszy okres obejmuje kolejne 78 miesiecy

df_okresy <- data.frame(
  Przewozy = c(okres_wczesniejszy, okres_pozniejszy),
  Okres = rep(c("Wcześniejszy", "Późniejszy"), each = length(okres_wczesniejszy))
)

# tworzenie wykresu
ggplot(df_okresy, aes(x = Przewozy, fill = Okres)) +
  geom_density(alpha = 0.5) +
  labs(title = "Rozkład przewozów transportu kolejowego",
       x = "Przewozy", y = "Gęstość") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(labels = comma)  # Uzywamy funkcji comma do zmiany formatu etykiet na czytelniejszy


# Wykres skrzypcowy

# tworzenie ramki danych dla dwóch okresów (wczesniejszy i pozniejszy)
okres_wczesniejszy <- dane$`transport samochodowy - pasazerowie`[1:78]
okres_pozniejszy <- dane$`transport samochodowy - pasazerowie`[79:length(dane$`transport samochodowy - pasazerowie`)]

# tworzenie ramki danych
df_porownanie <- data.frame(
  Przewozy = c(okres_wczesniejszy, okres_pozniejszy),
  Okres = rep(c("Wcześniejszy", "Późniejszy"), each = length(okres_wczesniejszy))
)

# zmiana kolejności okresów w ramce danych i faktora
df_porownanie$Okres <- factor(df_porownanie$Okres, levels = c("Późniejszy", "Wcześniejszy"))

# obliczenie wielkości próby
sample_size <- df_porownanie %>%
  group_by(Okres) %>%
  summarize(num = n())

# rysowanie wykresu z dostosowanymi parametrami
df_porownanie %>%
  left_join(sample_size) %>%
  mutate(myaxis = paste0(Okres, "\n", "n=", num)) %>%
  ggplot(aes(x = myaxis, y = Przewozy, fill = Okres)) +
  geom_violin(width = 0.6, alpha = 0.8) +
  geom_boxplot(width = 0.2, color = "black", alpha = 0.4) +
  scale_fill_manual(values = c("Późniejszy" = "lightblue", "Wcześniejszy" = "lightgreen")) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(size = 11, hjust = 0.5),  # wysrodkowany tytul
    ) +
  ggtitle("Wykres skrzypcowy dla przewozów pasażerów w dwóch okresach") +
  xlab("Okres")  # Opis osi x



# Wykresy map cieplnych

# Przygotowanie danych dla wykresu heatmap dla przewozu ladunkow
dane_heatmap_ladunki <- dane[, c("transport kolejowy - ladunki", 
                                 "transport samochodowy - ladunki", "transport morski - ladunki")]

correlation_matrix_ladunki <- cor(dane_heatmap_ladunki)

# Tworzenie wykresu heatmap dla przewozu ladunkow 
wykres_heatmap_ladunki <- ggplot(data = melt(correlation_matrix_ladunki), 
                                 aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(colors = brewer.pal(3, "BuGn"), 
                       limits = c(-1, 1), na.value = "grey50") +
  geom_text(aes(label = round(value, 2)), color = "black", size = 3) +
  labs(title = "Mapa cieplna korelacji między rodzajami transportu\nw przewozie ładunków",
       x = "Rodzaj transportu", y = "Rodzaj transportu") +
  scale_x_discrete(labels = c("transport kolejowy - ladunki" = "Transport kolejowy", 
                              "transport samochodowy - ladunki" = "Transport samochodowy", 
                              "transport morski - ladunki" = "Transport morski")) +
  scale_y_discrete(labels = c("transport kolejowy - ladunki" = "Transport kolejowy", 
                              "transport samochodowy - ladunki" = "Transport samochodowy", 
                              "transport morski - ladunki" = "Transport morski")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))  # Wyśrodkowanie tytułu

print(wykres_heatmap_ladunki)


# Przygotowanie danych dla wykresu heatmap dla przewozu pasazerow
dane_heatmap_pasazerowie <- dane[, c("transport kolejowy - pasazerowie", 
                                     "transport samochodowy - pasazerowie", "transport lotniczy - pasazerowie")]

correlation_matrix_pasazerowie <- cor(dane_heatmap_pasazerowie)

# Tworzenie wykresu heatmap dla przewozu pasazerow 
wykres_heatmap_pasazerowie <- ggplot(data = melt(correlation_matrix_pasazerowie), 
                                     aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradientn(colors = brewer.pal(6, "Blues"), 
                       limits = c(-1, 1), na.value = "grey50") +
  geom_text(aes(label = round(value, 2)), color = "black", size = 3) +
  labs(title = "Mapa cieplna korelacji między rodzajami transportu\nw przewozie pasażerów",
       x = "Rodzaj transportu", y = "Rodzaj transportu") +
  scale_x_discrete(labels = c("transport kolejowy - pasazerowie" = "Transport kolejowy", 
                              "transport samochodowy - pasazerowie" = "Transport samochodowy", 
                              "transport lotniczy - pasazerowie" = "Transport lotniczy")) +
  scale_y_discrete(labels = c("transport kolejowy - pasazerowie" = "Transport kolejowy", 
                              "transport samochodowy - pasazerowie" = "Transport samochodowy", 
                              "transport lotniczy - pasazerowie" = "Transport lotniczy")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        axis.text.y = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))  # Wyśrodkowanie tytułu

print(wykres_heatmap_pasazerowie)



# --- WERYFIKACJA HIPOTEZ STATYSTYCZNYCH ---

# Testowanie srednich dla przewozow pasazerow transportem samochodowym i kolejowym
wynik_testu <- t.test(dane$`transport samochodowy - pasazerowie`, 
                      dane$`transport kolejowy - pasazerowie`)
# Wyswietlenie wynikow testu
print(wynik_testu)



# Test t-Studenta przewozów ładunków transportem kolejowym (2 okresy czasu)

# wybor danych dotyczacych przewozow ladunkow transportem kolejowym
dane_kolejowe <- dane$`transport kolejowy - ladunki`

# podzial danych na dwie rowne czesci (wczesniejszy i pozniejszy okres)
polowa_dlugosci <- length(dane_kolejowe) / 2
wczesniejszy_okres <- dane_kolejowe[1:polowa_dlugosci]
pozniejszy_okres <- dane_kolejowe[(polowa_dlugosci + 1):length(dane_kolejowe)]

# przeprowadzenie testu t-Studenta
wynik_testu <- t.test(wczesniejszy_okres, pozniejszy_okres)

# Wyświetlenie wynikiu testu
print(wynik_testu)



# Testy korelacji dla przewozow ladunkow (samochodowy - kolejowy)

# korelacja Pearsona
cor_pearson <- cor.test(dane$`transport samochodowy - ladunki`, 
                        dane$`transport kolejowy - ladunki`, method = "pearson")
print("Korelacja Pearsona:")
print(cor_pearson)

# korelacja Spearmana
cor_spearman <- cor.test(dane$`transport samochodowy - ladunki`, 
                         dane$`transport kolejowy - ladunki`, method = "spearman")
print("Korelacja Spearmana:")
print(cor_spearman)

# korelacja Kendalla
cor_kendall <- cor.test(dane$`transport samochodowy - ladunki`, 
                        dane$`transport kolejowy - ladunki`, method = "kendall")
print("Korelacja Kendalla:")
print(cor_kendall)



# Test korelacji Pearsona dla przewozu pasazerow (samochodowy - kolejowy)

# Przeprowadzenie testu korelacji Pearsona
wynik_korelacji <- cor.test(dane$`transport samochodowy - pasazerowie`,
                            dane$`transport kolejowy - pasazerowie`, method = "pearson")
# Wyświetlenie wyników testu
print(wynik_korelacji)



# Test Shapiro-Wilka 

#dla przewozu ladunkow

#dla danych dotyczacych transportu kolejowego
shapiro_test_kolejowy <- shapiro.test(dane$`transport kolejowy - ladunki`)
print("Test Shapiro-Wilka dla danych transportu kolejowego - pasażerowie:")
print(shapiro_test_kolejowy)

#dla danych dotyczacych transportu samochodowego
shapiro_test_samochodowy <- shapiro.test(dane$`transport samochodowy - ladunki`)
print("Test Shapiro-Wilka dla danych transportu samochodowego - pasażerowie:")
print(shapiro_test_samochodowy)

#dla danych dotyczacych transportu morskiego
shapiro_test_morski <- shapiro.test(dane$`transport morski - ladunki`)
print("Test Shapiro-Wilka dla danych transportu samochodowego - pasażerowie:")
print(shapiro_test_morski)




# Test Jarque-Bera

#dla danych transportu kolejowego
test_jarque_bera_kolejowy <- jarque.bera.test(dane$`transport kolejowy - pasazerowie`)
print("Test Jarque-Bera dla danych transportu kolejowego:")
print(test_jarque_bera_kolejowy)

#dla danych transportu samochodowego 
test_jarque_bera_samochodowy <- jarque.bera.test(dane$`transport samochodowy - pasazerowie`)
print("Test Jarque-Bera dla danych transportu samochodowego:")
print(test_jarque_bera_samochodowy)

#dla danych transportu lotniczego 
test_jarque_bera_lotniczy <- jarque.bera.test(dane$`transport lotniczy - pasazerowie`)
print("Test Jarque-Bera dla danych transportu lotniczego:")
print(test_jarque_bera_lotniczy)



# Testy chi-kwadrat

# dla przewozow ladunkow transportem kolejowym i samochodowym w dwoch okresach
# przygotowanie danych
transport_kolejowy_ladunki <- dane$`transport kolejowy - ladunki`
transport_samochodowy_ladunki <- dane$`transport samochodowy - ladunki`

# podział danych na dwie grupy czasowe (pierwsza połowa, druga połowa)
polowa_pierwsza <- length(transport_kolejowy_ladunki) / 2

transport_kolejowy_1 <- transport_kolejowy_ladunki[1:polowa_pierwsza]
transport_samochodowy_1 <- transport_samochodowy_ladunki[1:polowa_pierwsza]

transport_kolejowy_2 <- transport_kolejowy_ladunki[(polowa_pierwsza + 1):length(transport_kolejowy_ladunki)]
transport_samochodowy_2 <- transport_samochodowy_ladunki[(polowa_pierwsza + 1):length(transport_samochodowy_ladunki)]

# przeprowadzenie testu chi-kwadrat dla dwoch grup czasowych
result <- chisq.test(rbind(
  table(transport_kolejowy_1, transport_samochodowy_1),
  table(transport_kolejowy_2, transport_samochodowy_2)
))
print(result)



# Test chi-kwadrat dla transportu pasażerów transportem samochodowym w dwoch okresach

# przygotowanie danych
transport_samochodowy <- dane$`transport samochodowy - pasazerowie`

# podział danych na dwie grupy czasowe (pierwsza połowa i druga połowa)
polowa_pierwsza <- length(transport_samochodowy) / 2
transport_samochodowy_1 <- transport_samochodowy[1:polowa_pierwsza]
transport_samochodowy_2 <- transport_samochodowy[(polowa_pierwsza + 1):length(transport_samochodowy)]

# przeprowadzenie testu chi-kwadrat dla dwoch grup czasowych transportu samochodowego
result_samochodowy <- chisq.test(table(transport_samochodowy_1, transport_samochodowy_2))
print(result_samochodowy)



# Test regresji

# przygotowanie danych
transport_kolejowy <- dane$`transport kolejowy - ladunki`
transport_samochodowy <- dane$`transport samochodowy - ladunki`

# przeprowadzenie testu regresji
regresja <- lm(transport_samochodowy ~ transport_kolejowy)

# wyswietlenie wynikow testu
summary(regresja)



# Test Wilcoxona-Manna-Whitneya dla danych dotyczacych przewozow pasazerow transportem lotniczym w dwoch okresach

# Test Shapiro-Wilka dla danych transportu lotniczego
shapiro.test(dane$`transport lotniczy - pasazerowie`)

# wydzielenie danych dla okresu wczesniejszego i pozniejszego
dane_wczesniejszy <- dane$`transport lotniczy - pasazerowie`[1:78]  
dane_pozniejszy <- dane$`transport lotniczy - pasazerowie`[79:length(dane$`transport lotniczy - pasazerowie`)]  

# przeprowadzenie testu Wilcoxona-Manna-Whitneya
wynik_testu <- wilcox.test(dane_wczesniejszy, dane_pozniejszy)

# wyswietlenie wyniku testu
print(wynik_testu)
