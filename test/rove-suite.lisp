;;;; Rove test suite for lup-solve.
(defpackage :lup-solve/test
  (:use :cl :rove))
(in-package :lup-solve/test)

(let ((LU #2A((5 6 3) (1/5 4/5 -3/5) (3/5 1/2 5/2)))
      (p #(2 0 1))
      (b #(3 7 8))
      (x #(-7/5 11/5 3/5)))
  (deftest lup-solve
    (testing "solve" (ok (equalp x (lup-solve:solve LU p b)) ""))))
