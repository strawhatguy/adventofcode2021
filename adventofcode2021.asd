;;;; adventofcode2021.asd

(asdf:defsystem #:adventofcode2021
  :description "Describe adventofcode2021 here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:coalton)
  :components ((:file "package")
               (:file "adventofcode2021")
               (:file "day1")
               (:file "day2")))
