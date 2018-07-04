suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny),
  library(tm),
  library(stringr),
  library(markdown),
  library(stylo)))

#setwd("C:/Users/hyh/Desktop/Coursera/R/Capstone Project/final/Parker_Final_Capstone_Data_Science")

setwd("~/R/Capstone")

source("./predictfunction.R")


quadgram_1 <- readRDS(file="./quadgram_final.txt")
trigram_1 <- readRDS(file="./trigram_final.txt")
bigram_1 <- readRDS(file="./bigram_final.txt")

shinyServer(function(input, output) {
  
  wordPrediction <- reactive({
    text <- input$text
    textInput <- clean_input(text)
    #wordCount <- length(textInput)
    wordPrediction <- nextWordPrediction(textInput)})
  
  output$predictedWord <- renderPrint({wordPrediction()})
  #output$predictedWord <- renderText({wordPrediction()})
  output$enteredWords <- renderText({input$text}, quoted = FALSE)
})
