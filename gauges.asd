;;;; gauges.asd

(asdf:defsystem #:gauges
  :serial t
  :description "CL interface to Gaug.es API"
  :author "Kyle Isom <coder@kyleisom.net>"
  :license "ISC license"
  :depends-on (#:drakma
               #:cl-json
               #:babel)
  :components ((:file "package")
               (:file "api")
               (:file "gauges")))
