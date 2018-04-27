#' Function for finding the YTM for Brazilian Debt Instruments
#'
#' @param dataEval Date in which the bond is to be priced. If NULL, the price is for the current date.
#' @param maturity Maturity date.
#' @param coupon_rate Coupon Rate. When NULL, it returns the price of a zero coupon.
#' @param VF Face value of the bond.
#' @param PU PU.
#' @param months_coupon Number of months between each coupon. If coupon is NULL, not used.
#'
#' @return Bond Price.
#' @export
#'



YTM_BRbond <- function(dataEval=NULL, maturity, coupon_rate=NULL,
                      VF, PU, months_coupon) {

  f<-function(.x) {
    PU-PU_BRbond(dataEval, maturity, coupon_rate,
                 VF, .x, months_coupon)

  }

  YTM<-uniroot(f, c(0,1),extendInt="yes", trace=1)$root
}

