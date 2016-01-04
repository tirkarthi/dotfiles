(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-electric-keywords t)
 '(cperl-hairy t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("e8ec37b1c621080e9aa796b1e1126566e4b4b2f59763a57e82147af104c6a6ef" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a772eafba4eda0ed57a5d651a96804487a1dacbfbf8658084bfe84546a7c7008" default)))
 '(fci-rule-color "#49483E")
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-diff-use-overlays nil)
 '(org-agenda-files (quote ("~/OrgTutorial.org")))
 '(send-mail-function (quote smtpmail-send-it))
 '(vc-annotate-background nil)
 '(weechat-color-list
   (unspecified "#000000" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

(add-to-list 'load-path (expand-file-name "~/.emacs.d") t)

(setq-default indent-tabs-mode nil)

(require 'cl-lib)

;; ========== Enable Line and Column Numbering ==========

;; ========== Line by line scrolling ==========

;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing

(setq scroll-step 1)

;; ===== Set the highlight current line minor mode =====

;; Show line-number in the mode line
(global-linum-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; In every buffer, the line which contains the cursor will be fully highlighted

(global-hl-line-mode -1)

(tool-bar-mode -1)

(blink-cursor-mode 0)

(menu-bar-mode -1)

(cua-mode 1)

(show-paren-mode 1)

(electric-pair-mode 1)

;;; Always do syntax highlighting
(global-font-lock-mode 1)

(global-auto-revert-mode)

(global-visual-line-mode)

(transient-mark-mode 1)

(desktop-save-mode 1)

(scroll-bar-mode -1)

;;; Also highlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;;; This is the binary name of my scheme implementation
(setq scheme-program-name "mit-scheme")

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(windmove-default-keybindings)

;; (require 'sr-speedbar)
(set-default-font "Monospace 11")

;; (require 'auto-complete-config)
;; (ac-config-default)

;; (require 'sr-speedbar)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one

;; Indentation help
(global-set-key (kbd "C-^") 'prelude-top-join-line)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

;; Start a regular shell if you prefer that.
(global-set-key (kbd "C-x M-m") 'shell)

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)

;; A quick major mode help with discover-my-major
(define-key 'help-command (kbd "C-m") 'discover-my-major)

(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)

(define-key 'help-command (kbd "C-i") 'info-display-manual)

;; a complement to the zap-to-char command, that doesn't eat up the target character
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-Z") 'zap-up-to-char)

;; kill lines backward
(global-set-key (kbd "C-<backspace>") (lambda ()
                                        (interactive)
                                        (kill-line 0)
                                        (indent-according-to-mode)))

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(unless (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<f11>") 'prelude-fullscreen))

;; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

(global-set-key (kbd "C-c j") 'ace-jump-mode)
(global-set-key (kbd "s-.") 'ace-jump-mode)
(global-set-key (kbd "C-c J") 'ace-jump-buffer)
(global-set-key (kbd "s->") 'ace-jump-buffer)
(global-set-key (kbd "s-w") 'ace-window)

(provide 'prelude-global-keybindings)

;;; prelude-global-keybindings.el ends here

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )


(defun iswitchb-local-keys ()
      (mapc (lambda (K) 
	      (let* ((key (car K)) (fun (cdr K)))
    	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))

(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

(setq-default cursor-type 'bar)

;; Key chord mode definitions

(key-chord-mode 1)

(key-chord-define-global "gg" 'execute-extended-command)

;; Key chord bindings end here

(global-auto-revert-mode)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "M-k") 'kill-this-buffer)

;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0/")
;; (require 'yasnippet)
;; (yas-global-mode 1)

(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)
(put 'upcase-region 'disabled nil)

;; (add-to-list 'ac-sources 'ac-source-jedi-direct)

(require 'jedi)
(add-hook 'python-mode-hook 'jedi-setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(load-theme 'monokai)

;; (require 'clojure-mode)
(put 'dired-find-alternate-file 'disabled nil)

(setq-default linum-format "%d  ")

(server-start)

(defun jedi-mode-key-bindings ()
  (local-set-key (kbd "C-;") 'jedi:goto-definition)
  (local-set-key (kbd "C-'") 'jedi:goto-pop-marker)
  (local-set-key (kbd "C-,") 'jedi:show-doc)
  )

(add-hook 'jedi-mode-hook 'jedi-mode-key-bindings)
