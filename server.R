library(shiny)
library(datasets)
source("predictionFunction.R")
text2 <- ""
# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  

  Change <- function(text,text2)
  {
    text2 <- text
  }
  
  # Generate a summary of the dataset
  output$text <- renderText({

    if(input$text != "")
    {
     
      paste(input$text,predictWord(CleanText(input$text)))
    }
    else
      input$text
    
  })


  
})