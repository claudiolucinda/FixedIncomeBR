get_projection_AMBIMA <- function() {
  url <- "http://www.anbima.com.br/indicadores/indicadores.asp"
  allTables <- XML::readHTMLTable(url, encoding="UTF8")
  abc<-allTables[[1]]
  data<-abc[abc$V1 %in% c("IGP-M1","IPCA1"),]
  data$V3<-as.numeric(gsub(",",".",data$V3))
}