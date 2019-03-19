
source('./R_scrapeEurovisionStatsWeb/__init__.R')

siteUrls <- c('helsinki-2007', 'athens-2006', 'kyiv-2005', 'istanbul-2004')
# get detail voting
detailVoting <- fProc.votingDetails(siteUrls)
eventMetadata <- fProc.eventMetadata(siteUrls)
eventParticipants <- fProc.participantTable(siteUrls)
eventVotes <- fProc.eventVotes(siteUrls)
juryTable <- fProc.juryTable(siteUrls)
