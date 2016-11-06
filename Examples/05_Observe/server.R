#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 5 - Observe Event
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  reactData <- reactiveValues(data = rnorm(100))
  
  observeEvent(input$norm, {
    reactData$data <- rnorm(input$nSims)
    })
  
  observeEvent(input$unif, {
    reactData$data <- runif(input$nSims)
  })
  
  output$simHist <- renderPlot({
    
    x <- reactData$data
    qplot(x, bins = 20, fill = I(input$col))
    
  })
  
  output$dataSummary <- renderTable({
    
    x <- reactData$data
    tidy(summary(x))
    
  })
  
}
