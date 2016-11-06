#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 8 - Modules
#------------------------------------------------------------------------------#
library(shiny)
library(mangoTraining)
source("columnByMonth.R")

ui <- fluidPage(
  
  columnByMonthUI("allData")
  
  )


server <- function(input, output, session){
 
  callModule(columnByMonth, "allData")
  
}

shinyApp(ui, server)