#' Function for generating Duration and Convexity for Brazilian Debt Instruments
#'
#' @param dataEval Date in which the bond is to be priced. If NULL, the price is for the current date.
#' @param maturity Maturity date.
#' @param coupon_rate Coupon Rate. When NULL, it returns the price of a zero coupon.
#' @param VF Face value of the bond.
#' @param YTM Yield to Maturity.
#' @param months_coupon Number of months between each coupon. If coupon is NULL, not used.
#'
#' @return Bond Price.
#' @export
#'

DurConv_BRbond <- function(dataEval=NULL, maturity, coupon_rate=NULL,
                      VF, YTM, months_coupon) {
  data(holidaysANBIMA, package = 'bizdays')
  range(holidaysANBIMA)
  bizdays::create.calendar(name='MyCalendar', holidays=holidaysANBIMA, weekdays=c('sunday', 'saturday'),
                  adjust.from=bizdays::adjust.next, adjust.to=bizdays::adjust.previous)
  YTM_dia=((1+YTM)^(1/252))-1
  if (is.null(dataEval)) {
    data_hoje<-Sys.Date()
  }
  else {
    data_hoje<-as.Date(dataEval)
  }
  data_futura<-as.Date(maturity)

  x<-lubridate::interval(data_hoje,data_futura)
  data_futura0<-data_futura

  if (!is.null(coupon_rate)) {

    n_sem<- x %/% months(months_coupon)
    events<-list(bizdays::adjust.next(data_futura0))

    if (!(n_sem<1)) {
      for(i in 1:n_sem) {
        data_futura0<-data_futura0-months(months_coupon)
        idx<-i+1
        events[[idx]]<-bizdays::adjust.next(data_futura0)
      }
    }

    datas<-plyr::ldply(events,function(.x) bizdays::bizdays(data_hoje,.x,'MyCalendar')+1)
    datas$V2<-datas$V1/252
    datas$CF<-VF*((1+coupon_rate)^.5 -1)
    datas$CF[1]<-datas$CF[1]+VF
    datas$PV<-datas$CF/((1+YTM)^(datas$V1/252))
    datas$weights<-datas$PV/sum(datas$PV)
    duration<-sum(datas$weights*datas$V2)
    datas$int_cal<-datas$PV*((datas$V2^2)+datas$V2)

    convexity<-(1/(sum(datas$PV)*(1+YTM_dia^2)))*sum(datas$int_cal)
    measures<-data.frame(duration,convexity)
    colnames(measures)<-c("Duration","Convexity")

  }
  else {
    duration<-(bizdays::bizdays(data_hoje,data_futura,'MyCalendar')+1)/252
    PU<-(VF/((1+YTM)^(duration/252)))
    int_cal<-PU*(duration^2+duration)
    convexity<-(1/(PU*(1+YTM_dia^2)))*int_cal
    measures<-data.frame(duration,convexity)
    colnames(measures)<-c("Duration","Convexity")
  }
  return(measures)


}

