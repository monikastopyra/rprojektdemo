#1. Napisz funkcję sprawdzająca czy 1 liczba jest podzielna przez druga użyj - %%

isNumDivisible <- function(int1, int2)
  {if(int1%%int2 == 0){
    "Liczba 1 jest podzielna przez druga."
  }else {
    "Liczba pierwsza nie jest podzielna przez druga!"
  }
}

isNumDivisible(4,3)
isNumDivisible(8,2)

#2. Pociąg z Lublina do Warszawy przejechał połowę drogi 
    #   ze średnią prędkością 120 km/h.
    #   Drugą połowę przejechał ze średnią prędkością 90 km/h.
    #   Jaka była średnia prędkość pociągu?
    
    # sredniaPredkosc = 2s/(t1 + t2) = 2/((t1/s)+(t2/s))
    # s/t1 = 120  s/t2 = 90

sredniaPredkosc <-  2/((1/120) + (1/90))
sredniaPredkosc



#3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona 
    # dla 2 wektorów o tej samej długości.
    # Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. 
    # W komentarzu napisz co oznacza wynik.

df <- read.table("dane.csv", header = TRUE, sep = ";")
View(df)

wspolKorelPearsona <- function (x,y) {

  meanX <- mean(x)
  meanY <- mean(y)
  
  r <- sum((x - meanX)*(y - meanY))/(sqrt(sum((x - meanX)^2))*sqrt(sum((y - meanY)^2))) 
  r
}

wspolKorelPearsona(x = df$waga, y = df$wzrost)

# Wspóczynnik korelacji Pearsona zbliżony do 0,98 wskazuje na bardzo silna korelacje 
# miedzy waga a wzrostem w danym zbiorze danych. Potwierdzenie silnej zależnoci
# liniowej możemy zobaczyć na poniższym wykresie:
plot(df$waga, df$wzrost)

# 4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika 
  #  stworzDataFrame <- function(ile=1)
  #  W pierwszym wierszu użytkownik podaje nazwy kolumn. 
  #  W kolejnych wierszach zawartość wierszy ramki danych ( tyle wierszy ile podaliśmy
  #  w argumencie ile. ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości jako parametr, 
  #  domyślna wartością będzie 1)

stworzDataFrame<-function(nrow=1){
  col_names<-readline(prompt="Podaj nazwy kolumn, oddzielajac przecinkami: ")
  columns<-(strsplit(col_names,","))
  as.vector(columns)
  df<-data.frame(matrix(NA, nrow=nrow, ncol=lengths(columns)))
  colnames(df) <- t(unlist(columns))
  
  for(col in colnames(df)){
    df[col] <- c(strsplit(readline(message("Podaj oddzielone przecinkami wartosci wierszy kolumny ", col )), ",")[[1]])
  }
  
  View(df)
}

# 4. Napisz funkcję , która pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, DlaIluPlikow i liczy: 
  #  mean, median,min,max w zależności od podanej nazwy funkcji w argumencie, z katologu który podaliśmy
  #  i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 
  #  UWAGA: w podanych plikach R pobierając komórki nazwane liczbami R wstawi przed nazwy X. 
  #  Funkcję przetestuj dla katalogu smogKrakow.zip.  Wykonując obliczenia pomiń brakujące wartości.

path <- "C:\\Users\\monik\\Documents\\PJATK Big Data\\Semestr 2\\R\\Zadanie_2\\smogKrakow"

liczZplikow <- function(sciezka,nazwaKolumny,jakaFunkcja="mean",DlaIluPlikow=1){ 
  
  files <- list.files(sciezka)
  
  for (n in DlaIluPlikow)
  {
    data <- read.table(paste(sciezka,files[n], sep="\\"), header = TRUE, sep = ",")
  }
  
  result <- if ( jakaFunkcja=='mean') {
               mean(na.omit(data[[nazwaKolumny]]))
             } else if ( jakaFunkcja=='max') {
               max(na.omit(data[[nazwaKolumny]]))
             } else if ( jakaFunkcja=='min') {
               min(na.omit(data[[nazwaKolumny]]))
             } else if ( jakaFunkcja=='median') {
               median(na.omit(data[[nazwaKolumny]]))
             } else {
               print('Function can only be: mean,median, max and min.')
             }
  

  return(result)
}

liczZplikow(sciezka=path,nazwaKolumny='X142_pm10',jakaFunkcja='min',DlaIluPlikow = 3)
liczZplikow(sciezka=path,nazwaKolumny='X142_pressure',jakaFunkcja='median',DlaIluPlikow = 3)
liczZplikow(sciezka=path,nazwaKolumny='X142_pressure',jakaFunkcja='max',DlaIluPlikow = 2)
liczZplikow(sciezka=path,nazwaKolumny='X142_pressure')