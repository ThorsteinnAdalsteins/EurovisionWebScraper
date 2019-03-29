
eventVotes.clean <- function(eventVotes.raw){
  if('eurovision.eventVotes.raw' %in% class(eventVotes.raw) == FALSE){
    stop('Fallið er aðeins byggt til þess að hreinsa eventVotes ramma')
  }
  
  d1 <- eventVotes.raw %>% 
    as_tibble() %>%
    mutate(
      path = path %>% str_replace('https://eurovision.tv/event/', '')
    ) %>%
    separate(
      col = path,
      into = c('competition_id', 'event', 'page', 'awarding_country'), 
      sep = '/') 
  
  d2 <- d1 %>% 
    mutate(
      city_year = competition_id
    ) %>%
    separate(
      col = city_year, 
      into = c('host_city', 'year'), 
      sep = '-'
    )
  
  ret.d <- d2 %>% 
    select(
      year, 
      host_city, 
      event, 
      awarding_country, 
      pts, 
      receiving_country = country,
      competition_id, page
    )
  
  class(ret.d) <- c(class(ret.d), 'eurovision.eventVotes.clean')
  
  return(ret.d)
}