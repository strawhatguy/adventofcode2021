;;;; day 1 problems

(in-package #:day1)

;;;; trial data
(cl:defvar *depths* '(199 200 208 210 200 207 240 269 260 263))

(coalton-toplevel
  (declare number-of-increases ((List Integer) -> Integer))
  (define (number-of-increases lst)
    (match lst
      ((Cons hd tl) (number-of-increases-helper 0 hd tl))
      ((Nil) 0)))

  (declare number-of-increases-helper (Integer -> Integer -> (List Integer) -> Integer))
  (define (number-of-increases-helper sum comp lst)
    (match lst
      ((Cons hd tl)
       (number-of-increases-helper (if (< comp hd) (+ 1 sum) sum) hd tl))
      ((Nil) sum)))

  (declare 3m-window ((List Integer) -> Integer))
  (define (3m-window lst)
    (match lst
      ((Cons x (Cons y (Cons z zs)))
       (3m-window-helper 0 (+ (+ x y) z) (Cons y (Cons z zs))))
      (_ 0)))

  (declare 3m-window-helper (Integer -> Integer -> (List Integer) -> Integer))
  (define (3m-window-helper sum last lst)
    (match lst
      ((Cons x (Cons y (Cons z zs)))
       (progn
         (let new = (+ x (+ y z)))
         (let newsum = (if (< last new) (+ 1 sum) sum))
         (3m-window-helper newsum new (Cons y (Cons z zs)))))
      (_ sum)))

  #+nil nil)


#+nil
(
 (coalton (number-of-increases (make-list 199 200 208 210 200 207 240 269 260 263)))

 (coalton (number-of-increases
           (lisp (List Integer) ()
             (cl-list-to-coalton *depths*))))

 (coalton (number-of-increases
           (lisp (List Integer) ()
             (cl-list-to-coalton (adventofcode2021:read-ints "day1input")))))

 (cl:untrace 3m-window-helper)
 (coalton (3m-window
           (lisp (List Integer) ()
             (cl-list-to-coalton *depths*))))

 (coalton (3m-window
           (lisp (List Integer) ()
             (cl-list-to-coalton (adventofcode2021:read-ints "day1input")))))

 nil)
