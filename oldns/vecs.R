

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
x[order(x)]
vec_equal_na(x)
x=vec_c(x,rational(1, 2), 1L, NA)
is.na(x)
duplicated(x)
lok<-data.table(x=1:4)
vec_proxy.vctrs_rational <- NULL
date1 <- ymd_hms("2009-03-08 01:59:59")
date2 <- ymd_hms("2000-02-29 12:00:00")
df<-interval(date2, date1)

df@.Data
lok[,x2:=t(rational(c(1, 2, 1, 2), c(1, 1, 2, 2)))]
vec_proxy(x)
x
vec_proxy_compare(x)


`%m%`<-function(x,y){
  if(missing(x))return(y)
}
s=1
class(Sys.time())



set_units("s",1)
unit_type(x="m")

