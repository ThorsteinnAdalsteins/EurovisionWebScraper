
fProc.eventVotes <- function(siteUrls){
  
  urlHome <- 'https://eurovision.tv/event'
  
  # 
  #smíða aðal listan fyrir hverja yfirsíðu
  urlBase <- str_c(urlHome, siteUrls, sep = '/') 
  #sæki eventa sem tilheyra hverju siteUrl
  urlEvents <- lapply(siteUrls, f.knownEvents) 
  # bæti þessum eventum aftan á hvern urlBase
  urlBase2 <- lapply(urlEvents, function(x) sapply(urlBase, str_c, x, sep = '/'))
  # bæti scoreboard aftan á allt og breyti í character vector
  urlBase3 <- as.character(sapply(urlBase2, str_c, 'scoreboard', sep = '/'))
  
  
  #sæki lista yfir lönd í hverri yfirsíðu
  countrySelectors <- lapply(urlBase3, fGet.countrySelector)
  names(countrySelectors) <- urlBase3
  
  # bæti landinu aftan við hvern url lista
  all.urls.list <- list()
  for(i in seq(urlBase3)){
    all.urls.list[[urlBase3[i]]] <- str_c(urlBase3[i], countrySelectors[[urlBase3[i]]], sep = '/')
  }
  # þetta ætti að vera listi upp á 30-100 síður fyrir hverja keppni
  
  
  all.urls <- unlist(all.urls.list, use.names=FALSE)
  # laga einn galla í listanum
  all.urls <- str_replace_all(all.urls, 'north-macedonia', 'fyr-macedonia')
  
  # sæki gögnin...
  # þessi keyrsla tekur langan tíma ef mörg site eru sótt í einu
  all.votes.list <- lapply(
    all.urls, 
    fGet.votesTable
  )
  
  # skoða ef það komu gallar upp
  #data.found <- lapply(all.votes.list, function(x) typeof(x) != 'logical') %>%
  #  unlist(use.names = FALSE)
  # all.urls[!data.found]
  # ef engir gallar eru, er óhætt að setja slóðina á listana
  names(all.votes.list) <- all.urls
  
  # renni þessu í einn lista
  d <- do.call(rbind, all.votes.list)
  d$path <- str_replace(row.names(d), '\\.[:digit:]+', '')
  row.names(d) <- NULL
  
  return(d%>%as_tibble())
}

