#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 13 - Interactive Graphics
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
library(mangoTraining)
theme_set(theme_bw(base_size = 16))

function(input, output){
  
  output$pkPoints <- renderPlot({
    
    qplot(Weight, Height, data = demoData)
    
  })
  
  output$selectedData <- renderTable({
    
    brushedPoints(demoData, input$brushPK, 
                  xvar = "Weight", yvar = "Height")
    
    
  })
  
}
