;; Define Nat
(: Nat Type)
(: Z Nat)
(: S (-> Nat Nat))

;; Define greater than zero
(: 0< (-> Number Bool))
(= (0< $x) (< 0 $x))

;; Define backward chainer
(: bc (-> $a                            ; Knowledge base space
          $b                            ; Query
          Nat                           ; Maximum depth
          $b))                          ; Result
;; Base cases
(= (bc $kb (: $prf $ccln) $_) ; Kownledge base look-up
   (match $kb (: $prf $ccln) (: $prf $ccln)))
(= (bc $kb (: CPU (0⍃ $x)) $_) ; CPU check
   (if (0< $x) (: CPU (0⍃ $x)) (empty)))
;; Recursive step
(= (bc $kb (: ($prfabs $prfarg) $ccln) (S $k))
   (let* (((: $prfabs (-> (: $prfarg $prms) $ccln)) ; Recurse on proof abstraction
           (bc $kb (: $prfabs (-> (: $prfarg $prms) $ccln)) $k))
          ((: $prfarg $prms) ; Recurse on proof argument
           (bc $kb (: $prfarg $prms) $k)))
     (: ($prfabs $prfarg) $ccln)))

;; Define knowledge base
!(bind! &kb (new-space))
!(add-atom &kb (: 2 Prime)) ; 2 is a prime number
!(add-atom &kb (: Rule (-> (: $_ (0⍃ $x))   ; If $x is greater than 0
                           (-> (: $x Prime) ; and is a prime number, then
                               (0⍃' $x))))) ; $x is a prime number greater than zero

;; Test backward chainer
!(bc &kb (: $prf (0⍃' $x)) (S (S Z)))

