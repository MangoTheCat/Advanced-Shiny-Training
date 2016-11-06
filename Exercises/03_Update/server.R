#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 3 - Update
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  selectedData <- reactive({
    
    switch(input$data, 
           "Iris" = iris,
           "Airquality" = airquality,
           "Mtcars" = mtcars)
    
    })
  
  output$twoColumnPlot <- renderPlot({
    
    input$update
    
    data <- isolate(selectedData())
    
    qplot(x = data[,1], y = data[,2])
    
  })
  
  output$dataSummary <- renderTable({
    
    data <- selectedData()
    
    tidy(summary(data[,2]))
    
  })
  
}
