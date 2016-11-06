#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 9 - Reactive File Reader
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(

  fluidRow(column(width = 6, 
                  plotOutput("simHist")
                  ),
           column(width = 6, 
                  tableOutput("dataSummary")
                  ))
))