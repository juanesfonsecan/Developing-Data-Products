
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
#Control the user interface
shinyUI(fluidPage(

  # Application title
  titlePanel("Predict break distance in cars from speed"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderspeed",
                  "What is the speed of the car:",
                  min = 0,
                  max = max(cars$speed),
                  value = 10)
    
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted distance from linear regression"),
      textOutput("pred1")
    )
  )
))
