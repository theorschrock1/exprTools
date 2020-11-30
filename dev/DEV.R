#Check Usage -----
checks=checkPackageUsage()
runTests(package="exprTools")
#Dismiss Usage Warnings -----
#  suppressUsageWarnings(checks)
###Dev Setup -----
## INSTALL: CTRL + SHIFT + B
sDevTools::clearEnv() ## CTRL + SHIFT + R
library(sDevTools)
library(exprTools)
loadUtils()
#Dev -----
expr_deparse_lines<-
 function(x){
   #Documentation
   fdoc("deparse multiple lines of R code","[character]")
   #Assertions
   x<-enexpr(x)
   assert_call(x, call_name = "{")
   #TO DO
   as_glue(exprs_deparse(call_args(x)))
 }
#document------
 fn_document(expr_deparse_lines,{
expr_deparse_lines({
  sq<-function(x){
    x^2
    }
  sq(2)
  sq(4)
})})
