# CS2500
;; Problem 1 

(define SCENE (empty-scene 150 150))
(define MESSAGE "QWERTY")

;; Input as time in seconds represented as a number
;; produces a simulation of a type writer for the string "QWERTY"
;; typewriter: Number -> World
;; Creates an animation given number

(define (typewriter TIME)
  (big-bang TIME
    [on-tick add1 1]
    [to-draw show-message]))

;; Input: string
;; Given a string and depending on its length either 
;; puts the picture of this string on the SCENE,
;; or shows the SCENE
;; show-message: String -> Image
;; Creates a picture given string

(define (show-message TIME)
  (cond
    [(< TIME (string-length MESSAGE))
     (place-image (text (substring MESSAGE 0 TIME) 10 "blue") 50 50 SCENE)]
    [else
     (place-image (text MESSAGE 10 "blue") 50 50 SCENE)]))

;; Problem 2
;; Input: string
;; Produces a simulation of backspacing on a type writer for 
;; a corresponding string
;; typewriter-backspace : String -> World
;; Creates an animation given string

(define (typewriter-backspace u)
  (big-bang u
    [to-draw show-message-backspace]
    [on-tick string-out 1]
    [stop-when are-we-done?]))

;; Input: String that we want to place on the SCENE
;; Given string and depending on its length either 
;; puts its picture on the SCENE, 
;; or places a picture of an empty string on the SCENE
;; show-message-backspace: String -> Image
;; Creates a picture given string

(define (show-message-backspace i)
  (cond
    [(< 0 (string-length i))
     (place-image (text (substring i 0 (string-length i)) 10 "blue") 50 50 SCENE)]
    [else
     (place-image (text "" 10 "blue") 50 50 SCENE)]))

;; Input: String that we want to trim
;; Given a string, trims its last symbol to create a new shorter string
;; string-out: String -> String
;; Trims a string

(define (string-out str)
  (substring str 0 (- (string-length str) 1)))

;; Input: String, about which we want to know
;; whether its length is less or equal to zero
;; Given a string asks if it's less or equal to zero
;; are-we-done? -> String -> Boolean

(define (are-we-done? str)
  (<= (string-length str) 0))

