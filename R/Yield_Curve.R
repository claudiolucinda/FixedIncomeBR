#' Yield Curve
#'
#' Estimates the YTM of a bond maturing in .t periods according to the ANBIMA model of the Brazilian Yield Curve.
#' Defaults for .beta and .lambda are values of May 18th, 2015. To update, get the most recent values at http://www.anbima.com.br/est_termo/CZ.asp
#' 
#' @param .beta - Vector of beta coefficients
#' @param .lambda - Vector of lambda coefficients
#' @param .t - Time in years of 252 working days
#'
#' @return - The YTM (in decimals) per year of 252 working days
#' @export
#'
#'
Yield_Curve <- function(.beta=c(0.113525690989684,-0.0463197432094039,-0.0709736348702071,-0.00365241403584365),
                        .lambda=c(1.61175546741901,0.428872702898983),.t) {
  time<-.t/252
  
  OUT<-.beta[1]+.beta[2]*((1-exp(-.lambda[1]*time))/(.lambda[1]*time))+
    .beta[3]*(((1-exp(-.lambda[1]*time))/(.lambda[1]*time))-exp(-.lambda[1]*time))+
    .beta[4]*(((1-exp(-.lambda[2]*time))/(.lambda[2]*time))-exp(-.lambda[2]*time))
  
}
