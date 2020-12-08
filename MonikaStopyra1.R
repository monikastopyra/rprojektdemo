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



#3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 2 wektorów o tej samej długości.
Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. W komentarzu napisz co oznacza wynik.

