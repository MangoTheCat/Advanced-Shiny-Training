#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 8 - Modules
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



columnByMonth <- function(input, output, session){

  output$tubePlot <- renderPlot(
    
    ggplot(aes_string("Month", input$column), data = tubeData) + 
      geom_point()
    
  )   
  
}
