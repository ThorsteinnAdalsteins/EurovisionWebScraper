rm(list = ls())
source('./R_Sources/__init__.R')

siteUrls <- c('helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004')
# Collect the data
detailVoting <- fProc.votingDetails(siteUrls)
eventMetadata <- fProc.eventMetadata(siteUrls)
eventParticipants <- fProc.participantTable(siteUrls)
eventVotes <- eventVotes.collect(siteUrls)
juryTable <- juryTable.collect(siteUrls)

# unify and clean (check for errours)
f.knownSites()

  
d <- read.csv2('./_GognUt/juryList 2016-2018.csv', stringsAsFactors = FALSE)

juryTable.clean(d)
