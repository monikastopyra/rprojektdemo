library('httr')
library('jsonlite')

nasa_key <- 'i5mWdYGv1oSPrYLeCn9iWLA6nGyW5e0wIBU7aQZy'
url <- paste0('https://api.nasa.gov/planetary/apod?api_key=', nasa_key)

print(url)

response <- GET(url)
responseText <- content(response, "text")
responseJson <- fromJSON(responseText,flatten = TRUE)
nasaDF <- as.data.frame(responseJson)

View(nasaDF)


