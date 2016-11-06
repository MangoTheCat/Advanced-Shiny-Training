#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 1 - Basic Reactivity
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  sliderInput("nSims", "Number of Simulations:", 
                              min = 100, max = 1000, value = 500),
                  selectInput("col", "Histogram Colour:", 
                              choices = colors(), selected = "black")
                  )),
  
  fluidRow(column(width = 7, 
                  plotOutput("simHist")
                  ),
           column(width = 7, 
                  tableOutput("dataSummary")
                  ))
))