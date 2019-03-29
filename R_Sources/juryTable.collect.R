
fProc.juryTable <- function(siteUrls){
  
  # Jury table er ekki til fyrr en eftir 2016
  # hér væri meira róbúst að henda út nöfnum sem eru ekki á þeim lista
  known.events <- c('lisbon-2018', 'kyiv-2017', 'stockholm-2016')
  permittedEvents <- dplyr::intersect(eventUrls, known.events)
  ejectedEvents <- dplyr::setdiff(eventUrls, permittedEvents)
  
  if(length(ejectedEvents)>0){
    message('Ýtti út nokkrum eventUrls: ', paste(ejectedEvents, collapse = ', '))
  }
  
  if(length(permittedEvents)==0){
    stop('Fann enga eventUrl sem búið er að tryggja að detail voting sé til um.\n',
         'Hér gæti þurft að bæta viðkomandi event-id inn í:\n',
         'fProc.votingDetails')
  }
  ## #################################################################
  ##  Úrvinnsla
  ## hér er líka gert ráð fyrir að það séu eingöngu tvær forkeppnir:
  urlBase <- str_c(urlHome, urlSite, sep = '/') %>%
    sapply(str_c,urlEvent, sep = '/') %>%
    str_c('voting-details', sep = '/')

  #sæki lista yfir lönd í hverri yfirsíðu
  countrySelectors <- lapply(urlBase, fGet.countrySelector)
  names(countrySelectors) <- urlBase
  
  all.urls.list <- list()
  for(i in seq(urlBase)){
    all.urls.list[[urlBase[i]]] <- str_c(urlBase[i], countrySelectors[[urlBase[i]]], sep = '/')
  }
  # þetta er langur listi af url (um 100 fyrir nýrri keppnirnar)

  all.urls <- unlist(all.urls.list, use.names=FALSE)
  # laga einn galla í listanum
  all.urls <- str_replace_all(all.urls, 'north-macedonia', 'fyr-macedonia')

  # sæki gögnin fyrir dómara í keppninni.. þetta tekur langan tíma
  all.juries.list <- lapply(
    all.urls, 
    juryTable.scrape                # <- hér er scraper fallið
  )
  
  names(all.juries.list) <- all.urls
  # renni þessu í einn lista
  d <- do.call(rbind, all.juries.list)
  
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')
  
  d.ret <- d %>% as_tibble()
  class(d.ret) <- c(class(d.ret), 'eurovision.juryTable.raw')
  
  return(d.ret)
  
}
