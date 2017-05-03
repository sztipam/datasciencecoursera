# remember that shiny server has to be name server.R before runApp() can work
library(shiny)

shinyServer(function(input, output) {
  output$text <- renderText(rnorm(input$value))
})