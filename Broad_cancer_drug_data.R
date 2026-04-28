mda_drugs<-as.data.frame(t(CTRPAUCMatrix[c(1,which(CTRPAUCMatrix$V1=="ACH-000768")),-1]))
ovc_drugs<-as.data.frame(t(CTRPAUCMatrix[c(1,which(CTRPAUCMatrix$V1=="ACH-000013")),-1]))

cleaned_mda_drugs<-na.omit(mda_drugs)
cleaned_ovc_drugs<-na.omit(ovc_drugs)

colnames(cleaned_mda_drugs)<-c("Drug","Killing")
colnames(cleaned_ovc_drugs)<-c("Drug","Killing")

mda_drug_profile <-cleaned_mda_drugs[order(cleaned_mda_drugs$Killing),]
ovc_drug_profile <-cleaned_ovc_drugs[order(cleaned_ovc_drugs$Killing),]

top30drugs_mda<-mda_drug_profile[1:50,]
top30drugs_ovc<-ovc_drug_profile[1:50,]

drug_spec_mda<-ggplot(top30drugs_mda,aes(x=Drug,y=Killing))+geom_col(fill="royalblue")+coord_flip()
drug_spec_mda

drug_spec_ovc_test<-ggplot(druginter,aes(x=Drug,y=Killing))+geom_col(fill="purple2")+coord_flip()
drug_spec_ovc_test

druginter<-as.data.frame(intersect(top30drugs_mda,top30drugs_ovc))



