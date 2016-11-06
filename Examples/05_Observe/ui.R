#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 5 - Observe Event
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  sliderInput("nSims", "Number of Simulations:", 
                              min = 100, max = 1000, value = 500),
                  actionButton("norm", "Simulate Normal"),
                  actionButton("unif", "Simulate Uniform"),
                  selectInput("col", "Histogram Colour:", 
                              choices = colors(), selected = "black")
                  )),
  
  fluidRow(column(width = 6, 
                  plotOutput("simHist")
                  ),
           column(width = 6, 
                  tableOutput("dataSummary")
                  ))
))