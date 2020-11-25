## INSTALL: CTRL + SHIFT + B

###Dev Setup -----
library(exprTools)
library(sDevTools)
loadDependencies()
loadUtils()
#Check Usage -----
# test_package(exprTools)
wn<-checkPackageUsage()
testthat::test_package("exprTools")
#Dismiss Usage Warnings -----
 #  suppressUsageWarnings(wn)
#Dev ----
 #new_dev_function()


#document ----

#test ----
## INSTALL: CTRL + SHIFT + B

# Refresh Dev =====
#refresh_dev()
