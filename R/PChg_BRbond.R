#' Function for estimating the predicted price change for a Brazilian bond
#'
#' @param dataEval Date in which the bond is to be priced. If NULL, the price is for the current date.
#' @param maturity Maturity date.
#' @param coupon_rate Coupon Rate. When NULL, it returns the price of a zero coupon.
#' @param VF Face value of the bond.
#' @param YTM Yield to Maturity.
#' @param months_coupon Number of months between each coupon. If coupon is NULL, not used.
#' @param dYTM Predicted change in YTM (in basis points)
#'
#' @return Predicted percentage change in bond price
#' @export
#'

PChg_BRbond <- function(dataEval=NULL, maturity, coupon_rate=NULL,
                        VF, YTM, months_coupon, dYTM) {

  data_0<-DurConv_BRbond(dataEval, maturity, coupon_rate,
                         VF, YTM, months_coupon)
  duration<-data_0[1,1]
  convexity<-data_0[1,2]
  dYTM<-dYTM

  mod_dur<-duration/((1+YTM)^(1/252))
  Pchg<--mod_dur*dYTM+(0.5)*(convexity-mod_dur^2)*dYTM^2
  return(Pchg)

}
