% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PU_NTNB_BR.R
\name{PU_NTNB_BR}
\alias{PU_NTNB_BR}
\title{Function for pricing ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro IPCA+''}
\usage{
PU_NTNB_BR(.dataEval = NULL, .maturity, .YTM)
}
\arguments{
\item{.dataEval}{- Date when the pricing is to be made. If NULL, it is priced in the current working day}

\item{.maturity}{- Maturity - as a string or a date (Date or POSIXct)}

\item{.YTM}{- Yield to Maturity (in decimals per year with 252 working days)}
}
\value{
Bond Price
}
\description{
Function for pricing ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro IPCA+''
}
