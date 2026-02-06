# Assert Length

Assert object has a specific length

## Usage

``` r
assert_length(
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
