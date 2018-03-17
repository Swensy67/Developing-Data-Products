library(shiny)
library(leaflet)

shinyServer(function(input, output, session) {
   
  output$distPlot <- renderLeaflet({
    
    adress = c("Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Rennes")
    
    popTot = 67795000
    pourcentage = c()
    
    md_cities <- data.frame(name = c("Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Rennes"),
                            lat = c(48.8534, 43.294536, 45.762364, 43.603160, 43.696475, 47.2173, 48.5833, 43.608525, 44.840296, 48.111842),
                            lng = c(2.3488, 5.368413, 4.828607, 1.444732, 7.276213, -1.5534, 7.75, 3.876564, -0.572699, -1.679958),
                            pourcentage = c(2206488/67795000, 861635/67795000, 513273/67795000, 471941/67795000, 342522/67795000, 303382/67795000, 277270/67795000, 277639/67795000, 249712/67795000, 215366/67795000),
                            col = c("red", "red", "red", "blue", "blue", "blue", "green", "green", "green", "green"))
    
    md_cities %>%
      leaflet() %>%
      addTiles() %>%
      addCircleMarkers(color = md_cities$col , popup=adress, radius = sqrt(md_cities$pourcentage) * 200) %>%
      addLegend(labels = c(">500K", "300K<...<500K", "<300K"), colors = c("red", "blue", "green"), title = "Population of 10 bigger french towns")
    
  })
  
})
