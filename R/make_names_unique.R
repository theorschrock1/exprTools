#' Make a character vector (of names) unique.

#' @name make_names_unique
#' @param x  [character] a character vector, usually names.
#' @return \code{make_names_unique}: [character(length(x))]
#' @examples
#' x=c('x','x', 'x(2)',NA, 'V1', 'V2', '', 'x(2)',"y","y","V", "x(2)")
#' make_names_unique(x)
#' any(duplicated(make_names_unique(x)))


#' @export
make_names_unique <- function(x) {
    # Make a character vector(of names) unique
    x <- assert_character(x)
    x[is.na(x)] <- ""
    x[x==""]<-"V"
    ognames=unique(x)
    vvars = x[grepl(start_with("V\\d+$"), x)]
    if (nlen0(vvars) && nlen0(x[x == ""])) {
        vn = str_remove(vvars, "V") %>% as.numeric()
        start = max(vn) + 1
        end = start + l(x[x == ""]) - 1
        x[x == ""] = paste0("V", seq(from = start, to = end, by = 1))
    }
   nn= make.unique(x)

   nn[nn%nin%ognames]=lapply(nn[nn%nin%ognames],function(xn){
        tmp=str_split(xn,"\\."%followed_by%"\\d{1,10}")[[1]]
        tmp[grepl("^\\d+$",tmp)]<- paste0("(",tmp[grepl("^\\d+$",tmp)],")")
        tmp%sep%""
    }) %>% unlist()
   nn
    # Returns: [character(length(x))]
}





