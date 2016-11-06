#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 7 - Modules
#------------------------------------------------------------------------------#
library(shiny)
library(mangoTraining)

ui <- fluidPage(
  

  
  )


server <- function(input, output){
 
  output$tubePlot <- renderPlot(
    
    ggplot(aes_string("Month", input$column), data = tubeData) + 
      geom_point()
    
    ) 
  
}

shinyApp(ui, server)