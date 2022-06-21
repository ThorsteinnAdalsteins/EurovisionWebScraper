fProc.votingDetails <- function(eventUrls){
  message('Voting details')
  # eventUrls <- siteUrls
  known.events <- c('tel-aviv-2019', 'lisbon-2018', 'kyiv-2017', 'stockholm-2016')
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
  ## ################################################3
  ## Úrinnsla
  urlHome <- 'https://eurovision.tv/event'
  urlSite <- permittedEvents
  urlEvent <- c('first-semi-final', 'second-semi-final', 'grand-final')
  
  #smíða aðal listan fyrir hverja yfirsíðu
  urlBase <- str_c(urlHome, urlSite, sep = '/') %>%
    sapply(str_c,urlEvent, sep = '/') %>%
    str_c('results', sep = '/')
  
  #sæki lista yfir lönd í hverri yfirsíðu
  countrySelectors <- lapply(urlBase, fGet.countrySelector)
  names(countrySelectors) <- urlBase
  
  all.urls.list <- list()
  for(i in seq(urlBase)){
    all.urls.list[[urlBase[i]]] <- str_c(urlBase[i], countrySelectors[[urlBase[i]]], sep = '/')
  }
  
  all.urls <- unlist(all.urls.list, use.names=FALSE)
  # laga einn galla í listanum
  all.urls <- str_replace_all(all.urls, 'north-macedonia', 'fyr-macedonia')
  
  # sæki gögnin fyrir atkvæðagreiðslur í keppninni.. þetta tekur langan tíma
  all.votingDetails.list <- lapply(
    all.urls, 
    fGet.detailVotingTable
  )
  
  # skoða ef það vantaði vefsíður
  data.found <- lapply(all.votingDetails.list, function(x) typeof(x) != 'logical') %>%
    unlist(use.names = FALSE)
  message(all.urls[!data.found])
  
  # ef engir gallar eru, er óhætt að setja slóðina á listana
  names(all.votingDetails.list) <- all.urls
  
  # hér er galli þar sem Rússar (eða einhver annar) var ekki með sama fjölda dómenda og önnur lönd
  dimms <- lapply(all.votingDetails.list, dim)
  tester <- logical(length(names(all.votingDetails.list)))
  is <- c()
  for(i in seq(names(all.votingDetails.list))){
    tester[i] <- dimms[[i]][2]==10
    if(dimms[[i]][2]!=10){is <- c(is, i)}
  }
  if(!is.null(is)){
    all.votingDetails.list[[is]] <- all.votingDetails.list[[is]] %>% mutate(E = NA)
  }
  
  # renni þessu í einn lista
  d <- do.call(rbind, all.votingDetails.list)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')

  return(d%>% as_tibble())
}


# skrifa út niðurstöðuna
# the.data <- fProc.votingDetails()
# write.csv2(the.data, './_GognUt/VotingDetails 2016-2018.csv', row.names = FALSE)

