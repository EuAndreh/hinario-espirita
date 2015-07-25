(defpackage hinario-espirita.util
  (:use cl
        hinario-espirita.readtable
        rutil)
  (:import-from cl-locale
                *locale*
                current-dictionary
                define-dictionary))
(in-package hinario-espirita.util)
(in-readtable web-syntax)

(defmacro abbrevs (&body body)
  (let ((pairs (group 2 body)))
   `(progn
      ,@(mapcar #`(abbr ,(car a1) ,(cadr a1))
                pairs)
       (export ',(mapcar [car _] pairs)))))

(abbrevs & strcat
         mp mapcar
         def defparameter
         strd string-downcase)

@export
(defun spit (str file &key (if-exists :supersede))
  (with-open-file (f file
                     :if-exists if-exists
                     :direction :output)
    (princ str f)))

@export
(defun get-music-key (path-or-string)
  (let ((str (etypecase path-or-string
               (pathname (uiop:read-file-string path-or-string))
               (string path-or-string))))
    (mv-bind (match capture)
        (#~m/^%TONALIDADE=(.*)/ str)
      (declare (ignore match))
      (aref capture 0))))

@export
(defmacro defvar-unbound (name &optional (doc-string ""))
  `(progn
     (defvar ,name)
     (setf (documentation ',name 'variable) ,doc-string)
     ',name))

@export
(defparameter *i18n-route* "")

@export
(defun root-link-to (url)
  (& "http://hinario-espirita.com.br" url))

@export
(defun link-to (url)
  (& "http://hinarioespirita.com.br" *i18n-route* url))

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
     ,@(mp #`(caveman2:defroute ,(if (stringp route)
                                         (& "/" a1 route)
                                         `(,(& "/" a1 (car route)) ,@(cdr route)))
                     ,args
                   ,@(if (emptyp a1)
                         body
                         `((let ((*locale* ,(mkeyw a1))
                                 (*i18n-route* ,(& "/" a1)))
                             ,@body))))
           (mp #'car *langs*))))

@export
(defun redirect (url)
  (caveman2:redirect (& *i18n-route* url)))

@export
(defmacro defdictionary (dict-name root)
  `(define-dictionary ,dict-name
     ,@(mp #`(,(mkeyw a1)
               (merge-pathnames ,(merge-pathnames (& (string-downcase a1) ".lisp") "i18n/")
                                 ,root))
           (mp #'car *langs*))))
