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
fn_call_name<-
 function(n=1){
   #Documentation
   fdoc("Get the name of the current function call","[character(1)]")
   #Assertions
   assert_integerish(n,len=1)
   #TO DO
   calls<-sys.calls()
   deparse(calls[[length(calls)-n]][[1]])

 }
#document------
 fn_document(fn_call_name,overwrite = TRUE)
