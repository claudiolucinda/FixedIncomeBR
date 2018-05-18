require(lubridate)

#' PU_LTN_BDT
#' 
#' Function which generates the PU of a LTN using the Black-Derman Toy Model
#'
#' @param .dataEval - Data as which the price is to be calculated
#' @param .maturity - Maturity
#' @param .nstates - Number of time periods in the lattice
#' @param .beta - Vector of Beta coefficients for the ANBIMA model of the term structure
#' @param .lambda - Vector of Lambda coefficients for the ANBUMA model of the term structure
#'
#' @return - Price in BRL of a LTN
#' @export
#'

PU_LTN_BDT <- function(.dataEval=NULL,.maturity,.nstates,.beta,.lambda) {
  
  Data_mat<-Events_LTN_BR(.dataEval=.dataEval,.maturity,.YTM=.05)[1,1]
  vertices<-seq(from=1, to=Data_mat, length.out = .nstates)
  intervals<-diff(vertices)
  YC<-sapply(vertices, function(.x) Yield_Curve(.beta=.beta,.lambda=.lambda,.t=.x) )
  
  b0<-.01
  Tester<-BDT_Calibration(.b=b0,.short_mkt=YC)
  
  SR_Lattice<-Tester[[3]]
  time_per<-length(SR_Lattice)
  n_states<-length(SR_Lattice[[time_per]])
  
  q=.5
  final_vector<-rep.int(1000,n_states)
  
  Zero<-Bond_Lattice(.q=q,.R=SR_Lattice,.fin_vec=final_vector,.n=time_per,.diffs=intervals)
  OUT<-Zero[[1]][1]
  return(OUT)
  
}
