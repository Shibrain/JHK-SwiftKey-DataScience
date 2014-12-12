library(shiny)
library(datasets)
source("predictionFunction.R")
# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  

  datasetInput <- reactive({
    
  })
  
  # Generate a summary of the dataset
  output$text <- renderText({
    if(input$text != "")
      {paste(input$text,predictWord(input$text))}
    else
      input$text
    
  })
  

  
})