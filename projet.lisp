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
    (loop for x from -1 to 10 do
      (push (create-rectangle canvas 110 (+ 10 (* x 100)) 120 (+ 90 (* x 100))) rue-01)
      (push (create-rectangle canvas 300 (+ 10 (* x 100)) 310 (+ 90 (* x 100))) rue-02)
      (push (create-rectangle canvas 490 (+ 10 (* x 100)) 500 (+ 90 (* x 100))) rue-03)
      (push (create-rectangle canvas 680 (+ 10 (* x 100)) 690 (+ 90 (* x 100))) rue-04)      
      )
    ;(mapcar #'(lambda (x) (itemconfigure canvas x :fill :white)) rue-01)
    ;(mapcar #'(lambda (x) (itemconfigure canvas x :fill :white)) rue-02)
    ;(mapcar #'(lambda (x) (itemconfigure canvas x :fill :white)) rue-03)
    ;(mapcar #'(lambda (x) (itemconfigure canvas x :fill :white)) rue-04)
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
  "Create the main car"
  (let ((fact0 (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60)))
	(fact1 (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80)))
	(fact2 (create-polygon canvas (list (- x 40) (- y 80) (+ x 40) (- y 80) (+ x 30) (- y 40) (- x 30) (- y 40))))
	(fact3 (create-polygon canvas (list (- x 40) (- y 80) (- x 40) (+ y 80) (- x 30) (+ y 60) (- x 30) (- y 40))))
	(fact4 (create-polygon canvas (list (- x 40) (+ y 80) (- x 30) (+ y 60) (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
	(fact5 (create-polygon canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80) (+ x 40) (- y 80) (+ x 30) (- y 40))))
	(fact6 (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80))))
	(fact7 (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
	(fact8 (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80))))
	(fact9 (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80))))
	(text1 (create-text canvas (- x 10) (- y 10) ""))
	(text2 (create-text canvas (- x 12) (+ y 5) ""))
	)
    (itemconfigure canvas fact0 :fill :red)
    (itemconfigure canvas fact2 :fill :#66FF99)
    (itemconfigure canvas fact3 :fill :black)
    (itemconfigure canvas fact4 :fill :#66FF99)
    (itemconfigure canvas fact5 :fill :black)
    (list (list fact0 fact1 fact2 fact3 fact4 fact5 fact6 fact7 fact8 fact9 text1 text2) x y 0 40 80)
    ))

;;; Modifier la position de voiture de joueur
;;; @param my-voiture - voiture de joueur
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees modifiees
(defun set-pos-my-voiture (my-voiture canvas x y)
  "Modify the main car's position"
  (setf (nth 1 my-voiture) x)
  (setf (nth 2 my-voiture) y)
  (set-coords canvas (nth 0 (car my-voiture)) (list (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (set-coords canvas (nth 1 (car my-voiture)) (list (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 2 (car my-voiture)) (list (- x 40) (- y 80) (+ x 40) (- y 80) (+ x 30) (- y 40) (- x 30) (- y 40)))
  (set-coords canvas (nth 3 (car my-voiture)) (list (- x 40) (- y 80) (- x 40) (+ y 80) (- x 30) (+ y 60) (- x 30) (- y 40)))
  (set-coords canvas (nth 4 (car my-voiture)) (list (- x 40) (+ y 80) (- x 30) (+ y 60) (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 5 (car my-voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80) (+ x 40) (- y 80) (+ x 30) (- y 40)))
  (set-coords canvas (nth 6 (car my-voiture)) (list (- x 30) (- y 40) (- x 40) (- y 80)))
  (set-coords canvas (nth 7 (car my-voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 8 (car my-voiture)) (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
  (set-coords canvas (nth 9 (car my-voiture)) (list (+ x 30) (- y 40) (+ x 40) (- y 80)))
  (set-coords canvas (nth 10 (car my-voiture)) (list (- x 10) (- y 10)))
  (set-coords canvas (nth 11 (car my-voiture)) (list (- x 12) (+ y 5))))

;;; Creer voiture ennemi de type 01 
;;; Longueur voiture : 160
;;; Largeur voiture : 80
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees d'initiales
(defun create-voiture-ennemi-type-01 (canvas x y)
  "Create a list of obstacles"
  (let ((fact0 (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60)))
	(fact1 (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80)))
	(fact2 (create-polygon canvas (list (- x 40) (- y 80) (+ x 40) (- y 80) (+ x 30) (- y 40) (- x 30) (- y 40))))
	(fact3 (create-polygon canvas (list (- x 40) (- y 80) (- x 40) (+ y 80) (- x 30) (+ y 60) (- x 30) (- y 40))))
	(fact4 (create-polygon canvas (list (- x 40) (+ y 80) (- x 30) (+ y 60) (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
	(fact5 (create-polygon canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80) (+ x 40) (- y 80) (+ x 30) (- y 40))))
	(fact6 (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80))))
	(fact7 (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
	(fact8 (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80))))
	(fact9 (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80))))
	(text1 (create-text canvas (- x 10) (- y 10) "Mai"))
	(text2 (create-text canvas (- x 12) (+ y 5) "Linh"))
	)
    (itemconfigure canvas fact0 :fill :white)
    (itemconfigure canvas fact2 :fill :green)
    (itemconfigure canvas fact3 :fill :green)
    (itemconfigure canvas fact4 :fill :green)
    (itemconfigure canvas fact5 :fill :green)
    (list (list fact0 fact1 fact2 fact3 fact4 fact5 fact6 fact7 fact8 fact9 text1 text2) x y 1 40 80)
    ))
 
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
  (set-coords canvas (nth 2 (car voiture)) (list (- x 40) (- y 80) (+ x 40) (- y 80) (+ x 30) (- y 40) (- x 30) (- y 40)))
  (set-coords canvas (nth 3 (car voiture)) (list (- x 40) (- y 80) (- x 40) (+ y 80) (- x 30) (+ y 60) (- x 30) (- y 40)))
  (set-coords canvas (nth 4 (car voiture)) (list (- x 40) (+ y 80) (- x 30) (+ y 60) (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 5 (car voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80) (+ x 40) (- y 80) (+ x 30) (- y 40)))
  (set-coords canvas (nth 6 (car voiture)) (list (- x 30) (- y 40) (- x 40) (- y 80)))
  (set-coords canvas (nth 7 (car voiture)) (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas (nth 8 (car voiture)) (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
  (set-coords canvas (nth 9 (car voiture)) (list (+ x 30) (- y 40) (+ x 40) (- y 80)))
  (set-coords canvas (nth 10 (car voiture)) (list (- x 10) (- y 10)))
  (set-coords canvas (nth 11 (car voiture)) (list (- x 12) (+ y 5))))

;;; Creer voiture ennemi de type 02 
;;; Longueur voiture : 200
;;; Largeur voiture : 100
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) - coordonnees d'initiales
(defun create-voiture-ennemi-type-02 (canvas x y)
  (let ((fact0 (create-rectangle canvas (- x 35) (+ y 70) (+ x 35) (+ y 100)))
	(fact1 (create-rectangle canvas (- x 50) (- y 100) (+ x 50) (+ y 70))))
    (itemconfigure canvas fact0 :fill :blue)
    (itemconfigure canvas fact1 :fill :orange)
    (list (list fact0 fact1) x y 2 50 100))
  )

;;; Modifier la position d'une voiture ennemi type 02
;;; @param voiture - objet voiture 
;;; @param canvas - le canvas qui contient objet
;;; @param (x,y) coordonnees modifiees
(defun set-pos-voiture-ennemi-type-02 (voiture canvas x y)
  (setf (nth 1 voiture) x)
  (setf (nth 2 voiture) y)
  (set-coords canvas (nth 0 (car voiture)) (list (- x 35) (+ y 70) (+ x 35) (+ y 100)))
  (set-coords canvas (nth 1 (car voiture)) (list (- x 50) (- y 100) (+ x 50) (+ y 70))))

;;; Random type des voiture
(defun random-type ()
  (1+ (random 2)))

;;; Random quelle line qu'on creer une voiture ennemi
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
(defun delete-out-of-screen-voiture-ennemi (canvas l)
  "Delete an obstacle out of the screen"
  (if (endp l)
      '()
      (dotimes (k (length l))
	(if (> (nth 2 (nth k l)) 1000)
	    (progn
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

(defun level-title (level)
  (cond ((= level 1) "--- Level 01 (Easy) - Hong Kong ---")
	((= level 2) "--- Level 02 (Normal) - Thailand ---")
	((= level 3) "--- Level 03 (Very Hard) - Vietnam (The Deadth Race) ---")
	(t "---")))

(defun run-loop (c level run race rue my-voiture ennemi)
  ;;; run rue
  (if (= run 100)
      (setq run 0)
      (setq run (+ run (level-speed level))))
  (set-trace-rue c run rue)
  ;;; run race
  (setq race (1+ race))
  ;;; random obstacles
  (if (= (mod race (- 80 (* 20 level))) 0)
      (if (= (random-type) 1)
	  (push (create-voiture-ennemi-type-01 c (random-line) -60) ennemi)
	  (push (create-voiture-ennemi-type-02 c (random-line) -100) ennemi)))
  ;;; run obstacles
  (mapcar #'(lambda (x) (if (= (nth 3 x) 1)
			    (set-pos-voiture-ennemi-type-01 x c (nth 1 x) (+ 5 (level-speed level) (nth 2 x)))
			    (set-pos-voiture-ennemi-type-02 x c (nth 1 x) (+ 5 (level-speed level) (nth 2 x)))))
	  ennemi)
  (delete-out-of-screen-voiture-ennemi c ennemi)
  ;;; check if there is an accident
  (if (incident-voiture my-voiture ennemi)
      (print "Il y a une incident"))
  
  ;;; sleep and loop
  (if (and (< race (* level 1000))
	   (eq (incident-voiture my-voiture ennemi) nil))
      (after 25 #'(lambda () (run-loop c level run race rue my-voiture ennemi)))
      (let ((check (incident-voiture my-voiture ennemi)))
	(setq race 0)
	(dotimes (x (length ennemi))
	  (mapcar #'(lambda (x) (itemdelete c x)) (nth 0 (nth x ennemi))))
	(dotimes (x (length ennemi))
	  (pop ennemi))
	(set-pos-my-voiture my-voiture c 400 500)
	(let ((win-text "Congratulation, You Win the RACEEE !!")
	      (lose-text "Sorry, You LOSE !!"))
	  (if (eq check t)
	      (create-text c (- 400 (* 7 (/ (length lose-text) 2))) 300 lose-text)
	      (create-text c (- 400 (* 7 (/ (length win-text) 2))) 300 win-text))
	  )
	)
      )	  
)

    
(defun level-text (level)
  (cond ((= level 1) "Easy")
	((= level 2) "Normal")
	((= level 3) "Very Hard")
	(t "")))

(defun main ()
  (setf *debug-tk* nil)
  (with-ltk ()
    (let* ((f (make-instance 'frame
			     :width 800
			     :height 700
			     :master nil))
	   (c (make-instance 'canvas
			     :master f
			     :width 800
			     :height 600))
	   (header (make-instance 'canvas
				  :master f
				  :width 800
				  :height 40))
	   (footer (make-instance 'canvas
				  :master f
				  :width 800
				  :height 30))
	   (title (create-text header 10 10 "WELCOME TO FORMULAR 1 - Press Start to Play"))	  
	   (level 1)
	   (infos (create-text footer (- 400 (* 8 (/ (length (level-text level)) 2))) 10 (level-text level)))
	   (run 0)
	   (race 0)
	   (rue (create-trace-rue c))
	   (my-voiture (create-my-voiture c 380 500))
	   (ennemi '())
	   (button-01 (make-instance 'button
				     :master f
				     :text "Start"))	   
	   (button-02 (make-instance 'button
				     :master f
				     :text "Change Level")))
      ;;; initaliser
      (pack header) 
      (pack c)
      (pack f)
      (pack button-01)
      (pack button-02 :side :top)
      (pack footer)
      (create-rue c)

      (bind button-01
	    "<ButtonPress-1>"
	    (lambda (evt) (declare (ignore evt))		    
		    (itemconfigure header title :text (level-title level))
		    (clear c)
		    (create-rue c)
		    (setf my-voiture (create-my-voiture c 380 500))
		    (setf rue (create-trace-rue c))
		    (run-loop c level run race rue my-voiture ennemi))) 
      
      (bind button-01
	    "<KeyPress-Left>"
	    (lambda (evt) (declare (ignore evt))
		    (if (> (nth 1 my-voiture) 120)
			(set-pos-my-voiture my-voiture c (- (nth 1 my-voiture) 40) (nth 2 my-voiture)))))

      (bind button-01
	    "<KeyPress-Right>"
	    (lambda (evt) (declare (ignore evt))
		    (if (< (nth 1 my-voiture) 700) 
			(set-pos-my-voiture my-voiture c (+ (nth 1 my-voiture) 40) (nth 2 my-voiture)))))

      (bind button-02
	    "<ButtonPress-1>"
	    (lambda (evt) (declare (ignore evt))
		    (setq level (1+ level))
		    (if (= level 4)
			(setq level 1))		    
		    (itemconfigure footer infos :text (level-text level))))
      
      
      )))	 
	    
