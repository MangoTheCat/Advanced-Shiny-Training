#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 4 - Event Reactive
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  selectInput("data", "Choose Data", 
                              choices = c("Iris", "Airquality", "Mtcars"))
  ),
  column(width = 3, 
         actionButton("update", "Update!")
         )
  ),
  
  fluidRow(column(width = 6, 
                  plotOutput("twoColumnPlot")
  ),
  column(width = 6, 
         tableOutput("dataSummary")
  ))
))