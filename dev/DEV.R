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
new_fn((),#args
 desc=  ,#Function description
 return=  #Function returns
 )




add_snapshot_test('check_json',{

x<-jsonlite::toJSON(list(inputId='dfs',
                           label="Date",
                           value = NULL,
                           min = '2021-01-01',
                           max ='2022-01-01',
                           format =  "yyyy-mm-dd",
                           startview ="month"),null='null')
check_json(x,check_named_list(structure=list(
  inputId=string(),
  label=string(),
  value = date_format(NULL,format='ymd'),
  min = date_format(NULL,format='ymd'),
  max =date_format(NULL,format='ymd'),
  format = string(date( "yyyy-mm-dd")),
  startview = choice("month",choices=c("month","year","decade"))))
)
})
