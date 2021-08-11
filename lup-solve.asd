(defsystem lup-solve
  :name "lup-solve"
  :author "Thomas HOULLIER"
  :depends-on ("mat-ops")
  :components
  ((:module "src"
    :components ((:file "package")
                 (:file "lup-solve" :depends-on ("package")))))
  :in-order-to ((test-op (test-op "lup-solve/test"))))

(defsystem lup-solve/test
  :name "lup-solve/test"
  :depends-on ("rove" "lup-solve")
  :components
  ((:module "test"
    :components ((:file "rove-suite"))))
  :perform (test-op (o c) (symbol-call :rove '#:run c)))
