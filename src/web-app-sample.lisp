(in-package :cl-user)
(defpackage web-app-sample
  (:use :cl)
  (:import-from :plastic-toy-gun
                :make-server
                :start
                :dispose
                :*log*
                :*debug-log*
                :*cartridge*)
  (:import-from :http-ink
                :ink
                :defroutes
                :defroute
                :*expire-time*)
  (:import-from :arnesi
                :getenv )
  (:import-from :http-ink.response-util
                :respond-with-html
                :respond-with-file
                :set-public-dir)
  (:export :run))
(in-package :web-app-sample)

(defvar *PORT* (parse-integer (or (getenv "PORT")
                                  "8080")))
(defvar *HOST* (or (getenv "HOST")
                   "0.0.0.0"))
;; log
(setq *log* t)
(setq *debug-log* t)
;; 7days
(setq *expire-time* (* 60 60 24 7))
;; use http server
(setq *cartridge* #'ink)

(http-ink.response-util:set-public-dir #p"./public")

(http-ink:defroutes
 (:get "/" () (respond-with-file http-ink::env "./public/index.html"))
 (:get "/hello" () (respond-with-html http-ink::env "hello")))

(defun run ()
  (let ((server (make-server :port *PORT* :address *HOST*)))
    (handler-case
     (start server)
     (error (c) c))))
