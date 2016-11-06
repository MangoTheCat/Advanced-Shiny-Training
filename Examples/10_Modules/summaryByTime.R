#------------------------------------------------------------------------------#
# UI
#------------------------------------------------------------------------------#
summaryByTimeUI <- function(id){
  
  ns <- NS(id)
  
  tagList(
    
    plotOutput(ns("timeConcPlot")),
    selectInput(ns("time"), "Select time:", choices = c(0, 1, 6, 12, 24)),
    tableOutput(ns("summary"))
    
    )
  
}

#------------------------------------------------------------------------------#
# Server
#------------------------------------------------------------------------------#
summaryByTime <- function(input, output, session){

  data  <- pkData
  
  output$timeConcPlot <- renderPlot({
    
    qplot(Time, Conc, data = data, group = Subject, geom = "line") +
      geom_vline(xintercept = as.numeric(input$time), col = "red", size = 2)
    
    })  
  
  output$summary <- renderTable({
    
    x <- data[data$Time == as.numeric(input$time), "Conc"]
    tidy(summary(x))
    
    })
  
}
