#' @importFrom R6 R6Class
FindUndefined = R6::R6Class(
  'FindUndefined',
  public = list(
    expr=NULL,
    tmp_expr=NULL,
    vars_found=NULL,
    vars_not_found=character(),
    initialize = function(expr,init_vars) {
      self$expr=expr
      self$vars_found=init_vars
    },
    find_undefined= function(x=self$expr) {
      #replacement<-'list'
      #if(is.null(index))print("NULL")


      #  x=self$tmp_formula
      #x=call_args(x)[[1]]
      # self_expr= expr(x[[2]])
      constant_f=function(x)return()

      switch_expr(
        x,
        # Base cases
        constant = constant_f(x),
        symbol = as.character(x),
        # Recursive cases
        pairlist = {
          out= flat_map_chr(
            .x = as.list(x[-1]),
            .f = self$find_undefined)
          append(self$vars_not_found)<-unlist(out)%NIN%self$vars_found
        },
        call = {
          is_assign=is_assignment(x)&&is_symbol(x[[2]])
          out=if(is_assign){
            self$find_undefined(x[[3]])
          }else{
            flat_map_chr(call_args(x),self$find_undefined)
          }
          append(self$vars_not_found)<-unlist(out)%NIN%self$vars_found
          if(is_assign)
            append(self$vars_found)<-as.character(x[[2]])
        })

    },
    find_undefined_wrapper=function(){
      self$find_undefined()
      return(self$vars_not_found)
    }))


