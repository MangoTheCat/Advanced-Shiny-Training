#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 7 - Modules
#------------------------------------------------------------------------------#

columnByMonthUI <- function(id){
  
  ns <- NS(id)
  
  tagList(
    
    fluidRow(column(width = 3, 
                    selectInput(ns("column"), "Select Column:", 
                                choices = c("TOTAL", "Excess", "Scheduled")))),
    
    fluidRow(plotOutput(ns("tubePlot")))
    
    )
  
}

