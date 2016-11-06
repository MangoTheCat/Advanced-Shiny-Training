#------------------------------------------------------------------------------#
# Mango Solutions 
# Advanced Shiny
# Example 16 - Bookmarking
#------------------------------------------------------------------------------#
library(shiny)
library(ggplot2)
library(broom)
theme_set(theme_bw(base_size = 16))


ui <- function(request){
  
  fluidPage(
    
    fluidRow(column(width = 3, 
                    sliderInput("nSims", "Number of Simulations:", 
                                min = 100, max = 1000, value = 500)),
             column(width = 3,
                    selectInput("col", "Histogram Colour:", 
                                choices = colors(), selected = "black")
    ),
        column(width = 3, bookmarkButton())
    ),
    
    fluidRow(column(width = 7, 
                    plotOutput("simHist")
    ),
    column(width = 7, 
           tableOutput("dataSummary")
    ))
  )
  
}



server <- function(input, output, session){
  
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


enableBookmarking(store = "url")
shinyApp(ui, server)