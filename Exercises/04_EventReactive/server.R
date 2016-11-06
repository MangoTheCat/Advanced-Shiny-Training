#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 4 - Event Reactive
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  selectedData <- eventReactive(input$update, {
    
    switch(input$data, 
           "Iris" = iris,
           "Airquality" = airquality,
           "Mtcars" = mtcars)
    
    })
  
  output$twoColumnPlot <- renderPlot({
    
    data <- selectedData()
    
    qplot(x = data[,1], y = data[,2])
    
  })
  
  output$dataSummary <- renderTable({
    
    data <- selectedData()
    
    tidy(summary(data[,2]))
    
  })
  
}
