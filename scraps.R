#seeing how many of each sample were collected

library(openxlsx)
#read in table types
intensive<-read.xlsx("data/New York State Office of Information Technology Services/Sampling Season - Documents/LCI.Field.Season.xlsx", 5)

#restrict to epi only
intensive<-intensive[intensive$layer=="epi",]

library(dplyr)
#dept interest sites: '
deptint<-intensive %>% 
  filter(LAKE %in% c('0906HIC0004','0906MUD0003','0703ONE0026','0703ONE0026','0703ONE0026','1101MOR0101','1501ROC098','1301WAS0302')) %>% 
  mutate(deptint="deptint")
intensive<-merge(intensive,deptint,all=TRUE)
rm(deptint)

#add sample count
intensive<-intensive %>% 
  mutate(samples=ifelse(intensive=="no",1,4)) %>% 
  select(LAKE,matching,samples,intensive,deptint) %>% 
  group_by(intensive,deptint) %>%
  summarize(samples=sum(samples)) %>% 
  ungroup()


params<-list(
    type=c('Sample2'),
    grouping=c('Delaware'),
    user=c('amonion.000')
  )
