packages<-c("tm","stringdist", "stringr", "data.table")
sapply(packages, require, character.only = TRUE)

predictWord <- function(text)
{
  
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
    matches <- matches[order(matches$prob,decreasing = TRUE),]
    matches
    as.character( matches[1,c("last")])
    
  }
}