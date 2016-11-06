#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 5 - Update Inputs
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 3, 
                  fileInput("data", "Choose Data")
  ),
  column(width = 3,
         selectInput("xaxis", "Select X axis Column:", choices = NULL)
         ),
  column(width = 3,
         selectInput("yaxis", "Select Y axis Column:", choices = NULL)
  )
  ),
  
  fluidRow(column(width = 6, 
                  plotOutput("twoColumnPlot")
  ),
  column(width = 6, 
         tableOutput("dataSummary")
  ))
))