rm(list = ls())

# target síða
source('./R_Sources/__init__.R')

siteUrls <- c('tel-aviv-2019')

## ##############################################################
##  Eldri hönnun var með tölur niður á undirsíður
##    Ný hönnun er með jquery töflur inni á einni síðu (einfalari lausn)
##    þarf hins vegar að endurskoða sköfuna áður en næsta Eurovision fer í gang
##    Upplýsingar hafa hins vegar ekki breyst
## ###############################################################
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


