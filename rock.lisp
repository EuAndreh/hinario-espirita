(defpackage hinario-espirita.rock
  (:use cl rock))
(in-package hinario-espirita.rock)

(defenv :hinario-espirita
  :assets ((:jquery :2.1.1)
           (:bootstrap :3.2.0))
  :bundles ((:js :assets ((:jquery :2.1.1)
                          (:bootstrap :3.2.0))
                 :files (list (merge-pathnames #p"static/js/scripts.js"))
             :destination (merge-pathnames #p"static/js/scripts.js"))
            (:css :assets ((:bootstrap :3.2.0))
                  :files (list (merge-pathnames #p"static/css/style.css"))
                  :destination (merge-pathnames #p"static/css/style.css"))))

;; (build :hinario-espirita)
