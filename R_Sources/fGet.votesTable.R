fGet.votesTable <- function(url){
  # url <- all.urls[1]
  the.table <- NA
  
  try(
    n1 <- url %>%
      read_html() %>%
      html_node(
        xpath = '//*[@id="frame-content"]/span/div[3]/div/div/div/div[2]/div/div/div/ul'
      ) %>%
      html_text()
  )
  
  n2 <- n1 %>% str_split("(?<=[a-z])(?=[0-9])")
  
  the.table <- tibble(
    pts = str_extract(n2[[1]], '[:digit:]+'),
    country = str_replace(n2[[1]], '[:digit:]+.pts', '')
  )
  
  return(the.table)
}
