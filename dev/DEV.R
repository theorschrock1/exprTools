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
check_json<-
 function(x,check_output,null.ok=FALSE){
   #Documentation
   fdoc("Check that a string is a valid JSON object","[TRUE|error]")
   #Assertions
   check_output<-enexpr(check_output)
   assert_call(check_output)
   assert_logical(null.ok,len=1)
   #TO DO
   if(is.null(x)&&null.ok==TRUE)
     return(TRUE)
   out<-try(jsonlite::fromJSON(x),silent = T)

   if(is_error(out))
     return('Invalid JSON string')
   check<-expr_modify_fn_args( check_output,new_args=list(x=expr(out)))

   res=eval(check)
   if(!isTRUE(res))
     return(str_replace(res,'Must be','Must be a JSON string'))
   return(res)
 }
#document------
 fn_document(check_json,{

check_json(x='[1,3]',check_numeric(len=2))

check_json(x='[1,3]',check_numeric(len=1))

check_json(x='{"one":[1,3]}',check_named_list(structure=list(one=numeric())))

check_json(x='{"one":[1,3]}',check_named_list(structure=list(two=numeric())))

 })

commit_all_to_github()
