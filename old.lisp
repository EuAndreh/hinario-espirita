#+nil
(defun case-sensitive-reader (stream char)
  (declare (ignore char))
  (let ((*readtable* (copy-readtable))
        (char (read-char stream)))
    (unread-char char stream)
    (setf (readtable-case *readtable*) :preserve)
    (if (member char '(#\Newline #\Space #\Return))
        '^
        (read stream))))

#+nil
(defun str-locale-syntax-reader (stream char numarg)
  (declare (ignore char numarg))
  (let ((ch (peek-char t stream))
        (args (read stream)))
    (ecase ch
      (#\" `(who:str (i18n ,args)))
      (#\( `(who:str (i18n ,(car args) :params (list ,@(cdr args))))))))

#+nil
(defun who-str-reader (stream char numarg)
  (declare (ignore char numarg))
  `(who:str ,(read stream)))

    ;; (:macro-char #\^ #'case-sensitive-reader)
    (:dispatch-macro-char #\# #\í #'str-locale-syntax-reader)
    (:dispatch-macro-char #\# #\s #'who-str-reader)
    (:dispatch-macro-char #\# #\? #'cl-interpol::interpol-reader)

    (:dispatch-macro-char #\# #\> #'cl-heredoc:read-heredoc)
