## INSTALL: CTRL + SHIFT + B

###Dev Setup -----
library(sDevTools)
library(exprTools)
loadDependencies()
loadUtils()
#Check Usage -----
# test_package(exprTools)
wn<-checkPackageUsage()
testthat::test_package("exprTools")
#Dismiss Usage Warnings -----
 #  suppressUsageWarnings(wn)
#Dev -----
    #new_dev_function()
package_exists<-function(pkg){
   assert_string(pkg)
  fdoc("Check if a package exist","[Logical(1)]")
  pkg%in%installed_packages()
}
#document ----
fn_document(package_exists,{
  package_exists("data.table")
})
#test ----
## INSTALL: CTRL + SHIFT + B
build_test("package_exists",
init=NULL,
test_code=!!package_exists_examples
)
# Refresh Dev =====
  #refresh_dev()
