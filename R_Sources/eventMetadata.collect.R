eventMetadata.collect <- function(siteUrls){
  # sæki upplýsingar um síður og smíða lista
  urlHome <- 'https://eurovision.tv/event'
  
  metaPages <- paste(urlHome, siteUrls, sep = '/')
  names(metaPages) <- metaPages
  
  # sæki gögnin í lista
  list.metaPages <- lapply(
    metaPages, 
    eventMetadata.scrape
  )
  
  # bind saman og skrifa út í skjal
  d <- do.call(rbind, list.metaPages)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')
  
  d.out <- d %>% as_tibble()
  class(d.out) <- c(class(d.out), 'eurovision.eventMetadata.raw')
  
  return(d.out)
}
