# Assert Length Less Than

Assert object length is less than a threshold

## Usage

``` r
assert_length_less_than(
  x,
  length,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  object to check length of

- length:

  expected length (number)

- msg:

  custom error message

- call:

  (logical) whether to preserve call in error message

- arg_name:

  (character) name of argument being tested

## Value

invisible(TRUE)
