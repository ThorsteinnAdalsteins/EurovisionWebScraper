
eventMetadata.scrape <- function(url){
  message(url)
  tryCatch(
    {
      page <- url %>% read_html()
      
      s1<- page %>%
        html_node(
          xpath = '//*[@id="frame-content"]/span/div[3]/div[1]/div/div/div[2]/div[2]'
        ) %>%
        html_nodes('dt') %>%
        html_text()
      
      s2<- page %>%
        html_node(
          xpath = '//*[@id="frame-content"]/span/div[3]/div[1]/div/div/div[2]/div[2]'
        ) %>%
        html_nodes('dd') %>%
        html_text()
      
      t.out <- tibble(tag = s1, 
                     value = s2)
      
      return(t.out)
      
    },
    error = function(cond) {
      message(paste("URL does not seem to exist:", url))
      message("Here's the original error message:")
      message(cond)
      return(NA)
    }
  )
}
