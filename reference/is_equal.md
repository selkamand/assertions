# Check equality of two objects

Is `x` equal to `y`. powered by the
[`all.equal()`](https://rdrr.io/r/base/all.equal.html) function.

## Usage

``` r
is_equal(
  x,
  y,
  tolerance = sqrt(.Machine$double.eps),
  check_names = TRUE,
  check_environment = TRUE,
  check_tzone = TRUE
)
```

## Arguments

- x:

  first object to compare

- y:

  second object to compare

- tolerance:

  Differences smaller than tolerance are not reported. The default value
  is close to 1.5e-8 (numeric \>= 0).

- check_names:

  should the names(.) of target and current should be compare (flag)

- check_environment:

  should the environments of functions should be compared? You may need
  to set check.environment=FALSE in unexpected cases, such as when
  comparing two nls() fits. (flag)

- check_tzone:

  should "tzone" attributes be compared. Important for comparing POSIXt
  objects. (flag)

## Value

TRUE if x is equal to y

## Examples

``` r
if(interactive()){
is_equal(1, 1) #TRUE
is_equal(c(1, 2), 1) #FALSE

is_equal(c("A", "B"), c("A", "B")) #TRUE
is_equal("A", "B") #FALSE
}
```
