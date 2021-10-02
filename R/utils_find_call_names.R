
find_call <- function(x) {

    lhs <- as.character(x[[1]])
    children <- call_args(x)


  c(lhs, flat_map_chr(children, find_call_rec))
}

find_call_rec <- function(x) {
  switch_expr(x,
              # Base cases
              constant = NULL,
              symbol =NULL,

              # Recursive cases
              pairlist = flat_map_chr(x, find_call_rec),
              call = find_call(x)
  )
}
