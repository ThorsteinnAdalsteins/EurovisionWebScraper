eventVotes.scrape<- function(url){
  message(url)
  tryCatch(
    {
      page <- url %>% read_html()
      
      n1 <- page %>%
        html_node(
          xpath = '//*[@id="frame-content"]/span/div[3]/div/div/div/div[2]/div/div/div/ul'
        ) %>%
        html_text()
      
      n2 <- n1 %>% str_split("(?<=[a-z])(?=[0-9])")
      
      the.table <- tibble(
        pts = str_extract(n2[[1]], '[:digit:]+'),
        country = str_replace(n2[[1]], '[:digit:]+.pts', '')
      )
      
      return(the.table)
      
    },
    error = function(cond) {
      message(paste("URL does not seem to exist:", url))
      message("Here's the original error message:")
      message(cond)
      return(NA)
    }
    )
  
}
