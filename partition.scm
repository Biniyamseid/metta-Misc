(define (append-map func lst)
(apply append (map func lst)))

(define (partitions lst)
(if (null? lst)
    '(())
    (append-map (lambda (split)
                  (map (lambda (p) (cons (car split) p))
                       (partitions (cdr split))))
                (select lst))))



(define (select lst)
(if (null? lst)
    '()
    (cons (list (car lst) (cdr lst))
          (map (lambda (split)
                 (list (cons (car lst) (car split))
                       (cdr split)))
               (select (cdr lst))))))


(partitions '(1 2 3))
; => ((()) (1) (2) (3) (1 2) (1 3) (2 3) (1 2 3))
        