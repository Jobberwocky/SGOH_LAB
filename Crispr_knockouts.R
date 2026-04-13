library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggridges)

mda_knockout<-as.data.frame(t(CRISPRGeneEffect[c(1,which(CRISPRGeneEffect$V1=="ACH-000768")),-1]))
ovc_knockout<-as.data.frame(t(CRISPRGeneEffect[c(1,which(CRISPRGeneEffect$V1=="ACH-000013")),-1]))

colnames(mda_knockout)<-c("Gene","Effectiveness")
colnames(ovc_knockout)<-c("Gene","Effectiveness")

mda_knockout$Effectiveness<-as.numeric(mda_knockout$Effectiveness)
ovc_knockout$Effectiveness<-as.numeric(ovc_knockout$Effectiveness)

mda_knockout_profile<-mda_knockout[order(mda_knockout$Effectiveness),]
ovc_knockout_profile<-ovc_knockout[order(ovc_knockout$Effectiveness),]

top28genes_mda<-mda_knockout_profile[1:30,]
top28genes_ovc<-ovc_knockout_profile[1:30,]

mda_k_plot<-ggplot(top28genes_mda,aes(x=Gene,y=Effectiveness))+geom_col(fill="royalblue")+coord_flip()
mda_k_plot

ovc_k_plot<-ggplot(top28genes_ovc,aes(x=Gene,y=Effectiveness))+geom_col(fill="salmon1")+coord_flip()
ovc_k_plot


#this is the overlap
commongenes<-intersect(top28genes_mda$Gene,top28genes_ovc$Gene)

