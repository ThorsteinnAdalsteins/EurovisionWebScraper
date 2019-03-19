fGet.juryTable <- function(siteUrl){
  the.table <- NA
  
  try(
    the.table <- url %>%
      read_html() %>%
      html_node(
        xpath = '//*[@id="frame-content"]/span/div[3]/div/div[2]/div/div/div[1]/table'
      ) %>%
      html_table()
  )
  
  return(the.table)
}
