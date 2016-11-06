#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 1 - Basic Reactivity
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  output$twoColumnPlot <- renderPlot({
    
    data <- switch(input$data, 
                   "Iris" = iris,
                   "Airquality" = airquality,
                   "Mtcars" = mtcars)
    
    qplot(x = data[,1], y = data[,2])
    
  })
  
  output$dataSummary <- renderTable({
    
    data <- switch(input$data, 
                   "Iris" = iris,
                   "Airquality" = airquality,
                   "Mtcars" = mtcars)
    
    tidy(summary(data[,2]))
    
  })
  
}
