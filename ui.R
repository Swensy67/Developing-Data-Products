library(shiny)
library(leaflet)

shinyUI(fluidPage(

  titlePanel("March 15, 2018"),

    # Show a plot of the generated distribution
    mainPanel(
      leafletOutput("distPlot")
    )
  )
)
