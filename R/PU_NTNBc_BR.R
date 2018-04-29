#' Function for pricing ``Notas do Tesouro Nacional - Série B'' 
#' Coupon Brazilian government bonds, also known as ``Tesouro Prefixado com Juros Semestrais''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .YTM - Yield to Maturity (in decimals per year with 252 working days)
#'
#' @return Bond Price
#' @export
#' 
PU_NTNBc_BR <- function(.dataEval=NULL, .maturity, .YTM) {
  
  data<-get_VNA_AMBIMA()
  .VF<-data[data$V2 %in% c("760100"),2]

  PU<-PU_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = .06, VF = .VF,
                             YTM=.YTM, months_coupon = 6)
  
  
}