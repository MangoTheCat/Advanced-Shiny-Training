#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 8- Scheduling
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