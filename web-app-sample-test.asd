#|
  This file is a part of web-app-sample project.
|#

(in-package :cl-user)
(defpackage web-app-sample-test-asd
  (:use :cl :asdf))
(in-package :web-app-sample-test-asd)

(defsystem web-app-sample-test
  :author ""
  :license ""
  :depends-on (:web-app-sample
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "web-app-sample"))))
  :description "Test system for web-app-sample"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
