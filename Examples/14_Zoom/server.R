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
  
  limits <- reactiveValues(x = NULL, y = NULL)
  
  output$pkPoints <- renderPlot({
    
    qplot(Weight, Height, data = demoData)  + 
      coord_cartesian(limits$x, limits$y)
    
  })
  
  output$selectedData <- renderTable({
    
    brushedPoints(demoData, input$brushPK, 
                  xvar = "Weight", yvar = "Height")
    
    
  })
  
  observeEvent(input$clickPK, {
    brush <- input$brushPK
    if (!is.null(brush)) {
      limits$x <- c(brush$xmin, brush$xmax)
      limits$y <- c(brush$ymin, brush$ymax)
      
    } else {
      limits$x <- NULL
      limits$y <- NULL
    }
  })
  
}
