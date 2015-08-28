(defpackage hinario-espirita.web
  (:use cl
        cool-read-macros
        hinario-espirita.util
        hinario-espirita.config
        hinario-espirita.view
        arrow-macros
        rutil)
  (:import-from caveman2
                <app>
                next-route
                on-exception)
  (:import-from cl-locale
                *locale*)
  (:import-from hinario-espirita.scripts
                hinarios))
(in-package hinario-espirita.web)
(in-readtable cool-readtable)

(setf *locale* :pt)

@export
(defparameter *app* (make-instance '<app>))

(defroute "/" ()
  (index))

(defroute "/partituras" ()
  (sheets-index))

(defroute "/criar" ()
  (hinarios-page))

(defroute ("/criar" :method :POST) (&key _parsed)
  (-<> (hinarios #%songs  #%keys)
    (fmt "/hinarios~a" <>)
    redirect))

(defroute "/hinarios/:ano/:mes/:dia/:uuid/" (&key ano mes dia uuid)
  (generated-hinario (fmt "/~a/~a/~a/~a/" ano mes dia uuid)))

(defmethod on-exception ((app <app>) (code (eql 404)))
  (declare (ignore app))
  (404-page))
