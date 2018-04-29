####################################################
# Testando as funções
####################################################

source("./R/PU_BRbond.R")
source("./R/Events_BRbond.R")
source("./R/DurConv_BRbond.R")
source("./R/YTM_BRbond.R")
source("./R/PChg_BRbond.R")

# Pricing a Debenture
teste01<-PU_BRbond(dataEval = NULL,maturity="2019-05-15", coupon_rate = 0.053999, VF = 1000,
                   YTM=.1, months_coupon = 12)

teste02<-Events_BRbond(dataEval = NULL,maturity="2019-03-15", coupon_rate = 0.053999, VF = 1000,
                       YTM=.1, months_coupon = 12)

teste03<-DurConv_BRbond(dataEval = NULL,maturity="2019-05-15", coupon_rate = 0.053999, VF = 1000,
                        YTM=.1, months_coupon = 12)

# Pricing a LTN

teste01_LTN<-PU_BRbond(dataEval = NULL,maturity="2021-01-01", coupon_rate = NULL, VF = 1000,
                   YTM=.0783, months_coupon = NULL)

teste02_LTN<-Events_BRbond(dataEval = NULL,maturity="2021-01-01", coupon_rate = NULL, VF = 1000,
                       YTM=.0783, months_coupon = NULL)

source("./R/DurConv_BRbond.R")
teste03_LTN<-DurConv_BRbond(dataEval = NULL,maturity="2019-05-15", coupon_rate = NULL, VF = 1000,
                        YTM=.0783, months_coupon = NULL)


# Pricing a NTN

teste01_NTN<-PU_BRbond(dataEval = NULL,maturity="2029-01-01", coupon_rate = .1, VF = 1000,
                       YTM=.0971, months_coupon = 6)

teste02_NTN<-Events_BRbond(dataEval = NULL,maturity="2029-01-01", coupon_rate = .1, VF = 1000,
                           YTM=.0971, months_coupon = 6)

teste03_NTN<-DurConv_BRbond(dataEval = NULL,maturity="2029-01-01", coupon_rate = .1, VF = 1000,
                            YTM=.0971, months_coupon = 6)

# Pricing a NTN+IPCA

teste01_NTN<-PU_BRbond(dataEval = NULL,maturity="2026-08-15", coupon_rate = .06, VF = 3069.756606,
                       YTM=.0463, months_coupon = 6)

teste02_NTN<-Events_BRbond(dataEval = NULL,maturity="2026-08-15", coupon_rate = .06, VF = 3069.756606,
                           YTM=.0463, months_coupon = 6)

teste03_NTN<-DurConv_BRbond(dataEval = NULL,maturity="2029-01-01", coupon_rate = .1, VF = 3069.756606,
                            YTM=.0971, months_coupon = 6)

teste04<-YTM_BRbond(dataEval = NULL,maturity="2026-08-15",
                    coupon_rate = .06, VF = 3069.756606,
                    PU=3390, months_coupon = 6)

teste05<-PChg_BRbond(dataEval = NULL,maturity="2026-08-15", coupon_rate = .1, VF = 3069.756606,
                     YTM=.0971, months_coupon = 6,dYTM=.0001)

teste01_NTN<-PU_BRbond(dataEval = NULL,maturity="2026-08-15", coupon_rate = .06, VF = 3069.756606,
                       YTM=.0971, months_coupon = 6)
teste01_NTN2<-PU_BRbond(dataEval = NULL,maturity="2026-08-15", coupon_rate = .06, VF = 3069.756606,
                       YTM=.0972, months_coupon = 6)

(teste01_NTN2/teste01_NTN-1)

