library('httr')
library('jsonlite')

endpoint <- "http://api.openweathermap.org/data/2.5/weather?q=Lublin&units=metric&appid=ccd2c7f8b414cadf0c4383ce0a541dc2"

getWeather <- GET(endpoint)
weatherText <- content(getWeather, "text")
weatherJson <- fromJSON(weatherText,flatten = TRUE)
weatherDF <- as.data.frame(weatherJson)
#View(weatherDF)

print(weatherDF)
