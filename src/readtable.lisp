(defpackage hinario-espirita.readtable
  (:use cl
        rutil)
  (:import-from annot
                defannotation)
  (:import-from annot.util
                definition-form-symbol)
  (:import-from cl-locale
                i18n
                locale-syntax)
  (:import-from cl-reexport
                reexport-from)
  (:import-from lol
                defmacro!
                segment-reader
                subst-mode-ppcre-lambda-form)
  (:import-from named-readtables
                defreadtable)
  (:export disable-hash-table-pprinter
           enable-hash-table-pprinter
           web-syntax
           _parsed
           _))
(in-package hinario-espirita.readtable)
(reexport-from :named-readtables)

(defmacro! equal-hash-table (&rest contents)
  (flet ((repeated-keys-p (pairs)
           (dolist (p pairs)
             (if (< 1
                    (count (car p) pairs :key #'car))
                 (return t)))))
    (if (oddp (length contents))
        (error "Odd number of values in hash-table literal")
        (if (repeated-keys-p (group 2 contents))
            (error "Repeated keys in hash-table literal")
            `(let ((,g!hash (make-hash-table :test 'equal)))
               (setf ,@(do ((lst contents (cddr lst))
                            (acc nil))
                           ((null lst) (nreverse acc))
                           (push `(gethash ,(car lst) ,g!hash) acc)
                           (push (cadr lst) acc)))
               ,g!hash)))))

(defun hash-table-reader (stream char)
  (declare (ignore char))
  `(equal-hash-table ,@(read-delimited-list #\} stream t)))

(defun pprint-hash-table (*standard-output* hash-table)
  (pprint-logical-block
      (*standard-output* nil :prefix "{" :suffix "}")
    (let ((end (hash-table-count hash-table)) (i 0))
      (when (plusp end)
        (block printing
          (maphash (lambda (key value)
                     (pprint-pop)
                     (write key)
                     (princ " ")
                     (write value)
                     (if (= (incf i) end) (return-from printing nil))
                     (write-char #\Space)
                     (pprint-newline :fill))
                   hash-table))))))

(defun enable-hash-table-pprinter ()
  (set-pprint-dispatch 'hash-table 'pprint-hash-table))

(defun disable-hash-table-pprinter ()
  (set-pprint-dispatch 'hash-table nil))

(defun |´-reader| (stream char)
  (declare (ignore char))
  `(clesh::mixed-script ,@(clesh::read-interpolated-string stream #\´ )))

(defun arc-like-lambda-reader (stream char)
  "Reads in a []-delimited list and returns a lambda form that receives a single argument: _."
  (declare (ignore char))
  (let ((body (read-delimited-list #\] stream t)))
    `(lambda ,(if (member '_ (flatten body))
                 '(_)
                 ())
      ,body)))

(defmacro! match-mode-ppcre-lambda-form (o!args o!mods)
 ``(lambda (,',g!str)
     (ppcre:scan-to-strings
       ,(if (zerop (length ,g!mods))
          (car ,g!args)
          (format nil "(?~a)~a" ,g!mods (car ,g!args)))
       ,',g!str)))

(defun |#~-reader| (stream sub-char numarg)
  (declare (ignore sub-char numarg))
  (let ((mode-char (read-char stream)))
    (cond
      ((char= mode-char #\m)
       (match-mode-ppcre-lambda-form
        (segment-reader stream
                        (read-char stream)
                        1)
        (coerce (loop for c = (read-char stream)
                   while (alpha-char-p c)
                   collect c
                   finally (unread-char c stream))
                'string)))
      ((char= mode-char #\s)
       (subst-mode-ppcre-lambda-form
        (segment-reader stream
                        (read-char stream)
                        2)))
      (t (error "Unknown #~~ mode character")))))

(defun |#w-reader| (stream char numarg)
  (declare (ignore char numarg))
  `(mapcar #'string ',(read stream t nil t)))

(defun |#%-reader| (stream char numarg)
  (declare (ignore char numarg))
  `(cdr (assoc ,(string-downcase (read stream)) _parsed :test #'string=)))



(defun div-reader (stream char numarg)
  (declare (ignore char numarg))
  `(:div :class ,(string-downcase (read stream)))
)

(flet ((rdelim (stream char)
         (declare (ignore stream char))
         (get-macro-character #\) )))
  (defreadtable web-syntax
    (:merge locale-syntax)
    (:macro-char #\] #'rdelim)
    (:macro-char #\[ #'arc-like-lambda-reader)
    (:macro-char #\} #'rdelim)
    (:macro-char #\{ #'hash-table-reader)
    (:macro-char #\´ #'|´-reader|)
    (:macro-char #\@ #'annot.syntax:annotation-syntax-reader)
    (:dispatch-macro-char #\# #\% #'|#%-reader|)
    (:dispatch-macro-char #\# #\` #'lol:|#`-reader|)
    (:dispatch-macro-char #\# #\" #'lol:|#"-reader|)
    (:dispatch-macro-char #\# #\m #'markup::markup-reader)
    (:dispatch-macro-char #\# #\~ #'|#~-reader|)
    (:dispatch-macro-char #\# #\w #'|#w-reader|)))
