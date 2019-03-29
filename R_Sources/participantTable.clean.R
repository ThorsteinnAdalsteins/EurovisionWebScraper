participantTable.clean <- function(participantTable.raw){
  if('eurovision.participantTable.raw' %in% class(participantTable.raw) == FALSE){
    stop('Taflan sem send var inn er ekki af réttri tegund')
  }
  
  d <- f.splitPath(participantTable.raw)
  
  d.out <- d %>% 
    mutate(Artist = Artist %>% str_replace('qualified', '')) %>%
    select(year, host_city, event,
           order_of_appearance =  `R/O`,
           contributing_country = Country,
           artist = Artist,
           song_title = song,
           pts = PtsPoints,
           rank = RankRanking,
           competition_id,
           page)
  
  class(d.out) <- c(class(d.out), 'eurovision.participantTable.clean')
  return(d.out)
}