library(leaflet)
m.data<-read.csv("per-capita-consumption-of-chocolate-in-selected-countries-in-2007.csv")
kpp<-m.data$data
m.data %>% 
  leaflet() %>% 
  addTiles() %>%
  addCircles(weight = 1, radius = kpp * 100000)


