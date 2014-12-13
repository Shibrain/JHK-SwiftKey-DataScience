library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Next Word Prediction App",windowTitle = "Next Word App"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  
  sidebarLayout(

    sidebarPanel(
      p("This App predicts the next word after a text you write"),
      p("Please write a text to get a prediction"),br(),
      p("For more info about the App visit:"),HTML("<a href='https://rpubs.com/Shibrain/JHK-SwiftKey-NextWordApp'>Visit this presentation</a>"), br(),
      
      strong("NOTE: The application cloud take few seconds to predict the word")
      
    ),
    
    # Show a summary of the dataset and an HTML table with the 
	 # requested number of observations
    mainPanel(
      textInput("text","Your Text:"),
      submitButton("Get Next Word"),
      br(),verbatimTextOutput("text")

      
    )
  )
))