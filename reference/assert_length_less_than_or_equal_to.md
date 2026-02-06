# Assert Length Less Than or Equal To

Assert object length is less than or equal to a threshold

## Usage

``` r
assert_length_less_than_or_equal_to(
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
