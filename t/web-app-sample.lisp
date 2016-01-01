(in-package :cl-user)
(defpackage web-app-sample-test
  (:use :cl
        :web-app-sample
        :prove))
(in-package :web-app-sample-test)

;; NOTE: To run this test file, execute `(asdf:test-system :web-app-sample)' in your Lisp.

(plan nil)

;; blah blah blah.

(finalize)
