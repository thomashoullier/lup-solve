# LUP-solve
`lup-solve` implements a (dead-simple) routine for solving linear
systems of equations when given a LUP decomposition.

## Scope
* LUP decomposition is not performed in the present package. LUP
  decomposition is a whole can of worms in itself.
* The method implemented is the naive substitution that one
  would do by hand, variable by variable in triangular systems.
  It is described in [1].
* We solve for square systems (same number of variables as equations).

## Usage
**solve** LU p b => x

Solve the linear system of equations decomposed into L.U.x = P.b
* L is unit lower triangular. U is upper triangular. Both are stored
  in LU with unit diagonal of L omitted.
* p stores the row permutations in a vector. P.b has element b\_p(i) in
  the i-th position.
* b is a vector with the right hand sides before permutation.

Return x the solution vector.

```common-lisp
(let ((LU #2A((5 6 3) (1/5 4/5 -3/5) (3/5 1/2 5/2)))
      (p #(2 0 1))
      (b #(3 7 8)))
  (solve L U p b))
;; => #(-7/5 11/5 3/5)
```

## Test
Launch tests with:

```common-lisp
(asdf:test-system "lup-solve")
```

## Dependencies
* `lup-solve`:
  * [mat-ops](https://github.com/thomashoullier/mat-ops)
* `lup-solve/test`:
  * [rove](https://github.com/fukamachi/rove)

## See also
* [dtrsm](https://www.netlib.org/lapack/explore-html/d1/d54/group__double__blas__level3_ga6a0a7704f4a747562c1bd9487e89795c.html#ga6a0a7704f4a747562c1bd9487e89795c)
  is the rough LAPACK equivalent.

## References
1. T. H. Cormen, C. E. Leiserson, R. L. Rivest, and C. Stein, Introduction to
   Algorithms (MIT press, 2009).
