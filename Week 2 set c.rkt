;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Week 2 set c|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;; CS2500
;; Problem 1 

(define SCENE (empty-scene 150 150))
(define MESSAGE "QWERTY")

;; Input as time in seconds represented as a number
;; produces a simulation of a type writer for the string "QWERTY"
;; typewriter: Number -> World
;; Creates an animation given number
;; Template:
#; (define (typewriter TIME)
     (big-bang TIME
               [on-tick...]
               [to-draw...]))


(define (typewriter TIME)
  (big-bang TIME
    [on-tick add1 1]
    [to-draw show-message]))

;; Input: string
;; Given a number and produces a picture
;; of string with a length of the number on the SCENE,
;; show-message: String -> Image
;; Creates a picture of string MESSAGE given number
;;template:
#;(define (show-message TIME)
  (cond
    [...
     (place-image (text ...))]
    [else
     (place-image (text ...))]))

(define (show-message TIME)
  (cond
    [(< TIME (string-length MESSAGE))
     (place-image (text (substring MESSAGE 0 TIME) 10 "blue") 50 50 SCENE)]
    [else
     (place-image (text MESSAGE 10 "blue") 50 50 SCENE)]))

;;-----------------------------------------------------------------------------------
;; Problem 2
;; Input: string
;; Produces a simulation of backspacing on a type writer for 
;; a corresponding string
;; typewriter-backspace : String -> World
;; Creates an animation given string
;;template:
#;(define (typewriter-backspace str)
     (big-bang str
               [on-tick...]
               [to-draw...]
               [stop-when...]))


(define (typewriter-backspace str)
  (big-bang str
    [to-draw show-message-backspace]
    [on-tick string-out 1]
    [stop-when are-we-done?]))

;; Input: String that we want to place on the SCENE
;; Given string and depending on its length either 
;; puts its picture on the SCENE, 
;; or places a picture of an empty string on the SCENE
;; show-message-backspace: String -> Image
;; Creates a picture given string
;;template:
#;(define (show-message-backspace i)
  (cond
    [...
     (place-image (text ...))]
    [else
     (place-image (text ...))]))

(define (show-message-backspace i)
  (cond
    [(< 0 (string-length i))
     (place-image (text i 10 "blue") 50 50 SCENE)]
    [else
     (place-image (text "" 10 "blue") 50 50 SCENE)]))

;; Input: String that we want to trim
;; Given a string, trims its last symbol to create a new shorter string
;; string-out: String -> String
;; Trims a string
;;template:
#;(define (string-out str)
     (substring(str...)))

(define (string-out str)
  (substring str 0 (- (string-length str) 1)))

;; Input: String, about which we want to know
;; whether its length is less or equal to zero
;; Given a string asks if it's less or equal to zero
;; are-we-done? -> String -> Boolean
;;template:
#; (define (are-we-done? str)
       (<= (string-length...)...))

(define (are-we-done? str)
  (<= (string-length str) 0))
