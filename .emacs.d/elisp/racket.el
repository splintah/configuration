(use-package racket-mode
  :mode "\\.rkt\\'"
  :config
  (evil-leader/set-key-for-mode 'racket-mode
    "cc" 'racket-run
    "cd" 'racket-doc
    "cee" 'racket-expand-last-sexp
    "cef" 'racket-expand-file
    "cer" 'racket-expand-region
    "cex" 'racket-expand-definition
    "cf" 'racket-fold-all-tests
    "ck" 'racket-run
    "cl" 'racket-logger
    "co" 'racket-profile
    "cp" 'racket-cycle-paren-shapes
    "cr" 'racket-send-region
    "ct" 'racket-test
    "cu" 'racket-unfold-all-tests
    "cz" 'racket-repl
    "c." 'racket-describe
    "xe" 'racket-send-last-sexp))
