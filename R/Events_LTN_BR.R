#' Function for Getting Event List for ``Letras do Tesouro Nacional'' 
#' Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .YTM - Yield to Maturity (in decimals per year with 252 working days)
#'
#' @return Data Frame with dates (in days), Cash Flows and PV of Cash Flows
#' @export
#' 
Events_LTN_BR <- function(.dataEval=NULL, .maturity, .YTM) {

  Events_LTN_BR<-Events_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = NULL, VF = 1000,
                             YTM=.YTM, months_coupon = NULL)
  
  
}