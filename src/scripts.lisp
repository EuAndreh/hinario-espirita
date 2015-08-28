(defpackage hinario-espirita.scripts
  (:use cl
        cool-read-macros
        hinario-espirita.util
        hinario-espirita.scaffolds
        arrow-macros
        rutil)
  (:import-from cl-locale
                i18n
                *locale*)
  (:import-from fad
                copy-file)
  (:import-from hinario-espirita.config
                *application-root*)
  (:import-from hinario-espirita.view
                *major-keys*
                *minor-keys*)
  (:import-from local-time
                format-timestring
                now)
  (:import-from named-readtables
                in-readtable)
  (:import-from ppcre
                regex-replace-all)
  (:import-from rutil
                aif
                it
                fmt
                mv-bind))
(in-package hinario-espirita.scripts)
(in-readtable cool-readtable)

#+nil
(defun %gen-boneco-tmps (fname n-pages l-center r-center pg-counter)
  (labels ((tmp-str (n)
             (format t "Counter: ~s.~%" n)
             (merge-pathnames (& "tmp_" n ".pdf") *path*))
           (l-pdf (n counter)
             (format t "l-pdf. N: ~s." n)
             (pdf n counter))
           (r-pdf (n counter)
             (format t "r-pdf. N: ~s." n)
             (pdf n counter))
           (pdf (n counter)
             ´pdfseparate -f $n -l $n $fname $(tmp-str counter)´))
    (format t "fname: ~s, n-pages: ~s, l-center: ~s, r-center: ~s, pg-counter: ~s~%"
            fname n-pages l-center r-center pg-counter)
  ;;  (sleep 1)
     ;;(print (1- l-center))
     ;;(print (1+ r-center))
    (when (> l-center 1)
      (l-pdf (decf l-center) (incf pg-counter))
      (if (= r-center (* 4 (ceiling (/ 4 n-pages))))
          (progn
            (copy-file (merge-pathnames #i"Capa.pdf" *path*)
                       (tmp-str (incf pg-counter))
                       :overwrite t)
            (return-from %gen-boneco-tmps))
          (r-pdf (incf r-center) (incf pg-counter)))
      (if (> r-center n-pages)
          (if (= (1- r-center) (* 4 (ceiling (/ 4 n-pages))))
              ;; (not (= r-center n-pages))
              (progn
                (print 'wikiwiu)
                (copy-file (merge-pathnames #i"Fundo.pdf" *path*)
                           (tmp-str (incf pg-counter))
                           :overwrite t))
              (progn
                (print 'aff)
                (copy-file (merge-pathnames #i"Vazia.pdf" *path*)
                           (tmp-str (incf pg-counter))
                           :overwrite t)))
          (progn
           ;; (print 'fweosdaissfodijfaoeij)
            (r-pdf (incf r-center) (incf pg-counter))))
      (l-pdf (decf l-center) (incf pg-counter))
      (%gen-boneco-tmps fname n-pages l-center r-center pg-counter))))

(defun gen-boneco-pages-structure (n-pages)
  (let* ((r-center (* 2 (ceiling (/ n-pages 4))))
         (l-center (1+ r-center))
         (r-max (* 2 r-center)))
      (labels ((rec (r l acc)
                 (if (> l 1)
                     (progn
                       (decf l)
                       (incf r)
                       (if (> r n-pages)
                           (if (= r r-max)
                               (push `(,l :fundo) acc)
                               (push `(,l :vazio) acc))
                           (push `(,l ,r) acc))

                       (decf l)
                       (incf r)
                       (if (> r n-pages)
                           (if (= r r-max)
                               (push `(:fundo ,l) acc)
                               (push `(:vazio ,l) acc))
                           (push `(,r ,l) acc))
                       (rec r l acc))
                     acc)))
        (rec r-center l-center nil))))

(defun boneco (fname out-pdf)
  (let* ((n-pages (-> ´pdfinfo ?fname´
                    (#~m/Pages.*/)
                    (#~s/^\w+: +(\d+)/\1/)
                    parse-integer))
         (r-center (* 2 (ceiling (/ n-pages 4)) ))
         (l-center (1+ r-center))
         (pg-counter 0))
  (%gen-boneco-tmps fname n-pages l-center r-center pg-counter)
   ´pdfunite $(ls -v tmp*) out.pdf´
   ´pdfnup --nup 2x1 out.pdf´
   (copy-file (merge-pathnames "out-nup.pdf" *path*) (merge-pathnames out-pdf *path*)
              :overwrite t)))

(defun gen-hinarios (fname)
  ´pdflatex $(& fname ".tex") > /dev/null´
  ´songidx $(& "Indice" (slug:asciify fname) ".sxd")´
  ´pdflatex $(& fname ".tex") > /dev/null´)

(defun gen-musicas-list (musicas)
  (with-open-file (out (merge-pathnames "musicas.sbd" *path*)
                       :direction :output)
    (dolist (lang musicas)
      (let ((lang-name (car lang)))
        (dolist (f (cdr lang))
          (format out #"\include{tex/~a-~a}~%"# f lang-name))))))

(defun diff-tonalidades (orig new)
  (aif (position orig *major-keys* :test #'string=)
       (- (position new  *major-keys* :test #'string=)
          it)
       (- (position new *minor-keys* :test #'string=)
          (position orig *minor-keys* :test #'string=))))

(defun copiar-e-transpor-musicas (tonalidades tex-dir)
  ;; otimizar para copiar somente as músicas que vão ser usadas
  (flet ((copiar-idioma (idioma)
           (let ((tonalidades (cdr (assoc idioma tonalidades :test #'string=))))
             (dolist (f (directory (merge-pathnames (fmt "static/tex/~a/*.tex" idioma)
                                                    *application-root*)))
               (-<> (uiop:read-file-string f)
                 (regex-replace-all #"\\transpose\{\d+\}"#
                                    <>
                                    (fmt #"\transpose{~a}"#
                                         (diff-tonalidades
                                          (get-music-key f)
                                          (cdr (assoc (pathname-name f)
                                                      tonalidades :test #'string=)))))
                 (spit (merge-pathnames (& (pathname-name f) "-" idioma ".tex") tex-dir)))))))
    (mapcar #'copiar-idioma (mapcar #'car *langs*))))

@export
(defun hinarios (musicas tonalidades)
  (let* ((date-str (format-timestring nil (now) :format #l"data"))
         (rel-path (fmt "../static/pdf/~a/~a/" date-str (uuid:make-v4-uuid)))
         ;; mudar *default-pathname-defaults* + uiop:chdir
         (*default-pathname-defaults* (car (directory (ensure-directories-exist rel-path))))
         (cwd (uiop:getcwd))
         (tex-dir (ensure-directories-exist (merge-pathnames "tex/" *path*))))
    (uiop:chdir *default-pathname-defaults*)
    (copiar-e-transpor-musicas tonalidades tex-dir)
    (mapcar [spit (tex _) (merge-pathnames (name _))]
        (ht-keys %scaffolds))
    (gen-musicas-list musicas)

    (dolist (_ (ht-keys %scaffolds))
      (spit (tex _) (merge-pathnames (name _)))
      (gen-hinarios _))

    (dolist (f (directory (merge-pathnames "static/pdf/*.pdf" *application-root*)))
      (copy-file f (merge-pathnames (& (pathname-name f) ".pdf"))
                 :overwrite t))
    (mapcar #'gen-hinarios '( ;; "Hinário" "Cifras" "Transparências" "Slides"
                         ;; "HinárioBoneco"
                         "CifrasBoneco"))
    (mapcar #'boneco '(:hinario-boneco :cifra-boneco))

    ;; (boneco "HinárioBoneco.pdf" "Hinário(boneco).pdf")
    (boneco "CifrasBoneco.pdf" "Cifras(boneco).pdf")
    (unless (eq *locale* :pt)
      (dolist (fname '("Hinário" "Cifras" "Transparências" "Slides"
                       "Hinário(boneco)" "Cifras(boneco)"))
        (copy-file (merge-pathnames (& fname ".pdf"))
                   (merge-pathnames (& (i18n fname) ".pdf") *path*)
                   :overwrite t)))
    #+nil (ensure-directories-exist (merge-pathnames path *static-directory*))
    #+nil (qrcode:encode-png (link-to (fmt "/hinarios/~a/~a/~a/~a/" ano mes dia uuid))
                       :fpath (merge-pathnames "qrcode.png"
                                               (merge-pathnames path
                                                                *static-directory*)))
    (uiop:chdir cwd)
    (subseq rel-path (+ 4 9))))
