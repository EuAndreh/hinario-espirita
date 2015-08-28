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
               cl-locale
               cl-qrencode
               clack
               cool-read-macros
               envy
               inferior-shell
               lack
               lack-middleware-accesslog
               lack-middleware-backtrace
               lack-middleware-session
               let-over-lambda
               rock
               rutils
               uuid)
  :components ((:module "src"
                        :components
                        ((:file "rock")
                         (:file "util")
                         (:file "config")
                         (:file "view")
                         (:file "scaffolds")
                         (:file "scripts")
                         (:file "web")
                         (:file "main")))
               (:module "static"
                        :components
                        ((:module "css"
                                  :components
                                  ((:sass-strict "style")))
                         (:module "js"
                                  :components
                                  ((:coffee "script")))))
               (:static-file "README.md"))
  :defsystem-depends-on (asdf-linguist)
  :long-description #.(uiop:read-file-string
                       (uiop:subpathname *load-truename* "README.md"))
  :in-order-to ((test-op (test-op hinario-espirita-test))))
