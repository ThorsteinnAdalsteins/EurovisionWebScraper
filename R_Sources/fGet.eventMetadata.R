
fGet.eventMetadata <- function(url){
  s1 <- try(
    url %>%
      read_html() %>%
      html_node(
        # xpath = '//*[@id="frame-content"]/span/div[3]/div[1]/div/div/div[2]/section'
        xpath = '//*[@id="frame-content"]/span/div[3]/div[1]/div/div/div[2]/div[2]'
      ) %>%
      html_text()
  )
  
  # smiða meta-tag lista til að vinna á móti því sem ég sé á vefsíðunni
  # þetta er ákaflega brothætt, en virkar eftir því sem ég fæ meiri reynslu
  metaTags <- tibble(
    tag.titles = c('The show Grand Final',
                   'First Semi-Final',
                   'Second Semi-Final',
                   'Semi-Final',
                   'Grand Final',
                   'Location',
                   'Host broadcaster',
                   'Presented by',
                   'Executive Producer',
                   'EBU Supervisor',
                   'TV Director',
                   'Interval Act'),
    tag.id = seq(tag.titles)
  )
  
  s2 <- s1
  for(i in seq(metaTags$tag.id)){
    s2 <- str_replace_all(
      s2, 
      metaTags$tag.titles[i], 
      sprintf('XOX%sXOX', metaTags$tag.titles[i])
    )
  }
  
  s3 <- unlist(str_split(s2, "XOX"))[-1]
  
  d1 <- matrix(s3, ncol=2, byrow=TRUE) %>%
    as_tibble(.name_repair = 'universal')
  names(d1) <- c('tag', 'value')
  
  return(d1)
}