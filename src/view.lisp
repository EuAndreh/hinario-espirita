(defpackage hinario-espirita.view
  (:use cl
        cool-read-macros
        hinario-espirita.util
        arrow-macros
        rutil)
  (:import-from cl-locale
                i18n
                i18n-unformatted)
  (:import-from hinario-espirita.config
                *application-root*
                *static-directory*)
  (:import-from local-time
                format-timestring
                now)
  (:import-from markup
                *auto-escape*
                html5
                markup))
(in-package hinario-espirita.view)
(in-readtable cool-readtable)

(defmacro defhtml (name args title &body body)
  `(defun ,name ,args
     (let ((*auto-escape* nil))
       (html5
        (:head
         (:title ,title)
         (:link :rel "stylesheet" :href "/css/style.css")
         (:script :src "/js/script.js")
         (:meta :charset "UTF-8"))
        (:body
         (:a :href "https://github.com/EuAndreh/hinario-espirita"
             (:img :class "fork" :src "/images/fork.png" :alt "Fork me on GitHub!"))
         ,@body
         (:p #i"licença"
             (:a :href "https://creativecommons.org/licenses/by-sa/4.0/"
                 :title "Creative Commons"
                 "Creative Commons")
             #i"livre")
         (:p #i"correções"
             (:a :href "mailto:andremiramor@gmail.com" :target "_top"
                 "andremiramor@gmail.com")
             #i"feliz")
         (:a :href "http://fraternidadecasadocaminho.org.br"
             :title "Fraternidade Casa do Caminho"
             (:img :class "logo" :src "/images/logo.png")))))))


(defun gen-nav-li (items-list &key (pre "") (class ""))
  #m(:div
     (mapcar [let ((pdf (& _ ".pdf")))
           #m(:li
              (:a :href (& pre pdf)
                  :title pdf
                  :class class
                  :target "_blank"
                  (i18n (pathname-name _))))]
         items-list)))

(defhtml index ()
    "òwiej"
  (:h1 "Oiwjeofi"))

;;@export
;;#+nil
(defhtml index ()
    #i"título"
    (:div
       (mapcar [let ((lname (cdr _)))
             #m(:a :href (root-link-to (fmt "/~a/" (car _)))
                   :title lname
                   lname)]
           *langs*))
    (:h1 (:a :href (link-to "/") :title #i"início"
             #i"título"))
    (:ul :class "nav"
         (gen-nav-li (mapcar [merge-pathnames _ "/pdf/"]
                         '("Hinário" "Cifras" "Transparências" "Slides")))
         :br
         (:a :class "partituras" :href "/partituras" :title #i"partituras"
             #i"partituras e áudios"))
    (:p #i"versão"
        (format-timestring nil (now)
                           :format (l10n "data"))
        #i"atualizado")
    (:p  #i"impressão")
    (:ul :class "nav"
         (gen-nav-li (mapcar [merge-pathnames _ "/pdf/"]
                         '("Hinário(boneco)" "Cifras(boneco)"))))
    (:h2 (:a :href "criar" :class "criar"
             #i"crie"))
    (:div :class "cartaz-frame"
          (:p #i"cartaz")
          (:p (:a :href (& "/pdf/" #i"Cartaz.pdf") :title #i"Cartaz.pdf" :target "_blank"
                  (:img :class "cartaz" :src (& "/images/" #i"Cartaz.png"))))))



@export
(defhtml sheets-index ()
    #i"título"
    (:h1 (:a :href (link-to "/") :title #i"início"
             "Hinário Espírita"))
    (:h2 #i"download")
    #m(:div
       (mapcar [let ((f (pathname-name _)))
             #m(:p :class "music-data"
                   f
                   :br
                   (:audio :controls t :preload "none"
                           (:source :src (& "/lilypond/" f ".ogg") :type "audio/ogg")
                           (:source :src (& "/lilypond/" f ".mp3") :type "audio/mpeg"))
                   :br
                   (:a :href (& "/lilypond/" f ".pdf") :target "_blank"
                       "pdf")
                   "|"
                   (:a :href (& "/lilypond/" f ".midi") :target "_blank"
                       "midi"))]
           (directory (merge-pathnames "static/lilypond/*.ogg" *application-root*))))
    )

@export
(defparameter *major-keys* #w(C C# D E♭ E F F# G A♭ A B♭ b ))

@export
(defparameter *minor-keys* (mapcar [fmt "~am" _]
                               #w(c c# d e♭ e f f# g a♭ a b♭ b)))

(defun all-songs-html (lang)
  #m(:ul :class "columns"
         (mapcar (lambda (tex)
               #m(:li (:input :type "checkbox"
                              :name (fmt "songs[~a][]" lang)
                              :class "checkbox"
                              :value (pathname-name tex)
                              (mv-bind (match capture)
                                  (#~m/\\beginsong\{(.*?)\}/ (uiop:read-file-string tex))
                                (declare (ignore match))
                                (aref capture 0)))
                      (:select :name (fmt "keys[~a][~a]" lang (pathname-name tex))
                               (let ((tonalidade (get-music-key tex)))
                                 (mapcar [fmt "<option value='~a' selected>~a</option>"
                                          _
                                          (if (string= _ tonalidade)
                                              " selected"
                                              "")
                                          _]
                                     (if (position tonalidade *major-keys* :test #'string=)
                                         *major-keys*
                                         *minor-keys*)))
                               (songs-keys tex))) )
             (directory (merge-pathnames (fmt "static/tex/~a/*.tex" lang) *application-root*)))))

@export
(defhtml hinarios-page ()
    #i"título"
    (:h1 (:a :href (link-to "/") :title #i"início"
              #i"título"))
    (:h2 #i"escolha")
    (:form :action (link-to "/criar") :method :POST
           (:h3 #i"português")
           (all-songs-html "pt")
           (:h3 #i"inglês")
           (all-songs-html "en")
           :br
           (:div :class "center-button"
                 (:input :type "submit"
                         :value #i"gerar"
                         :id "botao-gerar"
                         ;; :onclick "window.aguarde()"
                         :class "botao-gerar"))))

@export
(defhtml generated-hinario (path)
    #i"título"
    (let ((tokens (split-sequence #\/ path)))
      #m(:div
         (:div :id "fb-root")
         (:h1 (:a :href (link-to "/") :title #i"início"
                  #i"título"))
         (:h3 (fmt #i"criado-em"
                   (fmt "~a/~a/~a"
                        (fifth tokens)
                        (fourth tokens)
                        (third tokens))))
         (:ul :class "nav"
              (gen-nav-li (mapcar [merge-pathnames (i18n _) path]
                              '("Hinário" "Cifras" "Transparências" "Slides"))
                          :pre "/")
              :br
              (gen-nav-li (mapcar [merge-pathnames (i18n _) path]
                              '("Hinário(boneco)" "Cifras(boneco)"))
                          :pre "/"
                          :class "boneco"))
         (:h3 #i"compartilhe"
              (let ((link (link-to (& "/hinarios" (subseq path 3)))))
                #m(:p (:a :href link
                          link))))
         (:div :class "twitter" :align "center"
               (:div :class "fb-like")
               #m(:a :href (fmt "https://twitter.com/intent/tweet?button_hashtag=HinarioEspirita&text=~a ~a/hinarios/~a/~a/~a/~a/"
                                (i18n "tweet")
                                (link-to "")
                                (second tokens)
                                (third tokens)
                                (fourth tokens)
                                (fifth tokens))
                     :class "twitter-hashtag-button"
                     :data-size "large"
                     :data-related "EuAndreh"
                     "Tweet #HinarioEspirita"))
         (let ((qrcode-path (& "/" path "qrcode.png")))
           #m(:a :href qrcode-path
                 (:img :class "qrcode" :src qrcode-path :alt "QR Code"))))))

@export
(defhtml 404-page ()
    #i"404"
    (:div :id "main"
        (:div :class "error"
              (:div :class "code"
                     #i"404")
              (:div :class "message"
                     #i"não encontrado"))))
