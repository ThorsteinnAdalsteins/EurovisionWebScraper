
eventMetadata.clean <- function(eventMetadata.raw){
  if('eurovision.eventMetadata.raw' %in% class(eventMetadata.raw) == FALSE){
    stop('Fallið er aðeins byggt til þess að hreinsa eventVotes ramma')
  }
  
  d <- f.splitPath(eventMetadata.raw)
  d.out <- d %>% 
    select(year, host_city, competition_id, tag, value) %>%
    mutate(tag = tag %>% 
             trimws() %>%
             tolower() %>% 
             str_replace_all('\\s+', '_') %>% 
             str_replace_all('-', '_')) %>%
    mutate(tag = tag %>% str_replace('^semi_final', 'first_semi_final'))
  
  d.out <- d.out %>% spread(key = tag, value = value)
  
  return(d.out)
}