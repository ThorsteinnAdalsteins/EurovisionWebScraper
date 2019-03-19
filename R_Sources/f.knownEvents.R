f.knownEvents <- function(checkUrl){
  
  siteUrls.type3 <- c('lisbon-2018', 'kyiv-2017', 'stockholm-2016')
  eventUrls.type3 <- c('first-semi-final', 'second-semi-final', 'grand-final')
  
  siteUrls.type2 <- c('vienna-2015', 'copenhagen-2014', 'malmo-2013', 'baku-2012', 'dusseldorf-2011', 'oslo-2010', 'moscow-2009', 'belgrade-2008')
  # first-semi-final kemur inn 2008. Á þessum árum er hins vegar ekki til detail voting
  eventUrls.type2 <- c('first-semi-final', 'second-semi-final', 'grand-final')
  
  siteUrls.type1 <- c('helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004')
  # s# urlSiteemi-final kemur inn 2004 - 2007
  eventUrls.type1 <- c('semi-final', 'grand-final')
  
  siteUrls.type0 <- c('riga-2003', 'tallinn-2002', 'copenhagen-2001', 'stockholm-2000', 'jerusalem-1999', 'birmingham-1998', 'dublin-1997', 'oslo-1996', 'dublin-1995', 'dublin-1994', 'millstreet-1993', 'malmo-1992', 'rome-1991', 'zagreb-1990', 'lausanne-1989', 'dublin-1988', 'brussels-1987', 'bergen-1986', 'gothenburg-1985', 'luxembourg-1984', 'munich-1983', 'harrogate-1982', 'dublin-1981', 'the-hague-1980', 'jerusalem-1979', 'paris-1978', 'london-1977', 'the-hague-1976', 'stockholm-1975', 'brighton-1974', 'luxembourg-1973', 'edinburgh-1972', 'dublin-1971', 'amsterdam-1970', 'madrid-1969', 'london-1968', 'vienna-1967', 'luxembourg-1966', 'naples-1965', 'cannes-1961', 'london-1960', 'cannes-1959', 'hilversum-1958', 'frankfurt-1957', 'lugano-1956')
  
  # fyrir 2003 er bara ein "event"
  eventUrls.type0 <- c('final')

  if(checkUrl %in% siteUrls.type3){
    return(eventUrls.type3)
  }
  if(checkUrl %in% siteUrls.type2){
    return(eventUrls.type2)
  }
  if(checkUrl %in% siteUrls.type1){
    return(eventUrls.type1)
  }
  if(checkUrl %in% siteUrls.type0){
    return(eventUrls.type0)
  }
  
  this.message <- paste0('Hér gæti þurft að bæta site-id-inu: "',
                        checkUrl,
                        '" við í viðeigandi lista innan í fallinu:\n',
                        'f.knownEvents')
  stop(this.message)
}


f.knownSites <- function(){
  siteUrls <- c('lisbon-2018', 'kyiv-2017', 'stockholm-2016', 'vienna-2015', 'copenhagen-2014', 'malmo-2013', 'baku-2012', 'dusseldorf-2011', 'oslo-2010', 'moscow-2009', 'belgrade-2008', 'helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004','riga-2003', 'tallinn-2002', 'copenhagen-2001', 'stockholm-2000', 'jerusalem-1999', 'birmingham-1998', 'dublin-1997', 'oslo-1996', 'dublin-1995', 'dublin-1994', 'millstreet-1993', 'malmo-1992', 'rome-1991', 'zagreb-1990', 'lausanne-1989', 'dublin-1988', 'brussels-1987', 'bergen-1986', 'gothenburg-1985', 'luxembourg-1984', 'munich-1983', 'harrogate-1982', 'dublin-1981', 'the-hague-1980', 'jerusalem-1979', 'paris-1978', 'london-1977', 'the-hague-1976', 'stockholm-1975', 'brighton-1974', 'luxembourg-1973', 'edinburgh-1972', 'dublin-1971', 'amsterdam-1970', 'madrid-1969', 'london-1968', 'vienna-1967', 'luxembourg-1966', 'naples-1965', 'cannes-1961', 'london-1960', 'cannes-1959', 'hilversum-1958', 'frankfurt-1957', 'lugano-1956')
  return(siteUrls)
}
