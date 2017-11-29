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

(defparameter p0cards NIL)
(defparameter p1cards NIL)
(defparameter p2cards NIL)
(defparameter p3cards NIL)
(defparameter rotation NIL)
(defparameter playerCount NIL)
(defparameter playerList NIL)
(defparameter splitedCards '((1 2 3)(3 4 5)(5 6 7)(7 8 9))) ;; uztaisit lai sadala kartis, so parametru izmanto lai sadalitu speletaju karsu mainigajos

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



(defun input (player cardCount)

(setq value (nth player playerList))
;;(if (equal cardcount 0) (setq cardcount 1)) ;;;;!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
(cond ((equal value 'C) (random cardCount)) 
        ((equal value 'P) 
(print (format nil "Enter card num  1-~a" cardCount) )
(-(playerCardInput cardCount) 1)
))
)


(defun playerCardInput (cardCount)
(setq rowK -1)
(print (format nil "Enter card num  1-~a" cardCount) )
(loop while (or (<= rowK 0)(> rowK cardCount)) 
  do (setf rowK (read))         
  (if (not (numberp rowK))(setq rowK -1) )
  (if (or (<= rowK 0)(> rowK cardCount))(print (format nil "Wrong input! Enter card num  1-~a" cardCount)))
)rowK)


(defun setPlayers ()
(setq playerList NIL)
(print "Input player count 2-4: ")
(setq playerCount (playerCountInput))
(print "Input players (C for comput or P for Human player)")
(setq rowS 1)
(loop while (not(> rowS playerCount)) 
  do
  (setq player (playerInput rowS))     
  (setq playerList (cons player playerList))
  (setf rowS (+ rowS 1))
) (rev playerList)
)

(defun playerInput (playerNum)
(setq rowP 'W)
(print (format nil "Enter player ~a:" playerNum))
(loop while (not(or (equal rowP 'C)(equal rowP 'P))) 
  do (setf rowP (read))          
  (if  (numberp rowP)(setq rowP 'W) )
  (if (not(or (equal rowP 'C)(equal rowP 'P))) (print "Wrong input! Enter C for comput or P for Human player"))
  (if (and (equal (length playerList) (- playerCount 1)) (equal (member 'P playerList) NIL) (not(equal rowP 'P))) (progn(print "Wrong input! Enter P for Human player")(setq rowP 'W)))
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

(defun rev (list)
  (if (atom list)								
      list
      (append (rev (cdr list))			
              (list (rev (car list))))))



(defun takeCardOld (cardToTake)
(print (format nil "Player ~a taking card from ~a" (getCurPlayer) (getPrevPlayer)))
(setq curPlayer (getCurPlayer))
(setq prevPlayer (getPrevPlayer))
(if (equal curPlayer 0)(setq curCards p0cards))
(if (equal curPlayer 1)(setq curCards p1cards))
(if (equal curPlayer 2)(setq curCards p2cards))
(if (equal curPlayer 3)(setq curCards p3cards))
(if (equal prevPlayer 0)(setq prevCards p0cards))
(if (equal prevPlayer 1)(setq prevCards p1cards))
(if (equal prevPlayer 2)(setq prevCards p2cards))
(if (equal prevPlayer 3)(setq prevCards p3cards))
(setq curCards (append curCards (list (nth cardToTake prevCards))))
(setq prevCards (remove-nth cardToTake prevCards))
(if (equal curPlayer 0)(setq p0cards curCards))
(if (equal curPlayer 1)(setq p1cards curCards))
(if (equal curPlayer 2)(setq p2cards curCards))
(if (equal curPlayer 3)(setq p3cards curCards))
(if (equal prevPlayer 0)(setq p0cards prevCards))
(if (equal prevPlayer 1)(setq p1cards prevCards))
(if (equal prevPlayer 2)(setq p2cards prevCards))
(if (equal prevPlayer 3)(setq p3cards prevCards))
(setq curCards NIL)
(setq prevCards NIL)
)

(defun takeCard (cardToTake)
(print (format nil "Player ~a taking card from ~a" (getCurPlayer) (getPrevPlayer)))
(eval (read-from-string (format NIL "(setq curCards p~aCards)" (getCurPlayer))))
(eval (read-from-string (format NIL "(setq prevCards p~aCards)" (getPrevPlayer))))
(setq curCards (append curCards (list (nth cardToTake prevCards))))
(setq prevCards (remove-nth cardToTake prevCards))
(eval (read-from-string (format NIL "(setq p~aCards curCards)" (getCurPlayer))))
(eval (read-from-string (format NIL "(setq p~aCards prevCards)" (getPrevPlayer))))
(setq curCards NIL)
(setq prevCards NIL)
)

(defun getPrevPlayer ()
(car (last rotation))
)

(defun getPrevCardCount ()
(eval (read-from-string (format NIL "(setq c (length p~aCards))" (getPrevPlayer))))
c
)

(defun getCurPlayer ()
(car rotation)
)

(defun getCurPlayerType ()
(nth (car rotation) playerList)
)

(defun nextTurn ()
(takeCard (input (getCurPlayer) (getPrevCardCount)))
(setq rotation (append (cdr rotation) (list(car  rotation))))
(printHands)
)

(defun checkEnd ()
(if (> (length rotation) 1)(nextTurn))
(if (equal (length rotation) 1) (print (format nil "Player ~a is biggest looser ever!!!" (getCurPlayer))))
)

(defun remove-nth (n list)
  (declare
    (type (integer 0) n)
    (type list list))
  (if (or (zerop n) (null list))
    (cdr list)
    (cons (car list) (remove-nth (1- n) (cdr list)))))

(defun splitCards ()
(shuffleDeck defaultDeck)         
(setq rowSh 0)
(loop while (> (length shuffledDeck) 0)
  do 
  (eval (read-from-string (format NIL "(setq p~aCards (cons (car shuffledDeck) p~aCards))" rowSh rowSh)))
  (setq shuffledDeck (cdr shuffledDeck))
  (setf rowSh (+ rowSh 1))    
  (if  (equal rowSh playerCount )(setf rowSh 0))
)
(if (equal playerCount 2) (setq rotation '(0 1)))
(if (equal playerCount 3) (setq rotation '(0 1 2)))
(if (equal playerCount 4) (setq rotation '(0 1 2 3)))
)

(defun printHands ()
(setq rowPrint 0)
(loop while (< rowPrint playerCount)
  do 
  (eval (read-from-string (format NIL "(setq printCards p~aCards)" rowPrint)))
  (print (format nil "Player ~a : ~A" rowPrint printCards))
  (setf rowPrint (+ rowPrint 1))    
)
(print (format nil "Rotation : ~A" rotation))
(print "")
)

(defun main ()
(setq playerList (setPlayers))
(splitCards)
(printHands)
(loop while (> (length rotation) 1)
do
(clearList)
(checkForEmptyHand)
(checkEnd)
)
)

(defun deleteDup (lst)
(remove-if #'(lambda (var) (member var (findPairs lst) :test #'equal)) lst)
)

(defun clearList ()
(setq p0cards (deleteDup p0cards))
(setq p1cards (deleteDup p1cards))
(setq p2cards (deleteDup p2cards))
(setq p3cards (deleteDup p3cards))
)

(defun checkForEmptyHand ()
(setq rowD 0)
(loop while (< rowD playerCount)
  do 
  (eval (read-from-string (format NIL "(setq rowCardCount (car p~aCards))" rowD)))
  
  ;;(print (format nil "Player : ~a cardCount : ~a" rowD rowCardCount))
  (if  (equal rowCardCount NIL)(setq rotation (remove rowD rotation)))
  (setf rowD (+ rowD 1))
)
)