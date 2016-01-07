# Projet de programmation en Lisp

## Sujet
Demande: Programmer un jeu choisi en Lisp.  
Choix: Jeu de course d'automobile simplifié

## Durée
 * 3 semaines: de 18/12/2015 à 07/01/2016
 * Demo et Dépôt du code: 08/01/2016 

## Règle
Il faut contrôler la voiture principale, avec les touches Gauche et Droite du clavier, pour éviter la collision avec les obstacles qui sont les autres voitures.  
Le joueur doit passer tous les niveaux afin de gagner le jeu. Dans chaque niveau, la vitesse des obstacles augmente. Si une fois, la voiture principale est en collision avec un obstacle, le joueur est perdu le jeu et doit le recommencer. 

## Chargement du jeu sur Slime avec Quicklisp
1. Tapez sur Slime la commande: (ql:quickload "ltk")
2. Il faut aller dans le paquet LTK, donc tapez: (in-package :ltk) 
3. Compilez le fichier principal 
4. Tapez (main) sur Slime sur demarrer la fonction principale


## Guide d'utilisateur
1. Appuyez sur le bouton "Start" pour commencer le jeu  
2. Utilisez les boutons Gauche et Droite pour controler la voiture  
3. Apres avoir gagne un niveau, appuyez sur le bouton "Change Level" pour charger le niveau suivant et appuyez de nouveau sur le bouton "Start" pour commencer  
4. Vous gagnerez le jeu une fois passe tous les niveaux

## Outils
 * Implémentation de Lisp: sbcl et Slime (Emacs)
 * Gestionnaire des bibliothèques en Lisp: Quicklisp
 * UI bibliothèque: ltk

## Membres
 * DOAN Ngoc Long
 * MAI Trung Hieu
 * TRAN Trung Thang


