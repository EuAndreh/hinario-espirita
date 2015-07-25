(defsystem hinario-espirita
  :name "hinario-espirita"
  :version "0.1.0"
  :author "André Miranda"
  :maintainer "André Miranda"
  :mailto "andremiramor@gmail.com"
  :homepage "https://github.com/EuAndreh/hinario-espirita"
  :bug-tracker "https://github.com/EuAndreh/hinario-espirita/issues"
  :source-control (:git "git@github.com:EuAndreh/hinario-espirita.git")
  :license "LLGPL"
  :serial t
  :description "Spiritist Songbook website."
  :depends-on (arrow-macros
               caveman2
               cl-annot
               cl-heredoc
               cl-interpol
               cl-ppcre
               cl-locale
               cl-markup
               cl-qrencode
               cl-reexport
               cl-slug
               clack
               clesh
               envy
               lack
               lack-middleware-accesslog
               lack-middleware-backtrace
               lack-middleware-session
               let-over-lambda
               named-readtables
               rock
               rutils
               uuid)
  :components ((:file "rock")
               (:module "static"
                        :components
                        ((:module "css"
                                  :components
                                  ((:sass-indent "style")))
                         (:module "js"
                                  :components
                                  ((:coffee "script")))))
               (:module "src"
                        :components
                        ((:file "readtable")
                         (:file "util")
                         (:file "config")
                         (:file "view")
                         (:file "scaffolds")
                         (:file "scripts")
                         (:file "web")
                         (:file "main")))
               (:static-file "README.md"))
  :defsystem-depends-on (asdf-linguist)
  :long-description #.(uiop:read-file-string
                       (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op hinario-espirita-test))))
