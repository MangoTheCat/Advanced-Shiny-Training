#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 8 - Scheduling
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  data <- reactive({
  
    invalidateLater(2000)
    rnorm(500)  
    
  })
  
  output$simHist <- renderPlot({
    
    x <- data()
    qplot(x, bins = 20)
    
  })
  
  output$dataSummary <- renderTable({
    
    x <- data()
    tidy(summary(x))
    
  })
  
}
