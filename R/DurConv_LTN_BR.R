#' Function for getting Duration and Convexity for ``Letras do Tesouro Nacional - Série F'' 
#' Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado com Juros Semestrais''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .YTM - Yield to Maturity (in decimals per year with 252 working days)
#'
#' @return Bond Price
#' @export
#' 

DurConv_LTN_BR <- function(.dataEval=NULL, .maturity, .YTM) {
  
  OUT<-DurConv_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = NULL, VF = 1000,
                      YTM=.YTM, months_coupon = NULL)
  
}