library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Next Word Prediction App",windowTitle = "Next Word App"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  
  sidebarLayout(

    sidebarPanel(
      strong("strong() makes bold text."),
      textInput("text","Your Text:"),
      submitButton("Update View")
    ),
    
    # Show a summary of the dataset and an HTML table with the 
	 # requested number of observations
    mainPanel(
      verbatimTextOutput("text"),
      tableOutput("table")
    )
  )
))