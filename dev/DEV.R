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
check_date_format<-
 function(x,format="ymd",null.ok=TRUE){
   #Documentation
   fdoc("Check if a string is in a valid date format","[TRUE|error_message]")
   #Assertions
   assert_choice(format, choices = c("ymd_h", "mdy_h", "dmy_h",
"ymd_hm", "mdy_hm", "dmy_hm", "ymd_hms", "mdy_hms", "dmy_hms",
"ym", "my", "yq",'ymd','mdy','dmy'))
   assert_logical(null.ok, len = 1)
   #TO DO
   if(is.null(x)&&null.ok==TRUE)
     return(TRUE)

   out<-do.call(format,list(x,quiet=T))
   if(is.na(out))
     return(glue('Must be in `{format}` date format'))
   return(TRUE)
 }
#document------
 fn_document(check_date_format,{
   check_date_format('2022-01-01',format="ymd")
   check_date_format('20-01-01',format="ymd")
   check_date_format('01/01/2022',format="ymd")
   check_date_format('01/30/2022',format="dmy")
   check_date_format('01/12/2022',format="dmy")
   check_date_format('01/12/2022 12:12:10',format="dmy")
   check_date_format('01/12/2022 12:12:10',format="dmy_hms")
 },overwrite = T)
