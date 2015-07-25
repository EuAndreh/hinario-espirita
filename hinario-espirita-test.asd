(defsystem hinario-espirita-test
  :name "hinario-espirita-test"
  :version "0.1.0"
  :author "André Miranda"
  :maintainer "André Miranda"
  :mailto "andremiramor@gmail.com"
  :homepage "http://hinarioespirita.com.br"
  :bug-tracker "https://github.com/EuAndreh/hinario-espirita/issues"
  :source-control (:git "git@github.com:EuAndreh/hinario-espirita.git")
  :license "LLGPL"
  :description "Test system for hinario-espirita."
  :depends-on (hinario-espirita
               prove)
  :components ((:module "t"
                        :components
                        ((:test-file "hinario-espirita"))))
  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
