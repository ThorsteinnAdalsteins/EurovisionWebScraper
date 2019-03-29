fGet.participantsTable <- function(siteUrl){
  the.table <- siteUrl %>%
    read_html() %>%
    html_node(
      xpath = '//*[@id="frame-content"]/span/div[3]/div/div/div/table'
    ) %>%
    html_table()
  
  return(the.table)
}