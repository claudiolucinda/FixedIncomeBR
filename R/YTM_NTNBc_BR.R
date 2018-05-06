#' Function for Getting YTM of ``Notas do Tesouro Nacional - Série B'' 
#' Zero Coupon Brazilian government bonds, also known as ``Tesouro IPCA+ Semestrais''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .PU - Price in BRL
#'
#' @return YTM - Yield to Maturity
#' @export
#' 
YTM_NTNBc_BR <- function(.dataEval=NULL, .maturity, .PU) {

  data<-get_VNA_AMBIMA(type="NTNB")
  .VF<-data[1,1]
  
  YTM<-YTM_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = .06, VF = .VF,
                             PU=.PU, months_coupon = 6)
  
  
}