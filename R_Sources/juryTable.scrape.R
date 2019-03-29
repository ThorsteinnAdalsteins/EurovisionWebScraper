juryTable.collect <- function(siteUrl){
  
  tryCatch(
    {
      page <- url %>% read_html()
      
    the.table <- page %>%
      html_node(
        xpath = '//*[@id="frame-content"]/span/div[3]/div/div[2]/div/div/div[1]/table'
      ) %>%
      html_table()
  
    return(the.table)
    },   
  error = function(cond) {
    message(paste("URL does not seem to exist:", url))
    message("Here's the original error message:")
    message(cond)
    return(NA)}
  )
}
