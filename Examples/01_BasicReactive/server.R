#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 1 - Basic Reactivity
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  output$simHist <- renderPlot({
    
    x <- rnorm(input$nSims)
    qplot(x, bins = 20, fill = I(input$col))
    
    })
  
  output$dataSummary <- renderTable({
    
    x <- rnorm(input$nSims)
    tidy(summary(x))
    
    })
  
}
