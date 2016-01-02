(defpackage :hello-world
  (:use :common-lisp :ltk)
  (:export #:main))

(in-package :hello-world)

(defun create-rue (canvas)
  (create-line canvas (list 20 0 20 900))
  (create-line canvas (list 780 0 780 900))
  (create-line canvas (list 210 0 210 900))
  (create-line canvas (list 400 0 400 900))
  (create-line canvas (list 590 0 590 900)))

(defun create-trace (inc canvas)
  (dotimes (x 10)
    ;;; rue 01
    (create-line canvas (list (+ 20 90) (+ inc 20 (* x 90)) (+ 20 90) (+ inc (* (+ x 1) 90))))
    (create-line canvas (list (+ 20 100) (+ inc 20 (* x 90)) (+ 20 100) (+ inc (* (+ x 1) 90))))
    (create-line canvas (list (+ 20 90) (+ inc 20 (* x 90)) (+ 20 100) (+ inc 20 (* x 90))))
    (create-line canvas (list (+ 20 90) (+ inc (* (+ x 1) 90)) (+ 20 100) (+ inc (* (+ x 1) 90))))
    ;;; rue 02
    (create-line canvas (list (+ 210 90) (+ 20 (* x 90)) (+ 210 90) (* (+ x 1) 90)))
    (create-line canvas (list (+ 210 100) (+ 20 (* x 90)) (+ 210 100) (* (+ x 1) 90)))
    (create-line canvas (list (+ 210 90) (+ 20 (* x 90)) (+ 210 100) (+ 20 (* x 90))))
    (create-line canvas (list (+ 210 90) (* (+ x 1) 90) (+ 210 100) (* (+ x 1) 90)))
    ;;; rue 03
    (create-line canvas (list (+ 400 90) (+ 20 (* x 90)) (+ 400 90) (* (+ x 1) 90)))
    (create-line canvas (list (+ 400 100) (+ 20 (* x 90)) (+ 400 100) (* (+ x 1) 90)))
    (create-line canvas (list (+ 400 90) (+ 20 (* x 90)) (+ 400 100) (+ 20 (* x 90))))
    (create-line canvas (list (+ 400 90) (* (+ x 1) 90) (+ 400 100) (* (+ x 1) 90)))
    ;;; rue 04
    (create-line canvas (list (+ 590 90) (+ 20 (* x 90)) (+ 590 90) (* (+ x 1) 90)))
    (create-line canvas (list (+ 590 100) (+ 20 (* x 90)) (+ 590 100) (* (+ x 1) 90)))
    (create-line canvas (list (+ 590 90) (+ 20 (* x 90)) (+ 590 100) (+ 20 (* x 90))))
    (create-line canvas (list (+ 590 90) (* (+ x 1) 90) (+ 590 100) (* (+ x 1) 90)))
))

(defun create-voiture (canvas x y)
  (defparameter corp-voiture-01 (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (defparameter corp-voiture-02 (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (defparameter borde-voiture-01 (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80))))
  (defparameter borde-voiture-02 (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
  (defparameter borde-voiture-03 (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80))))
  (defparameter borde-voiture-04 (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80)))))

(defun create-voiture-ennemi-type-01 (canvas x y)
  (defparameter corp-voiture-ennemi-01-01 (create-rectangle canvas (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (defparameter corp-voiture-ennemi-01-02 (create-rectangle canvas (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (defparameter borde-voiture-ennemi-01-01 (create-line canvas (list (- x 30) (- y 40) (- x 40) (- y 80))))
  (defparameter borde-voiture-ennemi-01-02 (create-line canvas (list (+ x 30) (+ y 60) (+ x 40) (+ y 80))))
  (defparameter borde-voiture-ennemi-01-03 (create-line canvas (list (- x 30) (+ y 60) (- x 40) (+ y 80))))
  (defparameter borde-voiture-ennemi-01-04 (create-line canvas (list (+ x 30) (- y 40) (+ x 40) (- y 80)))))

(defun set-position-voiture-ennemi-type-01 (canvas x y)
  (set-coords canvas corp-voiture-ennemi-01-01 (list (- x 30) (- y 40) (+ x 30) (+ y 60)))
  (set-coords canvas corp-voiture-ennemi-01-02 (list (- x 40) (- y 80) (+ x 40) (+ y 80)))
  (set-coords canvas borde-voiture-ennemi-01-01 (list (- x 30) (- y 40) (- x 40) (- y 80)))
  (set-coords canvas borde-voiture-ennemi-01-02 (list (+ x 30) (+ y 60) (+ x 40) (+ y 80)))
  (set-coords canvas borde-voiture-ennemi-01-03 (list (- x 30) (+ y 60) (- x 40) (+ y 80)))
  (set-coords canvas borde-voiture-ennemi-01-04 (list (+ x 30) (- y 40) (+ x 40) (- y 80))))

(defun init (canvas)
  (create-voiture canvas 400 800)
  (create-voiture-ennemi-type-01 canvas 400 300) 
  (create-rue canvas))

(defun increase (x)
  (+ x 30))


(defun re-run (x)
  (if (= x 100)
      (setq x 0)
      (setq x (+ x 5))))

(defun plus (x)
  (+ x 100))

(defparameter canvas (make-instance 'canvas
				:width 800
				:height 900))

(defun main ()
  (setf *debug-tk* nil)
  (with-ltk ()
    (let* ((c (make-instance 'canvas
			     :width 800
			     :height 900))
	   (i 0)
	   
	   )
      (init c)
      ;;;(setq v line)
      (set-position-voiture-ennemi-type-01 c 100 -100)
      (print i)
      (dotimes (k 100)
	(if (= i 960)
	    (setq i 0)
	    (setq i (+ i 10)))
	(set-position-voiture-ennemi-type-01 c 100 i)
	(create-trace 0 c)
	
	  ;;;(setq x (+ x 50))
	  ;;;(create-line c (list x 100 150 150))	
	(sleep 0.5)
	(pack c)
	))))
	 
	   
