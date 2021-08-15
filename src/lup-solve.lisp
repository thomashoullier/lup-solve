;;;; Solve a linear system of equations given its LUP decomposition.
(in-package :lup-solve)

(defun solve (LU p b)
  "Solve the linear system of equations decomposed into L.U.x = P.b
   L is unit lower triangular. U is upper triangular.
   Both are stored in LU with the unit diagonal of L omitted.
   p stores the row permutations in a vector. P.b has element b_p(i) in
     the i-th position.
   b is a native vector with the right hand sides before permutation.
   Return x the solution vector."
  (let* ((n (nrows LU))
         (y (make-array n))
         (x (make-array n)))
    (loop for i from 0 below n do
      (setf (aref y i) (- (aref b (aref p i))
                          (loop for j from 0 upto (- i 1)
                                sum (* (aref LU i j) (aref y j))))))
    (loop for i from (1- n) downto 0 do
      (setf (aref x i) (/ (- (aref y i) (loop for j from (1+ i) below n
                                              sum (* (aref LU i j) (aref x j))))
                          (aref LU i i))))
    x))
