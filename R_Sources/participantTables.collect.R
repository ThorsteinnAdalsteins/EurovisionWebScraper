participantTable.collect <- function(siteUrls){
  
  urlHome <- 'https://eurovision.tv/event'
  
  grandFinalParticipants <- list(length(siteUrls))
  for(i in seq(siteUrls)){
    grandFinalParticipants[[i]] <- paste(
      (urlHome), 
      siteUrls[i], 
      f.knownEvents(siteUrls[i]),
      'participants',  sep = '/')  
  }
  grandFinalParticipants <- unlist(grandFinalParticipants)
  names(grandFinalParticipants) <- grandFinalParticipants
  
  # sæki gögnin í lista
  list.grandFinalParticipants <- lapply(
    grandFinalParticipants, 
    participantTable.scrape         #<- hér er scraperinn
  )
  
  # bind saman og skrifa út í ramma
  d <- do.call(rbind, list.grandFinalParticipants)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')

  d.out <- d%>% as_tibble()
  class(d.out) <- c(class(d.out), 'eurovision.participantTable.raw')
  
  return(d.out)
}


