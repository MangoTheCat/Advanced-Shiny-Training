#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 3 - Update
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