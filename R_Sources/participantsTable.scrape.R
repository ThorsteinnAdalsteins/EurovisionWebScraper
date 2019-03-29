participantTable.scrape <- function(url){
  message(url)
  tryCatch(
    {
      page <- url %>% read_html()
      the.table <- page %>%
        html_node(
          xpath = '//*[@id="frame-content"]/span/div[3]/div/div/div/table'
          ) %>%
        html_table()
  
  return(the.table)},
  error = function(cond) {
    message(paste("URL does not seem to exist:", url))
    message("Here's the original error message:")
    message(cond)
    return(NA)}
  )
}
