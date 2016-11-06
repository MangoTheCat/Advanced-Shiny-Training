#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 10 - Modules
#------------------------------------------------------------------------------#
library(shiny)
library(mangoTraining)
library(ggplot2)
library(broom)
source("summaryByTime.R")

ui <- fluidPage(
  
  summaryByTimeUI("allData")
  
)

server <- function(input, output, session){
  
  callModule(summaryByTime, "allData")  
  
}

shinyApp(ui, server)