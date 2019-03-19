# EurovisionWebScraper

This scraper is built to mine data from the Eurovision song contest staistics website

## Structure of the project
  1) This is not an R package
  2) The main process script is the __build__.R script. This file loads the processing files stored in the R_Sources folder by calling the only process file: __init__.R
  3) Each website field is scraped using functions named fGet.xxx. These functions accept a character argument that coresponds to the proper url of the competition. The function should return a data.frame or tibble with the information
  4) The fProc.xxx families of functions process a list of competition identifiers (e.g. 'athens-2006'), collect the proper urls to collect the complete set of data for each competition and sub-event. The competitions have slightly different structure, but the fProc.xxx functions should be configured to handle this. Each process may be slightly time consuming, since the process may need to perform up to 100 website calls to complete. The process should return a tibble
  5) The entire web covers competitions back to 1956. The identifiers for the competition are stored in the function f.knownSites() function. It is highly recommended not to run the entire series at once (the eurovision site may block you). In stead 5-10 event sites should be mined and stored in separate data-objects
  5) The fClean.xxx families perform basic cleaning of the data objects returned by the fProc.xxx families of functions