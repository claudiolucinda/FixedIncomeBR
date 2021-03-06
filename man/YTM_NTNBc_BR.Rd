% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/YTM_NTNBc_BR.R
\name{YTM_NTNBc_BR}
\alias{YTM_NTNBc_BR}
\title{Function for Getting YTM of ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro IPCA+ Semestrais''}
\usage{
YTM_NTNBc_BR(.dataEval = NULL, .maturity, .PU)
}
\arguments{
\item{.dataEval}{- Date when the pricing is to be made. If NULL, it is priced in the current working day}

\item{.maturity}{- Maturity - as a string or a date (Date or POSIXct)}

\item{.PU}{- Price in BRL}
}
\value{
YTM - Yield to Maturity
}
\description{
Function for Getting YTM of ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro IPCA+ Semestrais''
}
