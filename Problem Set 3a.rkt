;;SCENE DEFINITIONS
(define WIDTH 600) ;;height of the scene
(define HEIGHT 50) ;;width of the scene
(define MIDDLE-HEIGHT (/ HEIGHT 2)) ;;middle of the scene vertically
(define MIDDLE-WIDTH (/ WIDTH 2)) ;;middle of the scene horizontally
(define SCENE (empty-scene WIDTH HEIGHT)) ;;create the scene itself

;;TEXT CHARACTERISTIC DEFINITIONS
(define FONT-SIZE 10) ;;size of the font
(define FONT-COLOR "black") ;;color of the font

;; Adds a string to an empty scene, as an image,
;; in front of any text already on the scene
;; show-message: string -> image
;; Produces an image, given string

;; Template:
#;(define (sh-ms-tmpl str)
  (place-image/align ...))

(define (show-message str)
  (place-image/align (text str FONT-SIZE FONT-COLOR)
                     0
                     MIDDLE-HEIGHT
                     "left"
                     "center"
                     SCENE))

(check-expect (show-message "Hello World")
              (place-image/align (text "Hello World" FONT-SIZE FONT-COLOR)
                     0
                     MIDDLE-HEIGHT
                     "left"
                     "center"
                     SCENE))

;; Adds a new string in front of an existing one 
;; string-prepend: string -> string
;; Produces a string, given string

;; Template:
#; (define (string-prepend strA strB)
     (string-append ... ...))

;; Code
(define (string-prepend strA strB)
  (string-append strB strA))

;; Tests
(check-expect (string-prepend "this is how" "Yoda talks ")
              "Yoda talks this is how")
  

;; launches the program with string "str" already in place
;; stacked: string -> WorldState
;; Produces an interactive typewriter given string

;; Template:
#; (define (stacked-tmpl s)
     (big-bang s
               [...]
               [to-draw ...]))

;; Code 
(define (stacked str)
  (big-bang str
    [to-draw show-message]
    [on-key string-prepend]))

;; Tests
(check-expect (stacked "Hello World")
             "Hello World")
