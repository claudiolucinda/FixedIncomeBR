require(lubridate)
get_VNA_AMBIMA <- function(type) {

  data(holidaysANBIMA, package = 'bizdays')
  range(holidaysANBIMA)
  bizdays::create.calendar(name='MyCalendar', holidays=holidaysANBIMA, weekdays=c('sunday', 'saturday'),
                           adjust.from=bizdays::adjust.next, adjust.to=bizdays::adjust.previous)
  projections<-get_projection_AMBIMA()
  suppressWarnings(update_VNA())
  load("./data/VNA.RData")
  current_data<-Sys.Date()
  
  if (type=="NTNB") {
    check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNB))))
    lubridate::month(check_data) <- lubridate::month(check_data) + 1
    
    last_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNB))))
    
    if (current_data<check_data) {
      check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNB))))
      lubridate::month(check_data) <- lubridate::month(check_data) + 1
      
      int_1<- last_data %--% current_data
      int_2<- last_data %--% check_data
      
      du1 <-as.duration(int_1) / ddays(1)
      du2 <-as.duration(int_2) / ddays(1)
      
      VNA<-VNA_NTNB[last_data]*(1+(projections[2]/100))^(du1/du2)
      
    } 
    else {
      check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNB))))
      VNA<-VNA_NTNB[last_data]
      
    }
    
  }

  if (type=="NTNC") {
    check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNC))))
    lubridate::month(check_data) <- lubridate::month(check_data) + 1
    
    last_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNC))))
    
    if (current_data<check_data) {
      check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNC))))
      lubridate::month(check_data) <- lubridate::month(check_data) + 1
      
      int_1<- last_data %--% current_data
      int_2<- last_data %--% check_data
      
      du1 <-as.duration(int_1) / ddays(1)
      du2 <-as.duration(int_2) / ddays(1)
      
      VNA<-VNA_NTNC[last_data]*(1+(projections[1]/100))^(du1/du2)
    } 
    else {
      check_data<-bizdays::adjust.next(as.Date(max(xts:::index.xts(VNA_NTNC))))
      VNA<-VNA_NTNC[last_data]
      
    }
    
    
  
  }
  return(zoo::coredata(VNA))
  
}    
  # # dataQuery<-"2018-04-29"
  # # 
  # # if (is.null(dataQuery)) {
  # #   data_hoje<-bizdays::adjust.next(Sys.Date())
  # # }  else {
  # #   data_hoje<-bizdays::adjust.next(dataQuery)
  # # }
  # # library(RCurl)
  # 
  # url <- "http://www.anbima.com.br/vna/vna.asp"
  # allTables <- XML::readHTMLTable(url)
  # table01<-allTables[[1]]
  # 
  # data<-table01[table01$V1 %in% c("760100","760199","770100","210100"),]
  # data$V2<-gsub("\\.","",data$V2)
  # data$V2<-gsub(",",".",data$V2)
