#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 3 - Isolate
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  data <- reactive({
    
    rnorm(input$nSims)
    
  })
  
  output$simHist <- renderPlot({
    
    x <- data()
    qplot(x, bins = 20, fill = I(input$col))
    
  })
  
  output$dataSummary <- renderTable({
    
    input$run
    x <- isolate(data())
    tidy(summary(x))
    
  })
  
}
