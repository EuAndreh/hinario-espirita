(defpackage hinario-espirita
  (:use cl)
  (:import-from hinario-espirita.config
                config)
  (:import-from clack
                clackup)
  (:export start
           stop))
(in-package hinario-espirita)

(defvar *appfile-path*
  (asdf:system-relative-pathname :hinario-espirita #p"app.lisp"))

(defvar *handler* nil)

(defun start (&key (server :woo) (port 1111) (debug t) &allow-other-keys)
  (when *handler*
    (restart-case (error "Server is already running.")
      (restart-server ()
        :report "Restart the server"
        (stop))))
  (setf *handler*
        (clackup *appfile-path*
                 :port port
                 :server server
                 :debug debug)))

(defun stop ()
  (prog1
      (clack:stop *handler*)
    (setf *handler* nil)))
