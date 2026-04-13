library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggridges)

#the main data 
mda<-as.data.frame(harmonized_RPPA_CCLE[c(1,which(harmonized_RPPA_CCLE$V1=="ACH-000768")),-1])
ovc<-as.data.frame(harmonized_RPPA_CCLE[c(1,which(harmonized_RPPA_CCLE$V1=="ACH-000013")),-1])

#transpose for plot
mda_vert<-as.data.frame(t(mda))
ovc_vert<-as.data.frame(t(ovc))

colnames(mda_vert)<-c("Protein","Expression")
colnames(ovc_vert)<-c("Protein","Expression")

#ordering
mda_profile<-mda_vert[order(mda_vert$Expression),]
ovc_profile<-ovc_vert[order(ovc_vert$Expression),]

#changing to numeric
mda_profile$Expression<- as.numeric(mda_profile$Expression)
ovc_profile$Expression<- as.numeric(ovc_profile$Expression)

#ggplot for just mda
p<-ggplot(mda_profile, aes(x=Expression))+theme_minimal()+geom_density(fill = "firebrick",alpha=0.5,)+labs(title="MDA-MD-768 Protein Expression Distribution", x = "Expression", y="Density")
p

#ovc and mda combined
df_mda<-data.frame(Expression=as.numeric(mda[2,-1]), CellLine="MDA")
df_ovc<-data.frame(Expression=as.numeric(ovc[2,-1]), CellLine="OVC")

together<-rbind(df_mda,df_ovc)
#as.data.frame(t(rbind(mda,ovc))) what I used before

q<-ggplot(together, aes(x=Expression,y=CellLine,fill=CellLine))+theme_ridges()+geom_density_ridges(alpha=0.5,scale=1.5)+labs(title="MDA-MD-768 Protein Expression Distribution", x = "Expression", y="Density")
q  

#Comparing all the cell lines