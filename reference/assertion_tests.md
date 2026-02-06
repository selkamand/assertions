# Count tests per Assertion

Count the number of unit-tests per assertion. Note assertion_tests only
finds tests where `expect_` and `assert_` are on the same line.

## Usage

``` r
assertion_tests()
```

## Value

two column data.frame describing assertion name and number of tests
(expect_statement)
