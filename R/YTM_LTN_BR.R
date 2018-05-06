#' Function for Getting YTM of ``Letras do Tesouro Nacional - Série F'' 
#' Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .PU - Price in BRL
#'
#' @return YTM - Yield to Maturity
#' @export
#' 
YTM_LTN_BR <- function(.dataEval=NULL, .maturity, .PU) {

  YTM<-YTM_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = NULL, VF = 1000,
                             PU=.PU, months_coupon = NULL)
  
  
}