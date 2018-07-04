
suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))

shinyUI(fluidPage( titlePanel("Coursera Data Science Capstone"), 
                   
                   theme = shinytheme("flatly"),
                   #theme = shinytheme("cerulean"),
                   ############################### ~~~~~~~~1~~~~~~~~ ##############################  
                   ## Tab 1 - Prediction
                   
                 
                   
                   mainPanel(
                     
                    ## HTML('<style type="text/css">
                    ##.span8 .well { background-color: #00FFFF; }
                     ##</style>'), 
                     tags$b("Next Word Prediction"),
                    
                            
                            tags$head("Parker's Prediction GUI"),
                            
                            fluidRow(
                              
                              column(1),
                              column(10,
                                     tags$div(textInput("text", 
                                                        label = h3("Enter your text here:"),
                                                        value =""),
                                              tags$span(style="color:red",("Only English words are supported.")),
                                              br(),
                                              tags$hr(),
                                              h3("The predicted next word:"),
                                              ##tags$em(tags$h4(textOutput("predictedWord"))),
                                              tags$span(style="color:green",
                                                        tags$strong(tags$h3(textOutput("predictedWord")))),
                                              br(),
                                              tags$hr(),
                                              h4("What you have entered:"),
                                              tags$em(tags$h4(textOutput("enteredWords"))),
                                              align="center")
                              ),
                              column(1)
                            )
                   ),
                   
                   ############################### ~~~~~~~~2~~~~~~~~ ##############################
                   ## Tab 2 - About 
                   
                   ##tabPanel("About This Application",
                   ##          fluidRow(
                   ##            column(2,
                   ##                   p("")),
                   ##            column(8,
                   ##                  p("Capstone Project")),
                   ##            column(2,
                   ##                   p(""))
                   ##          )
                   ## ),
                   
                   ############################### ~~~~~~~~F~~~~~~~~ ##############################
                   
                   ## Footer
                   
                   tags$hr(),
                   
                   tags$br(),
                   
                   tags$span(style="color:red", 
                             tags$footer(("Completed in 2018 - 07"), 
                                         
                                         tags$br(),
                                         ("Built By Parker Huang"),
                    
                                         ("&"), tags$a(
                                           href="https://github.com/ParkerHuang860918/R-Data-Science-Capstone-for-Cousera",
                                           target="_blank",
                                           "Full Code"),
                                         
                                         align = "center"),
                             
                             tags$br()
                   )
)
)