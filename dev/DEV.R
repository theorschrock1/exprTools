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

build_test("expr_extract_call",init=NULL,{
  expr_extract_call(expr({
    assert_all(x)
    assert_fun(x)
    x<-assert_mult(x)
    if(x){
      x<-assert_character(x)
    }
    fn=function(x){x+1}
  }),call_name="assert",grep=TRUE,skip_first = FALSE)
  expr_extract_call(expr(data[,sum(x)]),call_name="sum",grep=FALSE,skip_first = FALSE)
  expr_extract_call(expr(data[,list(sum(x),mean(x))]),call_name=c("sum","mean"),grep=FALSE,skip_first = FALSE)
})
