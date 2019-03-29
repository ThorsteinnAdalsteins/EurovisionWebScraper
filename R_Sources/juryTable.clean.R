
juryTable.clean <- function(juryTable.raw){
  d1 <- d %>% 
    as_tibble() %>%
    mutate(
      path = path %>% str_replace('https://eurovision.tv/event/', '')
    ) %>% 
    separate(
      col = path, 
      into = c('competition_id', 'event', 'page', 'jury_country'), 
      sep = '/'
    )
  
  d2 <- d1 %>% mutate(
    city_year = competition_id
  ) %>% 
    separate(
      col = city_year,
      into = c('host_city', 'year'),
      sep = '-'
    )
  
  d.ret <- d2 %>% select(year, host_city, event, jury_country, 
                         Member, Name, Gender, Date_of_birth = Date.of.birth, 
                         Profession, competition_id, page)
  class(d.ret) <- c(class(d.ret), 'eurovision.juryList.clean')
  
  return(d.ret)
}