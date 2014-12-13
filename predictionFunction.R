library(stringr)
library(stringdist)

CleanText <- function(text)
{
  text <- gsub('[ ]{2,}',' ',text)
  text <- gsub('(^ )|( $)','',text)
  return(tolower(text))
}

predictWord <- function(text)
{
  load('.RData')
  text <- str_extract(text,'(\\S+[ ]*){1,2}\\S+$')
  matches <- rNGram[grep(text,rNGram$first,fixed = TRUE),]
  if(nrow(matches) ==1)
  {
    return(as.character( matches[1,c("last")]))
  }
  if(nrow(matches) >1)
  {
    matches$dis <- stringdist("let us try",matches$first,method = 'lv',useBytes = TRUE) * stringdist("let us try",matches$first,method = 'jw',useBytes = TRUE)
    matches <- matches[matches$dis == min(matches$dis),]
    matches <- matches[order(matches$prob,decreasing = TRUE),]
    return(as.character( matches[1,c("last")]))
  }
  
  if(nrow(matches) < 1)
  {
    matches <- rNGram[agrep(text,rNGram$first, .5),]
    matches$dis <-  stringdist("let us try",matches$first,method = 'lv',useBytes = TRUE) * stringdist("let us try",matches$first,method = 'jw',useBytes = TRUE)
    matches <- matches[matches$dis < median(matches$dis),]
    matches$dis <- (1/matches$dis) * matches$prob
    matches <- matches[order(matches$dis,decreasing = TRUE),]
    matches
    return(as.character( matches[1,c("last")]))
    
  }
  
  return(as.character(""))
}