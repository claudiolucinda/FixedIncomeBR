get_VNA_AMBIMA <- function() {
  
  # dataQuery<-"2018-04-29"
  # 
  # if (is.null(dataQuery)) {
  #   data_hoje<-bizdays::adjust.next(Sys.Date())
  # }  else {
  #   data_hoje<-bizdays::adjust.next(dataQuery)
  # }
  # library(RCurl)
  
  url <- "http://www.anbima.com.br/vna/vna.asp"
  allTables <- XML::readHTMLTable(url)
  table01<-allTables[[1]]
  
  data<-table01[table01$V1 %in% c("760100","760199","770100","210100"),]
  data$V2<-gsub("\\.","",data$V2)
  data$V2<-gsub(",",".",data$V2)
}