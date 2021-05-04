#for Jesse

library(readxl)
#read in table types
fieldseason<-paste("C:/Users/",params$user,"/New York State Office of Information Technology Services/LMAS - LCI/LCI.Field.Season.xlsx",sep="")
bottles<-read_excel(fieldseason, sheet ="6.parameters")
intensive<-read_excel(fieldseason, sheet ="5.labels")

#realine the table
library(tidyr)
intensive <- intensive %>% 
  gather(type, sample, Sample1:Sample5)

intensive<-intensive%>% select(matching,Lake,LAKE,type,sample,layer) %>% filter(LAKE!="none",!is.na(sample)) %>% distinct()
access<-read.xlsx(fieldseason, sheet =2)
access<-access %>% select(Lake,X_Coordinate,Y_Coordinate) %>% rename(matching=Lake)
intensive<-merge(intensive,access,by=c('matching'),all.x = TRUE)
write.csv(intensive,file='for.jesse.labels.csv',row.names=FALSE)

output: 
  word_document:
  reference_docx: word_styles-reference-itineraries.docx