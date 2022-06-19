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

commit_all_to_github(path = getwd())

remotes::install_github('theorschrock/exprTools')
guides()

open_guide('heroku.R')
remotes::install_github("theorschrock1/exprTools")

