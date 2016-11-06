#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 5 - Update Inputs
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
library(tidyverse)
theme_set(theme_bw(base_size = 16))

function(input, output, session){
  
  selectedData <- reactive({
    
    validate(need(!is.null(input$data), "Please upload a csv to continue"))
    
    file <- input$data$datapath
    
    data <- read_csv(file)
    
    updateSelectInput(session, "xaxis", choices = names(data))
    updateSelectInput(session, "yaxis", choices = names(data))
    
    data
    
    })
  
  output$twoColumnPlot <- renderPlot({
    
    data <- selectedData()
    
    ggplot(aes_string(x = input$xaxis, y = input$yaxis), data = data) + 
      geom_point()
    
  })
  
  output$dataSummary <- renderTable({
    
    data <- selectedData() %>% as.data.frame()
    
    tidy(summary(data[,input$yaxis]))
    
  })
  
}
