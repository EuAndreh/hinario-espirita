(ql:quickload :hinario-espirita)

(defpackage hinario-espirita.app
  (:use cl
        hinario-espirita.readtable
        hinario-espirita.config))
(in-package hinario-espirita.app)
(in-readtable web-syntax)

(lack:builder
 (:static
  :path [when (#~m"^(?:/images/|/lilypond/|/css/|/js/|/pdf/|/robot\.txt$|/favicon\.ico$)" _)
          _]
  :root *static-directory*)
 (unless (productionp)
   :accesslog)
 (:backtrace :output (config :error-log))
 :session
 hinario-espirita.web:*app*)
