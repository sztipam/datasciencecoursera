# remember that shiny ui has to be named ui.R before runApp() can work
library(shiny)
shinyUI(fluidPage(
  titlePanel("Random Normal"),
  sidebarLayout(
    sidebarPanel(
      h1("Enter a value:"),
      numericInput("value", "Enter a number between 1 and a 1000:",
                   value = 500, min = 1, max = 1000, step=1)
    ),
    mainPanel(
      h3("Random Normal:"),
      textOutput("text")
    )
  )
))
