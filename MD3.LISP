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
(defparameter rotation '(0 1 2 3)) ;;Uztaisit lai uzgenere rotaciju kad tiek uzgenerets speletaju saraksts
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



(defun takeCard (cardToTake)
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

(defun getPrevPlayer ()
(car (last rotation))
)

(defun getPrevCardCount ()
(if (equal (getPrevPlayer) 0)(setq c (length p0cards)))
(if (equal (getPrevPlayer) 1)(setq c (length p1cards)))
(if (equal (getPrevPlayer) 2)(setq c (length p2cards)))
(if (equal (getPrevPlayer) 3)(setq c (length p3cards)))
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

(defun remove-nth (n list)
  (declare
    (type (integer 0) n)
    (type list list))
  (if (or (zerop n) (null list))
    (cdr list)
    (cons (car list) (remove-nth (1- n) (cdr list)))))

(defun splitCards ()         
(if (>= playerCount 1) (setq p0cards (nth 0 splitedCards)))
(if (>= playerCount 2) (setq p1cards (nth 1 splitedCards)))
(if (>= playerCount 3) (setq p2cards (nth 2 splitedCards)))
(if (>= playerCount 4) (setq p3cards (nth 3 splitedCards)))
(if (equal playerCount 2) (setq rotation '(0 1)))
(if (equal playerCount 3) (setq rotation '(0 1 2)))
(if (equal playerCount 4) (setq rotation '(0 1 2 3)))
)

(defun printHands ()
(print (format nil "Player 0 : ~A" p0cards))
(print (format nil "Player 1 : ~A" p1cards))
(print (format nil "Player 2 : ~A" p2cards))
(print (format nil "Player 3 : ~A" p3cards))
(print (format nil "Rotation : ~A" rotation))
(print "")
)

(defun main ()
(setq playerList (setPlayers))
(splitCards)
(printHands)
(nextTurn)
)