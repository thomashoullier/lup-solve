;;;; Rove test suite for lup-solve.
(defpackage :lup-solve/test
  (:use :cl :rove))
(in-package :lup-solve/test)

(let ((L #2A((1 0 0) (0.2 1 0) (0.6 0.5 1)))
      (U #2A((5 6 3) (0 0.8 -0.6) (0 0 2.5)))
      (p #(2 0 1))
      (b #(3 7 8))
      ;; Solution assuming single-precision computations.
      (x #(-1.4000002 2.2 0.6)))
  (deftest lup-solve
    (testing "solve" (ok (equalp x (lup-solve:solve L U p b)) ""))))
