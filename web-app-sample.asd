#|
  This file is a part of web-app-sample project.
|#

(in-package :cl-user)
(defpackage web-app-sample-asd
  (:use :cl :asdf))
(in-package :web-app-sample-asd)

(defsystem web-app-sample
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:plastic-toy-gun
               :arnesi
               :http-ink)
  :components ((:module "src"
                :components
                ((:file "web-app-sample"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op web-app-sample-test))))
