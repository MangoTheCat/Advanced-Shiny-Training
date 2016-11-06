#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Exercise 6 - Time
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
library(tidyverse)
library(lubridate)
theme_set(theme_bw(base_size = 16))

function(input, output, session){
  
  output$time <- renderPrint({
    
    invalidateLater(1000)
    
    now()
    
    })
  
  
}
