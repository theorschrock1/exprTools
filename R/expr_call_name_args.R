#' Adds names to unnamed argments in a call and puts arguments in correct order.

#' @name expr_name_call_args
#' @param x  [call]
#' @return  [call] with all args named.
#' @examples

#' fn=function(a,b,c,d=0,e=0){
#'    return(a+b+c+d+e)
#' }
#' call=expr(fn(1,3,4))
#' expr_name_call_args(call)
#' call=expr(fn(d=1,e=3,4,3,1))
#' expr_name_call_args(call)
#' call=expr(fn(d=1,e=3,a=4,c=3,b=1))
#' expr_name_call_args(call)

#' @export
expr_name_call_args<-function (x,env=caller_env())
{
    assert_call(x)
    arg_names <- fn_fmls_names(eval(x[[1]],envir=env))

    if(!call_has_unnamed_args(x)){
        named_args <- call_args(x)
        out = c(named_args[arg_names %IN% names(named_args)],            named_args[names(named_args) %nin%arg_names])
        out <- expr(x(!!!out))
        out[[1]] <- x[[1]]

        return(out)

        }
    args <- call_args(x)



    un_named = args[names(args) == ""]
    names(un_named) <- arg_names[1:l(un_named)]
    named_args <- c(un_named, args[names(args) != ""])
    out = c(named_args[arg_names %IN% names(named_args)],
            named_args[names(named_args) %nin%arg_names])
    out <- expr(x(!!!out))
    out[[1]] <- x[[1]]
    out
}

