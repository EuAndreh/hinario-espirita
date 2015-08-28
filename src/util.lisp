(defpackage hinario-espirita.util
  (:use cl
        cool-read-macros
        rutil)
  (:import-from cl-locale
                *locale*
                current-dictionary
                define-dictionary)
  (:import-from let-over-lambda
                if-match)
  (:export &))
(in-package hinario-espirita.util)
(in-readtable cool-readtable)

(abbr & strcat)

@export
(defun spit (str file &key (if-exists :supersede))
  (with-open-file (f file
                     :if-exists if-exists
                     :direction :output)
    (princ str f)))

@export
(defmethod get-music-key ((path-or-string string))
  (if-match (#~m/^%TONALIDADE=(.*)/ path-or-string)
      $1))

(defmethod get-music-key ((path-or-string pathname))
  (get-music-key (uiop:read-file-string path-or-string)))

@export
(defparameter *i18n-route* "")

@export
(defun root-link-to (url)
  (& "http://hinario-espirita.com.br" url))

@export
(defun link-to (url)
  (root-link-to (& *i18n-route* url)))

@export
(defparameter *langs*
  '(("pt" . "Português")
    ("en" . "English")))

@export
(defmacro defroute (route args &body body)
  `(progn
     (caveman2:defroute ,route ,args
       (let ((*i18n-route* ""))
        ,@body))
     ,@(mapcar #`(caveman2:defroute ,(if (stringp route)
                                         (& "/" a1 route)
                                         `(,(& "/" a1 (car route)) ,@(cdr route)))
                     ,args
                   ,@(if (emptyp a1)
                         body
                         `((let ((*locale* ,(mkeyw a1))
                                 (*i18n-route* ,(& "/" a1)))
                             ,@body))))
           (mapcar #'car *langs*))))

@export
(defun redirect (url)
  (caveman2:redirect (& *i18n-route* url)))

@export
(defmacro defdictionary (dict-name root)
  `(define-dictionary ,dict-name
     ,@(mapcar #`(,(mkeyw a1)
               (merge-pathnames ,(merge-pathnames (& (string-downcase a1) ".lisp") "src/i18n/")
                                 ,root))
           (mapcar #'car *langs*))))
