# FixedIncomeBR
R Package for Brazilian Fixed Income Bonds. It is a set of functions intended for academic use. There are functions for Federal Government Bonds and a set for generic bonds (with no anticipated amortization). For each bond type, there are four functions:

* For Computing Bond Prices
* For Computing the Yield to Maturity
* For Generating a table with event dates and Cash Flows
* For Computing Duration and Convexity



| Bond Type                  | PU Function  | YTM Function  | Events Function  | Duration+Convexity  |
|----------------------------|--------------|---------------|------------------|---------------------|
| Tesouro Prefixado (LTN)    | PU_LTN_BR.R  | YTM_LTN_BR.R  | Events_LTN_BR.R  | DurConv_LTN_BR.R    |
| Tes. Prefix. Juros (NTNF)  | PU_NTNF_BR.R | YTM_NTNF_BR.R | Events_NTNF_BR.R | DurConv_NTNF_BR.R   |
| Tesouro IPCA+ (NTNB)       | PU_NTNB_BR.R | YTM_NTNB_BR.R | Events_NTNB_BR.R | DurConv_NTNB_BR.R   |
| Tesouro IPCA+ Juros (NTNB) | PU_NTNBc_BR.R | YTM_NTNBc_BR.R | Events_NTNBc_BR.R | DurConv_NTNBc_BR.R   |
| Generic Function           | PU_BRBond.R | YTM_BRBond.R | Events_BRBond.R | DurConv_BRBond.R |

There is an additional function, `get_VNA_AMBIMA.R` which gets the relevant values for the indexed bonds. Another one is `PChg_BRbond.R`which gives the predicted percentage in bond prices for a given change in Yield to Maturity.

There is also a suite of functions to price LTN bonds using the Black-Derman-Toy model using the ANBIMA model for the term structure.

There is also a function for using quadratic splines for estimating the term structure, called the *Lorimier Method* in the Damir Filipovic's Springer Book. There is an example in the Tests folder.

To install, use the `devtools::install_github("claudiolucinda/FixedIncomeBR")`.


