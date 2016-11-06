#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 3 - Isolate
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  sliderInput("nSims", "Number of Simulations:", 
                              min = 100, max = 1000, value = 500),
                  actionButton("run", "Run Summary"),
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