(in-package #:day2)

(coalton-toplevel
  (define-type Direction Forward Up Down)
  (define-type Command (Command (Tuple Direction Integer)))

  (declare parse-direction (String -> (Optional Direction)))
  (define (parse-direction str)
    (match str
      ("forward" (Some Forward))
      ("up" (Some Up))
      ("down" (Some Down))
      (_ None)))

  (declare parse-command (String -> (Optional Command)))
  (define (parse-command line)
    (match (split #\Space line)
      ((Cons dir (Cons num (Nil)))
       (match (Tuple (parse-direction dir) (parse-int num))
         ((Tuple (Some d) (Some n))
          (Some (Command (Tuple d n))))
         (_ None)))
      (_ None)))

  #+nil nil)

#+nil
(
 (coalton (parse-command "forward 5"))
 (coalton (map (+ 2) (Cons 1 (Cons 2 (Cons 3 Nil)))))

 (coalton (filter issome (Cons (parse-command "forward 4") Nil)))
 nil)
