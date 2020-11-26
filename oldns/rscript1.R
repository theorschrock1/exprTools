
devtools::document()
expr_reduce=function(x,func=`%>%`){
  assert_list(x)
  f<-enexpr(func)
  assert_function(func)
  .build=function(x,y,func){
    tmp=expr(f(!!x,!!y))
    tmp[[1]]<-func
    tmp
  }

  reduce(x,.build,func=f)


}
write_fn_to_package(expr_reduce,description = "Build code to reduce a list to a single value by iteratively applying a binary function",return="An R expression")
package_document()
package_rebuild()
fn<-function(x,...){

}
fn_fmls_names(fn)
x=expr(fn(x,y=fd))
expr_call_name_args=function(x){
  assert_call(x)
  arg_names<-fn_fmls_names(eval(x[[1]]))
  args<-call_args(x)
  un_named=args[names(args)=='']
  names(un_named)<-arg_names[1:l(un_named)]
  named_args<-c(un_named,args[names(args)!=''])
  out=c(named_args[arg_names%IN%names(named_args)],named_args[names(named_args)%nin%  arg_names])
  out<-expr(f(!!!out))
  out[[1]]<-x[[1]]
}



 x = expr({

  x = 1

  })

  y = expr({

  x <- 1

  })
expr_name

call=expr(is_expr_equal(x,y))
wrap_tic=function(x){
  if(expr_has_call_name(x,"{")){
    br=expr_extract_call(x,"{")
    replace<-lapply(br,wrap_tic)
    for(i in 1:l(br)){
      x=expr_find_replace(br[[i]],replacement = replace[[i]],in_expr =x)
    }
  }
  lines = deparse(x) %>% fix_lines()
  lines = str_trim(lines[2:(l(lines) - 1)])

  tmp=str_sub(str_replace_all(str_trim(lines),"\'","\""),start=1,end=25)

  body = glue("tic('{tmp}')\n{lines}\ntoc(quiet=TRUE,log=TRUE)") %sep%"\n"
  body <- glue("{\n&&body&&\n}", .open = "&&", .close = "&&") %>% parse_expr()
  return(body)
}
expr_fn_timelines <- function(call, rep = 1) {
  # Times each line in run in a function
  call <- enexpr(call)
  assert_call(call)
  assert_integerish(rep, len = 1)
  fn = eval(call[[1]])
  fn_b<-fn_body(fn)
  body=wrap_tic(fn_b)
  body<-expr_eval(expr_find_replace(expr(!!call[[1]]), expr(tmp_fn),in_expr = body))
  tmp_fn <- new_function(fn_fmls(fn), body)

  library(tictoc)

  tic.clearlog()
  for (i in 1:rep) {
    tic("Total Time")
   expr_eval(tmp_fn(!!!call_args(call)))
    toc(log = TRUE,quiet=TRUE)
  }
  tic.log(format = FALSE) %>% rbindlist()
  iter[, `:=`(elapsed, toc - tic)]
  DTnull(iter, c("tic", "toc"))
  iter <- iter[, .(elapsed = mean(elapsed)), by = .(line_num, msg)]

  iter[, `:=`(`time%`, elapsed/sum(elapsed))]
  setcolorder(iter, c("line_num", "elapsed", "time%", "msg"))
  iter <- iter[order(-elapsed)]
  print(glue_data(iter[elapsed > 0], "Line {line_num}: {round(elapsed,3)} sec ({round(`time%`,3)}%) : {ifelse(str_count(msg)>40,paste0(str_sub(msg,start=1,end=40),'...'),msg)}"))
  g_print("
            Avg Total Run Time:{ round(sum(iter$elapsed),4)} sec")
  invisible(iter)
  # Returns: invisible([data.table]) showing the elased times of each line
}





fn=function(x){
tic("outer")
for (x in 1:10)
{
  tic("hi")
  Sys.sleep(1)
  toc(log = TRUE, quiet = TRUE)
}
return(lapply(out,length))
}


body<-fn_body(fn)
bodylines=call_args(body)
expr({!!!bodylines})
lastExpr=bodylines[[l(bodylines)]]
if(is_return(lastExpr)){
  expr(`<-`out,!!lastExpr[[2]])
}


for (x in 1:10)
{
  Sys.sleep(1)
}
log.txt <- tic.log(format = TRUE)
log.txt
log.lst <- tic.log(format = FALSE)
log.lst
tic('msg')
Sys.sleep(3)
toc()
tic.log()
n_b<-sum(str_count(lines,"\\{(.|\n)*\\}"))
str_replace(lines,"\\{(.|\n)*\\}","&&")
iter = 1:l(lines)

}
x=expr({
  if(something){
    lapply(list,len(x))
  }})
wrap_tic(x)
package_document()
expr_find_replace(find=,replacement = expr({
 count(x)
}),in_expr =x)
call_has_unnamed_args=function(x){
  fn_description("Test if a call has unnamed arguements")
  fn_returns("[Logical(1)]")

  assert_call(x)
  args <- call_args(x)
  any(names(args)=="")
}
fn_document(call_has_unnamed_args,{
x=expr(fn(x,y))
call_has_unnamed_args(x)
x=expr(fn(x=x,y=y))
call_has_unnamed_args(x)
},overwrite = TRUE)


expr_call_modify=function(call_expr,...){
  fn_description("Modify arguments in a call. Use zap() to remove an argument.")
  fn_returns("[Call]")
  assert_call(call_expr)
  call_expr<-expr_name_call_args(call_expr)
  fn_arg_names<-fn_fmls_names(eval(call_expr[[1]]))
  new_args=enexprs(...)
  if(!names(new_args)%all_in%fn_arg_names&&'...'%nin%fn_arg_names)
    g_stop('{as.character(  call_expr[[1]])} does not support argument/s: [{names(new_args)%NIN%fn_arg_names%sep%","}]. Valid arguments are [{fn_arg_names%sep%","}]')
  remove_args<-names(new_args)[new_args==expr(zap())]
  if(!len0(remove_args)){
    new_args<-new_args[names(new_args)%nin%remove_args]
    remove_args<- rep_named(remove_args, list(zap()))
    new_args= c(new_args,remove_args)
  }
  out<-call_modify(call_expr, !!!new_args)

  expr_name_call_args(out)
}
fn_document(expr_call_modify,{
  fn=function(a,b,c,d=0,e=0){
    return(a+b+c+d+e)
  }
  call=expr(fn(1,3,4))
  expr_call_modify(call,a=10)
  expr_call_modify(call,d=5)
  expr_call_modify(call,f=3)
  fn=function(a,b,c,d=0,e=0,...){
    return(a+b+c+d+e)
  }
  call_expr=expr(fn(1,3,4))
  expr_call_modify(call_expr,f=3,a=zap())
})
package_rebuild()
look<-tidy_source("R/expr_call_modify.R")
tidy_f
?call_modify

call=expr(fn())
expr_fn_timelines=function(call,rep=1){
  fn_description("Times each line in run in a function")
  fn_returns("invisible([data.table]) showing the elased times of each line")
  call<-enexpr(call)
  assert_call(call)
  assert_integerish(rep,len=1)
  #assert_i(call)
  fn=eval(call[[1]])
  lines=deparse(fn_body(fn)) %>% fix_lines()

  lines=lines[2:(l(lines)-1)]
  iter=1:l(lines)
  body=glue("tic('{str_trim(lines)}')\n{lines}\ntime[[{iter}]]<-toc(quiet=TRUE)")%sep%"\n"
  body<-glue('{\ntime=list()\n&&body&&\nreturn(time)\n}',.open="&&",.close="&&") %>% parse_expr()
  tmp_fn<-new_function(fn_fmls(fn),body)
  library(tictoc)
  iter=list()
  for(i in 1:rep){
    tmp=expr_eval(tmp_fn(!!!call_args(call))) %>% rbindlist()
    tmp[,line_num:=seq_len(len(tmp))]
    iter<-rbindlist(list(iter,tmp))
  }

  iter[,elapsed:=toc-tic]
  DTnull(iter,c("tic","toc"))
  iter<-iter[,.(elapsed=mean(elapsed)),by=.(line_num,msg)]
  iter[,`time%`:=elapsed/sum(elapsed)]
  setcolorder(iter,c('line_num',"elapsed","time%",'msg'))
  iter<-iter[order(-elapsed)]
 print(glue_data(iter[elapsed>0],"Line {line_num}: {round(elapsed,3)} sec ({round(`time%`,3)}%) : {ifelse(str_count(msg)>40,paste0(str_sub(msg,start=1,end=40),'...'),msg)}"))
  invisible(iter)

}

fn_document(expr_fn_timelines,{
  library(data.table)
  fn=function(){
  ChickWeight = as.data.table(ChickWeight)
  setnames(ChickWeight, tolower(names(ChickWeight)))
  DT <- melt(as.data.table(ChickWeight), id=2:4)


  dcast(DT, time ~ variable, fun=mean)
  dcast(DT, diet ~ variable, fun=mean)
  dcast(DT, diet+chick ~ time, drop=FALSE)
  dcast(DT, diet+chick ~ time, drop=FALSE, fill=0)


  dcast(DT, chick ~ time, fun=mean, subset=.(time < 10 & chick < 20))
  }
time_table<-expr_fn_timelines(fn())
time_table

  time_table<-expr_fn_timelines(fn(),rep=20) #repeat call 20 times and average
  time_table
  },overwrite = T)

package_document()
x=deparse(x)
fix_lines(x)
fix_lines=function(x){
  .fix_lines=function(x,n){
    out=x[n]

    is_p_error=TRUE
    while(  is_p_error){

     test<-try(parse_expr( out),silent = T)
     is_p_error=is_error(test)
     #print(is_p_error)
     #print(out)
     if(is_p_error){
       n=n+1
       out<-paste(out,x[n],sep="\n")
     }
    }
    n=n+1
    return(list(str=out,n=n))
  }
  require(zeallot)
  x=x[-1]

  x=x[-l(x)]
  out=NULL
  n=1
  while(n<=l(x)){
    c(str,n)%<-%.fix_lines(x,n=n)
    out=c(out,str)
    }
  c("{",out,"}")
}

package_document()

m=rnorm(10)
s=m
n=1:10
new_weighted_vctr<- function(m = double(), s = double(),n=integer()) {
  vec_assert(m, ptype = double())
  vec_assert(s, ptype = double())
  vec_assert(n, ptype = integer())
  new_rcrd(df_list(m = m, s = s,n=n), class = "weighted_vctr")
}
weighted_vctr <- function(m, s, n = 1L) {
  if(missing(s))s=m
  s <- vec_cast(s, double())
  m <- vec_cast(m, double())

  n<- vec_cast(n, integer())
  c(m, n) %<-% vec_recycle_common(m, n)
  # should check that r < 10^scale
  new_weighted_vctr(m = m, s = s, n = n)
}
format.weighted_vctr <- function(x, ...) {
  x=field(x, "m")
  out=as.character(x)
  out[is.na(x) ] <- NA
out
}
data.table(x=data.frame(weighted_vctr(10:20)))

data.tabe(weighted_vctr(10:20),x)

dtb<-environment(data.table)
x=list(x=weighted_vctr(10:20))
dtb$as.data.table.list(x)
vec_ptype2.weighted_vctr <- function(x, y, ...) UseMethod("vec_ptype2.weighted_vctr", y)
vec_ptype2.weighted_vctr.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}
vec_ptype2.weighted_vctr.weighted_vctr <- function(x, y, ...) new_weighted_vctr()
vec_ptype2.weighted_vctr.double <- function(x, y, ...)  new_weighted_vctr()
vec_ptype2.double.weighted_vctr <- function(x, y, ...) new_weighted_vctr()

vec_cast.weighted_vctr <- function(x, to, ...) UseMethod("vec_cast.weighted_vctr")
vec_cast.weighted_vctr.default <- function(x, to, ...) vec_default_cast(x, to)
vec_cast.weighted_vctr.weighted_vctr <- function(x, to, ...) x
vec_cast.double.weighted_vctr <- function(x, to, ...) field(x, "m")
vec_cast.weighted_vctr.double <- function(x, to, ...) weighted_vctr(x)

x<-vec_c(weighted_vctr(1:10), 1, NA)
mean(x)
vec_proxy(x)
x==x
sort(x)
vec_arith.weighted_vctr <- function(op, x, y, ...) {
  UseMethod("vec_arith.weighted_vctr", y)
}
vec_arith.weighted_vctr.default <- function(op, x, y, ...) {
  stop_incompatible_op(op, x, y)
}


vec_arith.weighted_vctr.weighted_vctr <- function(op, x, y, ...) {
  switch(
    op,
    "+" = {
      s=field(x,"s")+field(y,"s")
      n=field(x,"n")+field(y,"n")
      m=s/n
      new_weighted_vctr(m,s,n)
    },
    stop_incompatible_op(op, x, y)
  )
}
open_fn_source(assert_call)

vec_math.weighted_vctr <- function(.fn, .x, ...) {
  switch(.fn,
         mean ={
          s=sum(field(.x, "s"),na.rm = T)
          n=sum(field(.x,"n"),na.rm=T)
          new_weighted_vctr(m=s/n,s=s,n=s)
          },
           vec_math_base(.fn, .x, ...)
  )
}

DT(data.frame(x=weighted_vctr(rnorm(100)),
           y=weighted_vctr(rnorm(100)),
           z=rep(letters[1:5],20)))
data.table(weighted_vctr(rnorm(100)))
vec_equal_na(weighted_vctr(rnorm(100)))


new_rational <- function(n = integer(), d = integer()) {
  vec_assert(n, ptype = integer())
  vec_assert(d, ptype = integer())

  new_rcrd(list(n = n, d = d), class = "vctrs_rational")
}

rational <- function(n, d) {
  c(n, d) %<-% vec_cast_common(n, d, .to = integer())
  c(n, d) %<-% vec_recycle_common(n, d)

  new_rational(n, d)
}

x <- rational(1, 1:10)

format.vctrs_rational <- function(x, ...) {
  n <- field(x, "n")
  d <- field(x, "d")

  out <- paste0(n, "/", d)
  out[is.na(n) | is.na(d)] <- NA

  out
}

vec_ptype_abbr.vctrs_rational <- function(x, ...) "rtnl"
vec_ptype_full.vctrs_rational <- function(x, ...) "rational"


vec_ptype2.vctrs_rational <- function(x, y, ...) UseMethod("vec_ptype2.vctrs_rational", y)
vec_ptype2.vctrs_rational.default <- function(x, y, ..., x_arg = "x", y_arg = "y") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}
vec_ptype2.vctrs_rational.vctrs_rational <- function(x, y, ...) new_rational()
vec_ptype2.vctrs_rational.integer <- function(x, y, ...) new_rational()
vec_ptype2.integer.vctrs_rational <- function(x, y, ...) new_rational()

vec_cast.vctrs_rational <- function(x, to, ...) UseMethod("vec_cast.vctrs_rational")
vec_cast.vctrs_rational.default <- function(x, to, ...) vec_default_cast(x, to)
vec_cast.vctrs_rational.vctrs_rational <- function(x, to, ...) x
vec_cast.double.vctrs_rational <- function(x, to, ...) field(x, "n") / field(x, "d")
vec_cast.vctrs_rational.integer <- function(x, to, ...) rational(x, 1)
gcd <- function(x, y) {
  r <- x %% y
  ifelse(r, gcd(y, r), y)
}

vec_proxy_equal.vctrs_rational <- function(x, ...) {
  n <- field(x, "n")
  d <- field(x, "d")
  gcd <- gcd(n, d)

  data.frame(n = n / gcd, d = d / gcd)
}
x <- rational(c(1, 2, 1, 2), c(1, 1, 2, 2))
vec_proxy_compare.vctrs_rational <- function(x, ...) {
  field(x, "n") / field(x, "d")
}

lok<-data.table(x=x)
lok[,V1:=weighted_vctr(V1)]
=rational(V1,2)
x=expr({
  x
  y
})
package_document()
error_part=call_args(expr({

})
x<-expr(d[sys.Date(),sum(._xcut._SDcol[._xcut._GRP[[.GRP]]], na.rm = TRUE)])

replace_calls_in_expr(x)
call_modify(x, na.rm = zap())


replace_fixed_names_for_error=function(x){
nb<-expr_extract_named_bracket(x,'._SDcol',skip_first = F,grep=TRUE)
if(!len0(x)){
replacement<-lapply(nb,function(x) as.character(x[[2]])%>% str_remove_all("\\._SDcol") %>% str_remove_all("\\._") %>% sym())
for(i in 1:length(nb)){
  x=expr_find_replace(nb[[i]],replacement =replacement[[i]],x )
}
}
call_modify(x, na.rm = zap())
}
df<-as.character(nb[[2]])

fn_fmls_names(sum.default)
tmp_func<-eval(x[[1]])
s3Default<-paste0(as.character(x[[1]]),".default")
fn_args=args(tmp_func)
arg_names<-NULL
if(!is.null(fn_args))
  arg_names<-fn_fmls_names(args(tmp_func))
if( exists(s3Default)){
  arg_names=unique(c(arg_names,names(formals(eval(sym(s3Default))))))
}
update_args=new_args[names(new_args)%nin%is_present]
update_args= update_args[names(update_args)%in% arg_names]


sloop::ftype(sum)
fs<-mean
lok<-expr(!!fs)
lok[[1]]
fn_fmls_names(args(sum))
fn <- function(a = 1, b = 2) fn_fmls()
fn()

v_collect=function(env=caller_env()){
  fn_description('Collects the names of the inputs into a function.  Useful for passing variable names into error messages. Variable names are assigned to the function environment as .{arg_name}')
  fn_returns("NULL")
  assert_environment(env)
  vargs<-eval(expr(fn_fmls_syms()),envir = env)
  dots<-vargs[vargs=="..."]
  vargs<-vargs[vargs!="..."]
  vnames=as.character(  vargs)
  vnames=syms(glue('.{as.character(vnames)}'))
  out<-expr_glue('{vnames}<-enexpr({vargs})')
  if(!len0(dots)){
    out=c(out,expr(.dotslist<-enexprs(...)))
  }
  exprs_eval(out,env=caller_env())
}

fn_document(v_collect,{
example_fn<-function(x,y,z){
  v_collect()
  print(.x)
  print(.y)
  print(.z)
}
example_fn(a,b,c)
example_fn(V1,V2,V3)
example_fn(1,2,3)
})
package_document()
expr_find_replace_all=function(find,replacement,in_expr){
  fn_description("Find and replace multiple matches in an R expr")
  fn_returns("[expr(1)]")
  assert_exprs(find)
  assert_exprs(replacement,len=length(find))
  assert_expr(in_expr)
  for(i in 1:l(find)){
    in_expr=expr_find_replace(find=find[[i]],replacement=replacement[[i]],in_expr=in_expr)
  }
  in_expr
}
fn_document(expr_find_replace_all,{
in_expr=expr(data[,.(J),by=by])
find = exprs(data,J,by)
replacement= exprs(mtcars,sum(mpg),.(cyl,vs))
expr_find_replace_all(find,replacement,in_expr)
})
# expr_to_str=function(x){
#  assert_expr(x)
#  fn_description("Convert an expr into a character string")
#  fn_returns("[Character(1)]")
#
#  expr_deparse(x)%sep%'\n'
# }
# fn_document(expr_to_str,{
# x<-expr(x+y+z)
# expr_to_string(x)
# })
# package_document()


args2list=function(env=caller_env()){
  fn_description("Collect all function arguements as a list.  This function should be called before any assignments as the function collects the current function environment.")
  fn_returns("[list] function arguments")
  assert_environment(env)
  as.list(env)
}

fn_document(args2list,{

  fn=function(a,b){
    args2list()
  }
  fn(a=1,b=3)
})
package_document()
