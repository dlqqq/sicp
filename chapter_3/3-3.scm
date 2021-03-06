(define (make-account balance pw)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch input-pw m)
    (if (eq? pw input-pw)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                        m)))
      (error "BAD PASSWORD" input-pw)
    )
  )
  dispatch
)

(define acc (make-account 100 'teapot))

((acc 'teapot 'deposit) 100)
((acc 'pottea 'deposit) 100)
