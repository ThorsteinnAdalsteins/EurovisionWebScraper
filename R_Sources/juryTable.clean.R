
juryTable.clean <- function(juryTable.raw){
  
  d <- f.splitPath(juryTable.raw)
  
  d.ret <- d %>% select(year, host_city, event, 
                         jury_country = path_country, 
                         juror_id = Member, 
                         juror_name = Name, 
                         juror_gender = Gender, 
                         juror_date_of_birth = `Date of birth`, 
                         juror_profession = Profession, 
                         competition_id, page)
  class(d.ret) <- c(class(d.ret), 'eurovision.juryList.clean')
  
  return(d.ret)
}
