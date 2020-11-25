###Dev Setup -----
## INSTALL: CTRL + SHIFT + B
sDevTools::clearEnv() ## CTRL + SHIFT + R
library(sDevTools)
library(exprTools)
loadDependencies()
loadUtils()
#Check Usage -----
checks=checkPackageUsage()
runTests(package="exprTools")
#Dismiss Usage Warnings -----
#  suppressUsageWarnings(checks)
#Dev -----
new_fn((),#args
 desc=  ,#Function description
 return=  #Function returns
 )
