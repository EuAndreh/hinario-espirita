@export
(defun get-music-key (path-or-string)
  (let ((str (etypecase path-or-string
               (pathname (uiop:read-file-string path-or-string))
               (string path-or-string))))
    (mv-bind (match capture)
        (#~m/^%TONALIDADE=(.*)/ str)
      (declare (ignore match))
      (aref capture 0))))

(defun get-music-key (path-or-string)
  (let ((str (etypecase path-or-string
               (pathname (uiop:read-file-string path-or-string))
               (string path-or-string))))
    (if-match (#~m/^%TONALIDADE=(.*)/ str)
        $1)))

@export
(defmacro defvar-unbound (name &optional (doc-string ""))
  `(progn
     (defvar ,name)
     (setf (documentation ',name 'variable) ,doc-string)
     ',name))

(defmacro abbrevs (&body body)
  (let ((pairs (group 2 body)))
   `(progn
      ,@(mapcar #`(abbr ,(car a1) ,(cadr a1))
                pairs)
       (export ',(mapcar [car _] pairs)))))

(abbrevs & strcat
         mp mapcar
         strd string-downcase)
