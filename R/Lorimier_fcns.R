cross_lor <- function(.tenors) {
  temp<-c(0,.tenors)
  results<-matrix(,nrow=length(temp),ncol=length(temp))
  for (i in 1:length(temp)) {
    for (j in 1:length(temp)) {
      results[i,j]<--((min(temp[i],temp[j])^3)/6)+temp[i]*temp[j]*(1+((min(temp[i],temp[j]))/2))
    }
  }
  return(results)
}

Amat <-function(.crossMat,.alpha,.tenors) {
  output<-.crossMat
  for (i in 2:ncol(.crossMat)) {
    k<-i-1
    output[1,i]<-.tenors[k]
  }
  for (j in 2:nrow(.crossMat)) {
    k<-j-1
    output[j,1]<-.tenors[k]
  }
  for (i in 2:ncol(.crossMat)) {
    output[i,i]<-.crossMat[i,i]+(1/.alpha)
  }
  return(output)
  
}

Bmat<-function(.yields,.tenors) {
  temp_yields<-c(0,.yields)
  temp_temors<-c(1,.tenors)
  bmat<-matrix(,nrow=length(temp_temors),ncol=1)
  for (i in 1:length(temp_temors)) {
    bmat[i,1]<-temp_temors[i]*temp_yields[i]
  }
  return(bmat)
}

h_u <- function(.T,.T_i) {
  result<-.T*.T_i+.T_i*(0.5*((min(.T,.T_i)^2))+.T_i*(max(.T-.T_i,0)))-.5*((1/3)*(min(.T,.T_i)^3)+(.T_i^2)*(max(.T-.T_i,0)))
  
}


lor_Ycurve <- function(.Time,.alpha,.Tenors,.Yields) {
  .cl<-cross_lor(.Tenors)
  .Amatrix<-Amat(.cl,.alpha,.Tenors)
  .bmatrix<-Bmat(.Yields, .Tenors)
  .beta_coefs<-solve(.Amatrix,.bmatrix)
  .hus<-as.matrix(sapply(.Tenors, function(.x) h_u(.x,.Time)))
  out<-.beta_coefs[1,1]+(t(.hus)%*%.beta_coefs[2:nrow(.beta_coefs),1]/.Time)
  return(out)
  
  
  
  
}