#' PChg_BRbond
#' Function to compute percentage change in Brazilian bond prices given a change in Yield to Maturity 
#' Note: it only computes changes for the current date
#'
#'
#' @param type String specifying which bond type. Currently accepted "NTNF", "NTNB", "NTNBc" and "LTN"
#' @param .maturity Maturity of the Bond 
#' @param .YTM Current Yield to Maturity
#' @param .dYTM Proposed change
#'
#' @return
#' @export
#'
#' @examples
PChg_BRbond <- function(type,.maturity,.YTM,.dYTM) {
  DC<-switch(type,
             LTN = DurConv_LTN_BR(.dataEval = NULL,.maturity = .maturity,.YTM=.YTM),
             NTNB = DurConv_NTNB_BR(.dataEval = NULL,.maturity = .maturity,.YTM=.YTM),
             NTNBc = DurConv_NTNBc_BR(.dataEval = NULL,.maturity = .maturity,.YTM=.YTM),
             NTNF =DurConv_NTNF_BR(.dataEval = NULL,.maturity = .maturity,.YTM=.YTM),
             stop("Bond not found!!"))
  
  duration<-DC[1,1]
  convexity<-DC[1,2]
  
  mod_dur<-duration/((1+.YTM)^(1/252))
  Pchg<--mod_dur*.dYTM+(0.5)*(convexity-mod_dur^2)*.dYTM^2
  return(Pchg)
  
  
}