#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 9 - Modules
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



columnByMonth <- function(input, output, session, data){

  output$tubePlot <- renderPlot(
    
    ggplot(aes_string("Month", input$column), data = data) + 
      geom_point()
    
  )   
  
}
