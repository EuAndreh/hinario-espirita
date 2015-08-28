(defpackage hinario-espirita.config
  (:use cl
        cool-read-macros
        hinario-espirita.util
        rutil)
  (:import-from envy
                config-env-var
                defconfig))
(in-package hinario-espirita.config)
(in-readtable cool-readtable)

(setf (config-env-var) "APP_ENV")

@export
(defparameter *application-root* (asdf:system-source-directory :hinario-espirita))
@export
(defparameter *static-directory* (merge-pathnames #p"static/" *application-root*))

(defconfig :common
  `(:error-log ,(merge-pathnames "error.log" *application-root*)))

@export
(defun config (&optional key)
  (envy:config #.(package-name *package*) key))

(defun appenv ()
  (uiop:getenv (config-env-var #.(package-name *package*))))

@export
(defun productionp ()
  (string= (appenv) "production"))

(defdictionary :hinario *application-root*)
