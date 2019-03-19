fProc.eventMetadata <- function(urls){
  
  # sæki upplýsingar um síður og smíða lista
  urlHome <- 'https://eurovision.tv/event'
  
  metaPages <- paste(urlHome, urlSite, sep = '/')
  names(metaPages) <- metaPages
  
  # sæki gögnin í lista
  list.metaPages <- lapply(
    metaPages, 
    fGet.eventMetadata
  )
  
  # skoða ef það komu gallar upp
  data.found <- lapply(list.metaPages, function(x) typeof(x) != 'logical') %>%
    unlist(use.names = FALSE)
  all.urls[!data.found]
  
  # bind saman og skrifa út í skjal
  d <- do.call(rbind, list.metaPages)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')
  names(d) <- NULL
  
  return(d%>%as_tibble())
}

# siteUrls <- c('helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004')
# this.data <- fProc.eventMetadata(siteUrls)
# write.csv2(this.data, './_GognUt/Event_Metadata 2004-2007.csv', row.names = FALSE)
