;;; GAME FORMULAR 1 - LISP-LTK Toolkit
;;; Auteurs : Doan Ngoc Long, Mai Trung Hieu, Tran Trung Thang
;;; Date de remise : 08/01/2016
 
(defun create-rue (canvas)
  "Draw 5 lines to form four-lane highways"
  (create-line canvas (list 20 0 20 900))
  (create-line canvas (list 780 0 780 900))
  (create-line canvas (list 210 0 210 900))
  (create-line canvas (list 400 0 400 900))
  (create-line canvas (list 590 0 590 900)))

(defun create-trace-rue (canvas)
  "Draw road markings in each lane"
  (let ((l '())
	(rue-01 '())
	(rue-02 '())
	(rue-03 '())
	(rue-04 '()))
    (push (create-rectangle canvas 110 (+ 10 (* -1 100)) 120 (+ 90 (* -1 100))) rue-01)
    (push (create-rectangle canvas 300 (+ 10 (* -1 100)) 310 (+ 90 (* -1 100))) rue-02)
    (push (create-rectangle canvas 490 (+ 10 (* -1 100)) 500 (+ 90 (* -1 100))) rue-03)
    (push (create-rectangle canvas 680 (+ 10 (* -1 100)) 690 (+ 90 (* -1 100))) rue-04)         
    (dotimes (x 10)
      (push (create-rectangle canvas 110 (+ 10 (* x 100)) 120 (+ 90 (* x 100))) rue-01)
      (push (create-rectangle canvas 300 (+ 10 (* x 100)) 310 (+ 90 (* x 100))) rue-02)
      (push (create-rectangle canvas 490 (+ 10 (* x 100)) 500 (+ 90 (* x 100))) rue-03)
      (push (create-rectangle canvas 680 (+ 10 (* x 100)) 690 (+ 90 (* x 100))) rue-04)      
      )
    (push rue-04 l)
    (push rue-03 l)
    (push rue-02 l)
    (push rue-01 l)
    l))

(defun set-trace-rue (canvas ind rue)
  "Modify the position of road markings"
  (loop for x from -1 to 10 do 
       (set-coords canvas (nth (1+ x) (nth 0 rue)) (list 110 (+ ind 10 (* x 100)) 120 (+ ind 90 (* x 100))))
       (set-coords canvas (nth (1+ x) (nth 1 rue)) (list 300 (+ ind 10 (* x 100)) 310 (+ ind 90 (* x 100))))
       (set-coords canvas (nth (1+ x) (nth 2 rue)) (list 490 (+ ind 10 (* x 100)) 500 (+ ind 90 (* x 100))))
       (set-coords canvas (nth (1+ x) (nth 3 rue)) (list 680 (+ ind 10 (* x 100)) 690 (+ ind 90 (* x 100))))))

;;; Creer la voiture de joueur
;;; Longueur voiture : 160
;;; Largeur voiture : 80 
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees d'initiales
(defun create-my-voiture (canvas x y)
  "Create the main vehicle"
  (list (list (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60))
	      (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80))
	      (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80)))
	      (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
	      (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
	      (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80))))
	x y 0 40 80))

;;; Modifier la position de voiture de joueur
;;; @param my-voiture - voiture de joueur
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees modifiees
(defun set-pos-my-voiture (my-voiture canvas x y)
  "Modify the position of the main vehicle"
  (setf (nth 1 my-voiture) x)
  (setf (nth 2 my-voiture) y)
  (set-coords canvas (nth 0 (car my-voiture)) (list (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (set-coords canvas (nth 1 (car my-voiture)) (list (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 2 (car my-voiture)) (list (- x 30) (- y 40) (- x 40) (- y 80)))
  (set-coords canvas (nth 3 (car my-voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 4 (car my-voiture)) (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
  (set-coords canvas (nth 5 (car my-voiture)) (list (+ x 30) (- y 40) (+ x 40) (- y 80))))

;;; Creer voiture ennemi de type 01 
;;; Longueur voiture : 160
;;; Largeur voiture : 80
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees d'initiales
(defun create-voiture-ennemi-type-01 (canvas x y)
  "Create a list of obstacles"
  (list (list (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60))
	      (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80))
	      (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80)))
	      (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
	      (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
	      (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80))))
	x y 1 40 80))

;;; Modifier la position d'une voiture ennemi type 01
;;; @param voiture - objet voiture 
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) coordonnees modifiees
(defun set-pos-voiture-ennemi-type-01 (voiture canvas x y)
  "Modify the position of obstacles"
  (setf (nth 1 voiture) x)
  (setf (nth 2 voiture) y)
  (set-coords canvas (nth 0 (car voiture)) (list (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (set-coords canvas (nth 1 (car voiture)) (list (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 2 (car voiture)) (list (- x 30) (- y 40) (- x 40) (- y 80)))
  (set-coords canvas (nth 3 (car voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 4 (car voiture)) (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
  (set-coords canvas (nth 5 (car voiture)) (list (+ x 30) (- y 40) (+ x 40) (- y 80))))

;;; Random type des voiture
(defun random-type ()
  (1+ (random 3)))

;;; Random le pourcentage pour creer une voiture ennemi
(defun random-exist ()
  (random 100))

(defun random-line ()
  "Choose a random lane in which show the obstacles"
  (let ((rand (random 4)))
    (cond ((= rand 0) 115)
	  ((= rand 1) 305)
	  ((= rand 2) 495)
	  ((= rand 3) 685)
	  (t nil))))

;;; Fonction pop-nth dans une liste
(defmacro popnth (n lst)
  "Redefine the function POP in order to pop the choosen item"
  (let ((t1 (gensym))(t2 (gensym)))
    `(if (eql ,n 0)
      (pop ,lst)
      (let* ((,t1 (nthcdr (- ,n 1) ,lst))
              (,t2 (car (cdr ,t1))))
        (setf (cdr ,t1) (cddr ,t1))
        ,t2))))

;;; Pour supprimer les voitures ennemis qu'on a passe
(defun delete-out-of-screen-voiture-ennemi-type-01 (canvas l)
  "Delete an obstacle from the screen"
  (if (endp l)
      '()
      (dotimes (k (length l))
	(if (> (nth 2 (nth k l)) 1000)
	    (let ()
	      (mapcar #'(lambda (x) (itemdelete canvas x)) (nth 0 (nth k l)))
	      (popnth k l))))))	      


(defun incident-voiture (my-voiture ennemi)
  "Check if there is an accident"
  (let ((incident nil)
	(result nil))
    (dotimes (x (length ennemi))
      (setf incident (cond ((and (<= (abs (- (nth 1 my-voiture) (nth 1 (nth x ennemi)))) 
				     (+ (nth 4 my-voiture) (nth 4 (nth x ennemi))))
				 (<= (abs (- (nth 2 my-voiture) (nth 2 (nth x ennemi)))) 
				     (+ (nth 5 my-voiture) (nth 5 (nth x ennemi)))))
			    t)			   
			   (t nil)))
      (if (eq incident t)
	  (setf result t)))
    result))
    
(defun level-speed (level)
  (cond ((= level 1) 5)
	((= level 2) 10)
	((= level 3) 20)
	(t 20)))
  
(defun run-loop (c level run race rue my-voiture ennemi)
  ;;; run rue
  (if (= run 100)
      (setq run 0)
      (setq run (+ run (level-speed level))))
  (set-trace-rue c run rue)
  ;;; run race
  (setq race (1+ race))
  ;;; random ennemi
  (if (= (mod race 20) 0)
      (push (create-voiture-ennemi-type-01 c (random-line) -60) ennemi))
  ;;; run ennemi
  (mapcar #'(lambda (x) (set-pos-voiture-ennemi-type-01 x c (nth 1 x) (+ 5 (level-speed level) (nth 2 x)))) ennemi)
  (delete-out-of-screen-voiture-ennemi-type-01 c ennemi)
  ;;; calcule incident
  (if (incident-voiture my-voiture ennemi)
      (print "Il y a une incident"))
  
  ;;; sleep
  (if (and (< race (* level 1000))
	   (eq (incident-voiture my-voiture ennemi) nil))
      (let ()
	(after 250 #'(lambda () (run-loop c level run race rue my-voiture ennemi))))
      (let ()
	(setq level (1+ level))
	(setq race 0)
	(dotimes (x (length ennemi))
	  (mapcar #'(lambda (x) (itemdelete c x)) (nth 0 (nth x ennemi))))
	(dotimes (x (length ennemi))
	  (pop ennemi))
	(set-pos-my-voiture my-voiture c 400 600)
	)
      )
)

(defparameter pause 0)

(defun main ()
  (setf *debug-tk* nil)
  (with-ltk ()
    (let* ((f (make-instance 'frame
			     :width 900
			     :height 800
			     :master nil))
	   (c (make-instance 'canvas
			     :master f
			     :width 800
			     :height 700))
	   (level 1)
	   (run 0)
	   (race 0)
	   ;(pause 0)
	   (rue (create-trace-rue c))
	   (my-voiture (create-my-voiture c 400 600))
	   (ennemi '())
	   (button-01 (make-instance 'button
				  :master f
				  :text "Start"))
	   (button-02 (make-instance 'button
				  :master f
				  :text "Pause")))
      ;;; initaliser
      (pack c) (pack f) (pack button-01) ;(pack button-02)
      (create-rue c)

      ;(itemdelete c (create-line c (list 0 0 100 100)))
      
      (bind button-01
	    "<ButtonPress-1>"
	    (lambda (evt) (declare (ignore evt))
		    ;(setf pause 0)
		    (run-loop c level run race rue my-voiture ennemi))) 
      
      (bind button-01
	    "<KeyPress-q>"
	    (lambda (evt) (declare (ignore evt))
		    ;(if (= 0 pause)
			(set-pos-my-voiture my-voiture c (- (nth 1 my-voiture) 40) (nth 2 my-voiture))))
	    ;)

      (bind button-01
	    "<KeyPress-p>"
	    (lambda (evt) (declare (ignore evt))
		    ;(if (= 0 pause)
			(set-pos-my-voiture my-voiture c (+ (nth 1 my-voiture) 40) (nth 2 my-voiture))))
            ;)

      (bind button-02
	    "<ButtonPress-1>"
	    (lambda (evt) (declare (ignore evt))
		    ;(setf pause 1))
	    ))


      )))	 
	    
