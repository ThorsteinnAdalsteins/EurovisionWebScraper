rm(list = ls())
source('./R_Sources/__init__.R')

siteUrls <- c('lisbon-2018', 'helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004')
# Collect the data
detailVoting <- fProc.votingDetails(siteUrls)

eventMetadata <- eventMetadata.collect(siteUrls)
eventMetadata.cs <- eventMetadata.clean(eventMetadata)

participantTable <- participantTable.collect(siteUrls)
participantTable <- participantTable.clean(participantTable)

eventVotes <- eventVotes.collect(siteUrls)
eventVotes.cl <- eventVotes.clean(eventVotes)

juryTable <- juryTable.collect(siteUrls)
juryTable.cl <- juryTable.clean(juryTable)

# unify and clean (check for errours)


