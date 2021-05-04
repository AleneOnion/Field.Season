
library(rmarkdown)
library(dplyr)
parameters=list(type = "5",
                #Sample="Sample5",
            grouping = "Agawam",
            user="amonion",
            week="05.10")
shortparams<-parameters
shortparams$week<-NULL
shortparams$Sample<-NULL
labelparams<-parameters
labelparams$week<-NULL
labelparams$type<-NULL


#float plan
rmarkdown::render('LCI.float.plan.Rmd',  
                  params = shortparams,
                  output_file =  paste(parameters$week,".",parameters$grouping,".float.plan.html",sep=""), 
                  output_dir = 'C:/Users/amonion/New York State Office of Information Technology Services/LMAS - LCI/2021.field.season.files/itineraries.floatplans.labels')


# rmarkdown::render('LCI.float.plan.Rmd',  
#                   params = shortparams,
#                   output_file =  paste(parameters$week,".",parameters$grouping,".float.plan.docx",sep=""), 
#                   output_dir = 'C:/Users/amonion/New York State Office of Information Technology Services/LMAS - LCI/2021.field.season.files/itineraries.floatplans.labels')

#itinerary
rmarkdown::render('LCI.itineraries.Rmd',  
                  params = shortparams,
                  output_file =  paste(parameters$week,".",parameters$grouping,".itineraries.docx",sep=""), 
                  output_dir = 'C:/Users/amonion/New York State Office of Information Technology Services/LMAS - LCI/2021.field.season.files/itineraries.floatplans.labels')



# #baglabels
# rmarkdown::render('LCI.Bag.Labels.Rmd',  
#                   params = labelparams,
#                   output_file =  paste(parameters$week,".",parameters$grouping,".baglabels.docx",sep=""), 
#                   output_dir = 'C:/Users/amonion/New York State Office of Information Technology Services/LMAS - LCI/2021.field.season.files/itineraries.floatplans.labels')
# 
# #labels
# rmarkdown::render('LCI.Sample.Labels.Rmd',  
#                   params = labelparams,
#                   output_file =  paste(parameters$week,".",parameters$grouping,".labels.docx",sep=""), 
#                   output_dir = 'C:/Users/amonion/New York State Office of Information Technology Services/LMAS - LCI/2021.field.season.files/itineraries.floatplans.labels')
