#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 7 - Update
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))

function(input, output, session){
  
  observeEvent(input$reset, {
    updateSelectInput(session, "col", selected = "black")
    updateSliderInput(session, "nSims", value = 500)
    })
  
  data <- reactive({
  
    rnorm(input$nSims)  
    
  })
  
  output$simHist <- renderPlot({
    
    x <- data()
    qplot(x, bins = 20, fill = I(input$col))
    
  })
  
  output$dataSummary <- renderTable({
    
    x <- data()
    tidy(summary(x))
    
  })
  
}
