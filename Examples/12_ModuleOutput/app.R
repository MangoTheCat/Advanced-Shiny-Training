#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 11 - Module Input
#------------------------------------------------------------------------------#
library(shiny)
library(mangoTraining)
library(tidyverse)
library(broom)
source("summaryByTime.R")

ui <- fluidPage(
  
  textOutput("WhichTime"),
  
  tabsetPanel(
    tabPanel("All Data", summaryByTimeUI("allData")),
    tabPanel("Dose 25", summaryByTimeUI("25")),
    tabPanel("Dose 50", summaryByTimeUI("50")),
    tabPanel("Dose 100", summaryByTimeUI("100"))
    )
  
  
)

server <- function(input, output, session){
  
  time <- callModule(summaryByTime, "allData", pkData)
  callModule(summaryByTime, "25", filter(pkData, Dose == 25))
  callModule(summaryByTime, "50", filter(pkData, Dose == 50))
  callModule(summaryByTime, "100", filter(pkData, Dose == 100))
  
  output$WhichTime <- renderText({paste("Selected time is:", time())})
}

shinyApp(ui, server)