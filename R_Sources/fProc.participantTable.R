
fProc.participantTable <- function(siteUrls){
  
  urlHome <- 'https://eurovision.tv/event'
  
  grandFinalParticipants <- paste(urlHome, urlSite, sep = '/') %>% 
    sapply(str_c, siteUrls, sep = '/') %>%
    str_c('participants', sep = '/')
  names(grandFinalParticipants) <- grandFinalParticipants
  
  # sæki gögnin í lista
  list.grandFinalParticipants <- lapply(
    grandFinalParticipants, 
    fGet.participantsTable
  )
  
  # bind saman og skrifa út í ramma
  d <- do.call(rbind, list.grandFinalParticipants)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')
  names(d) <- NULL
  
  return(d%>%as_tibble())
}


