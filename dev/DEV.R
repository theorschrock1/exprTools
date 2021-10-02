#Check Usage -----
checks=checkPackageUsage()
runTests(package="exprTools")
#Dismiss Usage Warnings -----
#  suppressUsageWarnings(checks)
###Dev Setup -----
## INSTALL: CTRL + SHIFT + B
sDevTools::clearEnv() ## CTRL + SHIFT + R
library(sDevTools)
sDevTools::loadUtils()
#Dev -----
ccat<-
 function(x){
   #Documentation
   fdoc("print a character vector as r code","[string]")
   #Assertions
   assert_character(x)
   #TO DO
 as_glue( expr_text(x))
 }
#document------
 fn_document(ccat,{
ccat(x=c("a","b","c"))
 })

