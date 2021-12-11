;;;; adventofcode2021.lisp
;;;; helpers to deal with inputs and such

(in-package #:adventofcode2021)

(defun read-lines (pathname)
  (with-open-file (in pathname)
    (loop for line = (read-line in nil nil)
          while line
          collect line)))

(defun read-ints (pathname)
  (mapcar #'parse-integer (read-lines pathname)))

;;;; test code
#+nil
(
 (read-lines "day1input")
 (read-ints "day1input")
 nil)
