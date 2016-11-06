#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 9 - Reactive File Reader
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
library(readr)
theme_set(theme_bw(base_size = 16))

function(input, output, session){
  
  data <- reactiveFileReader(5000,
                             session, 
                             "data.csv",
                             read_csv)
  
  output$simHist <- renderPlot({
    
    x <- data()
    qplot(X, Y, data = x, geom = "line")
    
  })
  
  output$dataSummary <- renderTable({
    
    x <- data()
    tidy(summary(x$Y))
    
  })
  
}
