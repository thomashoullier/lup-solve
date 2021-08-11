# LUP-solve
`lup-solve` implements a (dead-simple) routine for solving linear
systems of equations when given a LUP decomposition.

## Scope
* LUP decomposition is not performed in the present package.
* The method implemented is the naive substitution that one
  would do by hand, variable by variable in triangular systems.
  It is described in [1].

## Usage

## Test

## See also
* [dtrsm](https://www.netlib.org/lapack/explore-html/d1/d54/group__double__blas__level3_ga6a0a7704f4a747562c1bd9487e89795c.html#ga6a0a7704f4a747562c1bd9487e89795c)
  is the rough LAPACK equivalent.

## References
1. T. H. Cormen, C. E. Leiserson, R. L. Rivest, and C. Stein, Introduction to
   Algorithms (MIT press, 2009).
