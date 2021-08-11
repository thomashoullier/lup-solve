;;;; Solve a linear system of equations given its LUP decomposition.
(in-package :lup-solve)

(defun solve (L U p b)
  "Solve the linear system of equations decomposed into L.U.x = P.b
   L is unit lower triangular. Native 2D array.
   U is upper triangular. Native 2D array.
   p stores the row permutations in a vector. P.b has element b_p(i) in
     the i-th position.
   b is a native vector with the right hand sides before permutation.
   Return x the solution vector."
  (let* ((n (nrows L))
         (y (make-array n))
         (x (make-array n)))
    (when (not (and (squarep L) (squarep U)
                    (= n (nrows U) (length p) (length b))))
      (error "lup-solve:solve : There is some dimension mismatch."))
    (loop for i from 0 below n do
      (setf (aref y i) (- (aref b (aref p i))
                          (loop for j from 0 upto (- i 1)
                                sum (* (aref L i j) (aref y j))))))
    (loop for i from (1- n) downto 0 do
      (setf (aref x i) (/ (- (aref y i) (loop for j from (1+ i) below n
                                              sum (* (aref U i j) (aref x j))))
                          (aref U i i))))
    x))
