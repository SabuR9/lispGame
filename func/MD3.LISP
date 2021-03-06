(defvar defaultDeck2 
'((1 6)(2 6)(3 6)(4 6)(1 7)(2 7)(3 7)(4 7)(1 8)(2 8)(3 8)(4 8)(1 9)(2 9)(3 9)(4 9)(1 10)(2 10)(3 19)(4 10)(1 J)(2 J)(3 J)(4 J)(1 Q)(2 Q)(3 Q)(1 K)(2 K)(3 K)(4 K)(1 A)(2 A)(3 A)(4 A))
)

(defvar defaultDeck 
'((R 6)(R 6)(B 6)(B 6)(R 7)(R 7)(B 7)(B 7)(R 8)(R 8)(B 8)(B 8)(R 9)(R 9)(B 9)(B 9)(R 10)(R 10)(B 10)(B 10)(R J)(R J)(B J)(B J)(R Q)(R Q)(B Q)(R K)(R K)(B K)(B K)(R A)(R A)(B A)(B A))
)

(defparameter shuffledDeck NIL)
(defparameter handOne NIL)
(defparameter handTwo NIL)
(defparameter cardCount NIL)

(defun shuffleDeck (deck)
(setq shuffledDeck (mapcar #'rest (sort (mapcar #'(lambda (x) (cons (random 1.0) x)) deck) 
                     #'< 
                     :key #'first)))
(format t "Deck shuffled")
)

(defun split-list (l)
  (cond
    ((endp l) '(() ()))
    ((endp (rest l)) (list (list (first l)) '()))
    ((destructuring-bind (odd-zs even-zs) 
         (split-list (rest (rest l)))
       (list (list* (first l) odd-zs)
             (list* (second l) even-zs))))))

(defun dealHands (deck)
  (setq handOne (CAR (split-list deck)))
  (setq handTwo (CAR(CDR (split-list deck))))
  (format t "Hands dealt")
)

(defun checkCardCount ()
  (setq cardCount
        (list
         (list-length handOne)
         (list-length handTwo)
        )
  )
)

(defun findPairs (lst)
  (cond ((null lst) '())
        ((member (car lst) (cdr lst) :test 'equal) (cons (car lst) (findPairs (cdr lst))))
        (t (findPairs (cdr lst)))))



(defun mainGame ()
  (format  t "Game started. Player count: 2")
  (shuffleDeck defaultDeck)
  (dealHands shuffledDeck)
  (checkCardCount)
)