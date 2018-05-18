#' Elem_Prices
#'
#' Returns a lattice of Element Prices (Contingent Claim Prices) from a Short Run Interest Lattice
#'
#' @param .R A Lattice for the Short Run Rate
#'
#' @return A Lattice for the Element Prices
#' @export
#'
Elem_Prices<-function(.R) {
  OUT<-list()
  OUT[[1]]<-1
  for (i in 2:(length(.R)+1)) {
    TMP<-numeric()
    for (j in 1:i) {
      if (j==1) {
        TMP[j]=OUT[[i-1]][j]/(2*(1+.R[[i-1]][j]))
      }  else if (j==i) {
        TMP[j]=OUT[[i-1]][j-1]/(2*(1+.R[[i-1]][j-1]))
      }
      else {
        TMP[j]=OUT[[i-1]][j]/(2*(1+.R[[i-1]][j])) + 
          OUT[[i-1]][j-1]/(2*(1+.R[[i-1]][j-1]))
      }
      
    }
    OUT[[i]]<-TMP
    
  }
  return(OUT)
  
}

#' SR_Lattice_BDT
#' 
#' Construct a Lattice for the Short Run Rate using the Black-Derman-Toy Model.
#'
#' @param .b - b0 parameter of the BDT Model
#' @param .a - vector of a parameter of the model
#'
#' @return - Short-Run Lattice of interest rates
#' @export
#'

SR_Lattice_BDT <- function(.b,.a) {
  OUT<-list()
  for (i in 1:length(.a)) {
    TMP<-numeric()
    for (j in 1:i) {
      TMP[j]<-.a[i]*exp(.b*(j-1))
      
    }
    OUT[[i]]<-TMP
  }
  return(OUT)
  
  
}



#' BDT_Calibration
#'
#' Calibrate the a parameters of the BDT model from the observed Yield Curve
#'
#' @param .b - b0 parameter of the BDT model
#' @param .short_mkt - yield curve
#'
#' @return A list with the calibrated parameter, the sum of squared residuals of the difference, the short run lattice and the element prices
#' @export
#'

BDT_Calibration <- function(.b,.short_mkt) {
  
  
  # Seems OK
  # Now for the calibration part
  # You Must Neet to pass a b0 and a vector of "a"'s trials
  
  BDT.nllik<-function(.aparm) {
    SR_BDT_Trial<-SR_Lattice_BDT(.b=.b,.a=.aparm)
    
    El_Prices_Trial<-Elem_Prices(SR_BDT_Trial)
    States<-lapply(El_Prices_Trial,FUN=sum)
    
    Curve<-unlist(lapply(2:length(El_Prices_Trial), function(.x) (1/States[[.x]])^(1/(.x-1))-1))
    
    SQR_Diff<-sum((Curve-.short_mkt)^2)
    
  }
  
  b0<-.b
  start <- rep.int(.01,length(.short_mkt))
  BR.res <- optim(start,BDT.nllik,hessian=T,method="BFGS")
  OUT<-list(BR.res$par,BR.res$value,SR_Lattice_BDT(.b=.b,.a=BR.res$par),Elem_Prices(SR_Lattice_BDT(.b=.b,.a=BR.res$par)))
  
}
