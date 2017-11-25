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

+

(defun input (player cardCount)

(setq value (nth player '(C C P C))) // Aizstat list ar globalo speletaju sarakstu
(cond ((equal value 'C) (+ (random cardCount) 1)) 
        ((equal value 'P) 
(print (format nil "Enter card num  1-~a" cardCount) )
(playerCardInput cardCount)
))
)


(defun playerCardInput (cardCount)
(setq rowK -1)
(print (format nil "Enter card num  1-~a" cardCount) )
(loop while (or (<= rowK 0)(> rowK cardCount)) 
  do (setf rowK (read))         
  (if (not (numberp rowK))(setq rowK -1) )
  (if (or (<= rowK 0)(> rowK cardCount))(print (format nil "Wrong input! Enter card num  1-~a" cardCount)))
)row)

(defun setPlayers ()
(print "Input player count 2-4: ")
(setq playerCount (playerCountInput))
(print "Input players (C for comput or P for Human player)")
(setq rowS 1)
(loop while (not(> rowS playerCount)) 
  do
  (setq player (playerInput rowS))     
  (setf playerList (list playerList player))
  (setf rowS (+ rowS 1))
) playerList
)

(defun playerInput (playerNum)
(setq rowP 'W)
(print (format nil "Enter player ~a:" playerNum))
(loop while (not(or (equal rowP 'C)(equal rowP 'P))) 
  do (setf rowP (read))          
  (if  (numberp rowP)(setq rowP 'W) )
  (if (not(or (equal rowP 'C)(equal rowP 'P))) (print "Wrong input! Enter C for comput or P for Human player"))
)rowP
)

(defun playerCountInput ()
(setq rowC -1)
(loop while (or (< rowC 2)(> rowC 4))
  do (setf rowC (read))          
  (if  (not(numberp rowC))(setq rowC -1) )
  (if (or (< rowC 2)(> rowC 4))(print "Wrong input! Enter number  2-4"))
)rowC
)

