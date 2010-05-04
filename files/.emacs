;; ========== .emacs customization file ==========
;; Thanks to Georg Brandl for the base .emacs file
;; See: http://paste.pocoo.org/show/110736/

;; Set up load path
(setq load-path `("~/.emacs.d"
                  "/usr/local/share/emacs/site-lisp"
                  ,@load-path))

;; Don't show so many messages on startup
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; ========== Global Settings ==========

;; Use UTF-8 (still necessary?)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Require final newline
(setq-default require-final-newline t)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Show buffer boundaries
(setq default-indicate-buffer-boundaries t)

;; Avoid using tabs
(setq-default indent-tabs-mode nil)

;; Show line and column numbers in the modeline
(setq line-number-mode t)
(setq column-number-mode t)

;; Highlight matching parentheses
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(show-paren-mode t)

;; Set background color
(when window-system
  (set-background-color "gray97"))

;; Set cursor color
(set-cursor-color "green")

;; Enable syntax highlighting
(global-font-lock-mode t)

;; Scroll one line at a time
(setq scroll-step 1)

;; Make "yes or no" "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Window frame title
(setq frame-title-format "emacs [%b %*%+ %f]")
(setq icon-title-format "emacs [%b]")

;; No audible bells
(setq visible-bell t)

;; No backup files
(setq make-backup-files nil)

;; Mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control))))

;; Hippie Expand
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; ========== Additional packages to load ==========

;; Generic config file modes
(require 'generic-x)

;; Electric help
(require 'ehelp)

;; Whitespace
(require 'whitespace)

;; ========== Keybindings ==========

;; Automatically indent on return
(global-set-key (kbd "RET") 'newline-and-indent)

;; Hippie-expand on M-/
(global-set-key (kbd "M-/") 'hippie-expand)

;; Default to electric help
(define-key global-map "\C-h" 'ehelp-command)
(define-key global-map [help] 'ehelp-command)
(define-key global-map [f1] 'ehelp-command)

;; Toggle whitespace display
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; ========== Modes ==========

;; Auto-fill in text mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Whitespace mode
(setq whitespace-style '(trailing tabs tab-mark))

;; Flyspell
(setq-default ispell-program-name "aspell")
(setq-default ispell-extra-args '("--dont-suggest"))
(setq-default ispell-dictionary "en_US")

;; ========== Scheme mode specifics ==========
(setq scheme-program-name "/usr/local/bin/gsi -:d-")
(autoload 'gambit-inferior-mode "gambit" "Hook Gambit mode into cmuscheme.")
(autoload 'gambit-mode "gambit" "Hook Gambit mode into scheme.")
(add-hook 'inferior-scheme-mode-hook (function gambit-inferior-mode))
(add-hook 'scheme-mode-hook (function (lambda ()
                                        (gambit-mode)
                                        (auto-fill-mode 1)
                                        (flyspell-prog-mode))))
(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))

;; ========== Emacs managed settings ==========

(custom-set-variables)
(custom-set-faces
 '(default ((t (:height 110 :family "DejaVu Sans Mono")))))
