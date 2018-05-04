#' Function for Getting YTM of ``Notas do Tesouro Nacional - Série F'' 
#' Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado com Juros Semestrais''
#'
#' @param .dataEval - Date when the pricing is to be made. If NULL, it is priced in the current working day
#' @param .maturity - Maturity - as a string or a date (Date or POSIXct)
#' @param .PU - Price in BRL
#'
#' @return YTM - Yield to Maturity
#' @export
#' 
YTM_NTNB_BR <- function(.dataEval=NULL, .maturity, .PU) {

  data<-get_VNA_AMBIMA()
  .VF<-data[1,1]
  
  YTM<-YTM_BRbond(dataEval = .dataEval,maturity=.maturity, coupon_rate = NULL, VF = .VF,
                             PU=.PU, months_coupon = NULL)
  
  
}