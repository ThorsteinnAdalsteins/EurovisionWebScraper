f.splitPath <- function(df){
  
  d1 <- df %>%
    mutate(
      path = path %>% str_replace('https://eurovision.tv/event/', '')
    ) %>%
    separate(
      col = path,
      into = c('competition_id', 'event', 'page', 'path_country'), 
      sep = '/', 
      fill = 'right') 
  
  d2 <- d1 %>% 
    mutate(
      city_year = competition_id
    ) %>%
    separate(
      col = city_year, 
      into = c('host_city', 'year'), 
      sep = '-'
    )
  
  return(d2)
}
  