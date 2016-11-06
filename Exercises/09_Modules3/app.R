#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 9 - Modules
#------------------------------------------------------------------------------#
library(shiny)
library(mangoTraining)
source("columnByMonth.R")

ui <- fluidPage(
  
  tabsetPanel(
    
    tabPanel("All Data", columnByMonthUI("allData")),
    tabPanel("Bakerloo", columnByMonthUI("Bakerloo")),
    tabPanel("Central", columnByMonthUI("Central")),
    tabPanel("Circle & Hammersmith", columnByMonthUI("CircleHam")),
    tabPanel("District", columnByMonthUI("District")),
    tabPanel("Jubilee", columnByMonthUI("Jubilee")),
    tabPanel("Metropolitan", columnByMonthUI("Metropolitan")),
    tabPanel("Northern", columnByMonthUI("Northern")),
    tabPanel("Piccadilly", columnByMonthUI("Piccadilly")),
    tabPanel("Victoria", columnByMonthUI("Victoria")),
    tabPanel("Waterloo & City", columnByMonthUI("Waterloo"))
    
    )
  
  )


server <- function(input, output, session){
 
  callModule(columnByMonth, "allData", data = tubeData)
  callModule(columnByMonth, "Bakerloo", data = filter(tubeData, Line == "Bakerloo"))
  callModule(columnByMonth, "Central", data = filter(tubeData, Line == "Central"))
  callModule(columnByMonth, "CircleHam", data = filter(tubeData, Line == "Circle & Ham"))
  callModule(columnByMonth, "District", data = filter(tubeData, Line == "District"))
  callModule(columnByMonth, "Jubilee", data = filter(tubeData, Line == "Jubilee"))
  callModule(columnByMonth, "Metropolitan", data = filter(tubeData, Line == "Metropolitan"))
  callModule(columnByMonth, "Northern", data = filter(tubeData, Line == "Northern"))
  callModule(columnByMonth, "Piccadilly", data = filter(tubeData, Line == "Piccadilly"))
  callModule(columnByMonth, "Victoria", data = filter(tubeData, Line == "Victoria"))
  callModule(columnByMonth, "Waterloo", data = filter(tubeData, Line == "Waterloo & City"))
  
}

shinyApp(ui, server)