(in-package #:day2)

(coalton-toplevel
  (define-type Command
    (Forward Integer)
    (Up Integer)
    (Down Integer))

  (declare parse-direction (String -> (Optional Integer) -> (Optional Command)))
  (define (parse-direction str num)
    (match num
      ((Some n)
       (match str
         ("forward" (Some (Forward n)))
         ("up" (Some (Up n)))
         ("down" (Some (Down n)))
         (_ None)))
      (_ None)))

  (declare read-command (String -> (Optional Command)))
  (define (read-command line)
    (match (split #\Space line)
      ((Cons dir (Cons num (Nil)))
       (parse-direction dir (parse-int num)))
      (_ None)))

  (declare read-commands (String -> (List Command)))
  (define (read-commands pathname)
    (let ((only-some (fn (c)
                       (match c
                         ((Some x) x))))
          (lines (lisp (List String) (pathname)
                    (adventofcode2021:read-lines pathname))))
      (map only-some
           (filter issome
                   (map read-command lines)))))

  (declare horiz-x-depth ((List Command) -> Integer))
  (define (horiz-x-depth commands)
    (let ((inner (fn (h d cmds)
                   (match cmds
                     ((Nil) (* h d))
                     ((Cons c cs)
                      (match c
                        ((Forward x) (inner (+ h x) d cs))
                        ((Up x)      (inner h (- d x) cs))
                        ((Down x)    (inner h (+ d x) cs))))))))
      (inner 0 0 commands)))

  (declare depth-score ((List Command) -> Integer))
  (define (depth-score commands)
    (let ((inner (fn (a h d cmds)
                   (match cmds
                     ((Nil) (* h d))
                     ((Cons c cs)
                      (match c
                        ((Forward x) (inner a       (+ h x) (+ d (* a x)) cs))
                        ((Up x)      (inner (- a x) h       d cs))
                        ((Down x)    (inner (+ a x) h       d cs))))))))
      (inner 0 0 0 commands)))

  #+nil nil)

#+nil
(
 (coalton (read-command "forward 5"))

 (coalton (map (fn (c) (match c ((Some x) x))) (filter issome (Cons (parse-direction "forward 4") Nil))))

 (coalton (horiz-x-depth (read-commands "day2input")))
 (coalton (horiz-x-depth (make-list (Forward 5) (Down 4))))

 (coalton (depth-score (read-commands "day2input")))
 nil)
