% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Events_NTNBc_BR.R
\name{Events_NTNBc_BR}
\alias{Events_NTNBc_BR}
\title{Function for getting list of events ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado com Juros Semestrais''}
\usage{
Events_NTNBc_BR(.dataEval = NULL, .maturity, .YTM)
}
\arguments{
\item{.dataEval}{- Date when the pricing is to be made. If NULL, it is priced in the current working day}

\item{.maturity}{- Maturity - as a string or a date (Date or POSIXct)}

\item{.YTM}{- Yield to Maturity (in decimals per year with 252 working days)}
}
\value{
List of Events as a Data Frame
}
\description{
Function for getting list of events ``Notas do Tesouro Nacional - Série B'' 
Zero Coupon Brazilian government bonds, also known as ``Tesouro Prefixado com Juros Semestrais''
}
