#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 2 - Basic Reactivity
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  selectInput("data", "Choose Data", 
                              choices = c("Iris", "Airquality", "Mtcars"))
  )),
  
  fluidRow(column(width = 6, 
                  plotOutput("twoColumnPlot")
  ),
  column(width = 6, 
         tableOutput("dataSummary")
  ))
))