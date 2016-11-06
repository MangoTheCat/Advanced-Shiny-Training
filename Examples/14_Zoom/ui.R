#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 13 - Interactive Graphics
#------------------------------------------------------------------------------#
library(shiny)

shinyUI(fluidPage(
  
  fluidRow(column(width = 7, 
                  plotOutput("pkPoints", brush = "brushPK", dblclick = "clickPK")
                  ),
           column(width = 7, 
                  tableOutput("selectedData")
                  ))
))