update_VNA <- function() {
  url_NTNB<-"http://www.tesouro.gov.br/documents/10180/378339/DP_Valores_Nominais_NTNB.xls"  
  download.file(url_NTNB,"./data/NTNB.xls", mode="wb", quiet=TRUE)
  VNA_NTNB<-readxl::read_excel("./data/NTNB.xls",skip=8)
  VNA_NTNB<-VNA_NTNB[-1,]
  
  VNA_NTNB<-xts::xts(VNA_NTNB,order.by=VNA_NTNB$DATA)  
  VNA_NTNB<-VNA_NTNB[,-1]
  colnames(VNA_NTNB)<-"VNA_NTNB"
  
  url_NTNC<-"http://www.tesouro.gov.br/documents/10180/378339/DP_Valores_Nominais_NTNC.xls"  
  download.file(url_NTNC,"./data/NTNC.xls", mode="wb", quiet=TRUE)
  VNA_NTNC<-readxl::read_excel("./data/NTNc.xls",skip=09)
  VNA_NTNC<-VNA_NTNC[-(1:2),]
  colnames(VNA_NTNC)<-c("DATA","VNA_NTNC","VNA_NTNC_2")
  
  VNA_NTNC<-xts::xts(VNA_NTNC,order.by=VNA_NTNC$DATA)  
  VNA_NTNC<-VNA_NTNC[,-1]
  
  mode(VNA_NTNB)<-"numeric"
  mode(VNA_NTNC)<-"numeric"
  save(VNA_NTNC, VNA_NTNB, file="./data/VNA.RData")
  
  
}