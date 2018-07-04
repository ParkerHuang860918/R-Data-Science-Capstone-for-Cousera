data_cleaner<-function(text){
  
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  
  return(cleanText)
}

clean_input <- function(text){
  library(stylo)
  textInput <- data_cleaner(text)
  textInput <- txt.to.words.ext(textInput, language="English.all", preserve.case = TRUE)
  
  return(textInput)
}




nextWordPrediction <- function(textInput){
  
  wordcount <- length(textInput)
  
  if (wordcount>=3) { textInput <- textInput[(wordcount-2):wordcount] 
   
    word_prediction <- as.character(quadgram_1[quadgram_1$unigram==textInput[1] & 
                                                 quadgram_1$bigram==textInput[2] & 
                                                 quadgram_1$trigram==textInput[3],][1,]$quadgram)
    #return(word_prediction)
  }
  
  else if(wordcount==2) {
    textInput <- c(textInput, NA) 
    word_prediction <- as.character(trigram_1[trigram_1$unigram==textInput[1] & 
                                                trigram_1$bigram==textInput[2],][1,]$trigram)
    #return(word_prediction)
  }
  
  else {
    textInput <- c(textInput, NA, NA)
    word_prediction <- as.character(bigram_1[bigram_1$unigram==textInput[1],][1,]$bigram)
    #return(word_prediction)
  }
  
  
  print(word_prediction)
  
}