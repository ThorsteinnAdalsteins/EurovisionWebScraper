
eventVotes.clean <- function(eventVotes.raw){
  if('eurovision.eventVotes.raw' %in% class(eventVotes.raw) == FALSE){
    stop('Fallið er aðeins byggt til þess að hreinsa eventVotes ramma')
  }
  
  d2 <- f.splitPath(eventVotes.raw)
  
  ret.d <- d2 %>% 
    select(
      year, 
      host_city, 
      event, 
      awarding_country = path_country, 
      pts, 
      receiving_country = country,
      competition_id, page
    )
  
  class(ret.d) <- c(class(ret.d), 'eurovision.eventVotes.clean')
  
  return(ret.d)
}

