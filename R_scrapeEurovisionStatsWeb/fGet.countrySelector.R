# gets the content of the country-selector 
# urlWithoutName <- 'https://eurovision.tv/event/stockholm-2016/grand-final/voting-details'

fGet.countrySelector <- function(urlWithoutName){
  n1 <- NA
  
  try(
    n1 <- urlWithoutName %>%
      read_html() %>%
      html_node(
        xpath = '//*[@id="choose-voter"]' 
      ) %>%
      html_text())
  
  n2 <- n1 %>% 
    str_replace('Choose...', '') %>%
    str_replace_all(' & ', ' ') %>%
    str_replace_all(' ', '-')
  
  n3 <- unlist(strsplit(n2, "(?<=[a-z])(?=[A-Z])", perl = TRUE))
  
  the.Names <- tolower(n3)
  
  return(the.Names)
}