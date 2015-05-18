(setq compilation-scroll-output t) 
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'nil)
(setq mac-option-modifier 'meta)
(set-keyboard-coding-system nil)

;; Ruby Eval, Ben Eills
  (defun ruby-eval-region()
      "Prints the evaluation of Ruby statements in region to a new output buffer"
          (interactive)
              (let ((output-buffer "Ruby Output"))
                    (shell-command-on-region (mark) (point) "ruby" output-buffer)
                          (switch-to-buffer output-buffer)))
                            
                              (defun ruby-pretty-print()
                                  "Pretty prints the evaluation of a Ruby expression in region to a new output buffer"
                                      (interactive)
                                          (save-excursion
                                                (let ((code (buffer-substring (mark) (point)))
                                                        (code-buffer (generate-new-buffer "ruby-code")))
                                                            (switch-to-buffer code-buffer)
                                                                (insert (concat "require 'pp'\nputs (" code ")\n"))
                                                                    (mark-whole-buffer)
                                                                        (ruby-eval-region)
                                                                            (kill-buffer code-buffer))))

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
             (when (< emacs-major-version 24)
               ;; For important compatibility libraries like cl-lib
                 (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
                 (package-initialize) ;; You might already have this line

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;---
; Ruby
;---

  (add-to-list 'auto-mode-alist
                '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
                   (add-to-list 'auto-mode-alist
                                  '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;---
; c++ autocompletion
;---

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;------------------------------
; General
;------------------------------
(setq visible-bell t)

(setq default-frame-alist '(
    (width . 140)    
    (height . 40) ))    

(setq make-backup-files nil)
(setq-default truncate-lines t)
(setq x-select-enable-clipboard t) ; to enable system-COPY_PASTE
(setq blink-matching-paren t)
(show-paren-mode 1)
(setq show-paren-delay 0)

(global-set-key "%" 'match-paren)
                    
;; transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 85))
  (add-to-list 'default-frame-alist '(alpha 95 85))
(eval-when-compile (require 'cl))
 (defun toggle-transparency ()
    (interactive)
       (if (/=
               (cadr (frame-parameter nil 'alpha))
                       100)
                              (set-frame-parameter nil 'alpha '(100 100))
                                   (set-frame-parameter nil 'alpha '(85 50))))
                                    (global-set-key (kbd "C-c t") 'toggle-transparency)

;;


(defun match-paren (arg)
"Go to the matching paren if on a paren; otherwise insert %."
(interactive "p")
(cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
      ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
      (t (self-insert-command (or arg 1)))))
  
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-pargraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(require 'ido)
(ido-mode t)
;;; Disable auto-search of C-x C-f
;; disable auto searching for files unless called explicitly with C-c C-s
(setq ido-auto-merge-delay-time 99999)
(define-key ido-file-dir-completion-map (kbd "C-c C-s")
  (lambda()
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

;;; General Emacs window navigation setting

;scrolling line-by-line

;way#1 smooth scrolling
(setq scroll-step           1
        scroll-conservatively 10000)

;way#2: DONOT keep the cursors's line number

(defun one-line-down (n)
  (interactive "p")
  ;  (previous-line n)
      (scroll-down n))

(defun one-line-up (n)
  (interactive "p")
  ;  (next-line n)
      (scroll-up n))

;(global-set-key [M-n] 'one-line-up)
;(global-set-key [M-p] 'one-line-down)
(global-set-key (kbd "M-n") 'one-line-up)
(global-set-key (kbd "M-p") 'one-line-down)

(windmove-default-keybindings 'meta) ;;SHIFT by default
(winner-mode t) ;;window's history
(ido-mode t) ;;^C-x ^C-b = buffer's line
(tool-bar-mode -1) ;;disable the toolbar
(scroll-bar-mode -1) ;;disable the scrollbars
;;(global-linum-mode t) ;;show line number on the side
(line-number-mode 1) ;;show line number in the statusbar


;; (global-set-key (kbd "C-c <left>")  'windmove-left)
;; (global-set-key (kbd "C-c <right>") 'windmove-right)
;; (global-set-key (kbd "C-c <up>")    'windmove-up)
;; (global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
              '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))



;------------------------------
; C plus plus
;------------------------------

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))

;; (defun my-c++-mode-hook ()
;;   (setq c-basic-offset 4)
;;   (c-set-offset 'substatement-open 0))
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-c-mode-common-hook ()
 ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
 (c-set-offset 'substatement-open 0)
 ;; other customizations can go here

 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)                  ;; Default is 2
 (setq c-indent-level 4)                  ;; Default is 2

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)  ; use spaces only if nil
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



;------------------------------
; Octave
;------------------------------

;;; Octave in emacs

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
    (lambda ()
        (abbrev-mode 1)
        (auto-fill-mode 1)
        (if (eq window-system 'x)
        (font-lock-mode 1))))

(autoload 'run-octave "octave-inf" nil t)
(setq inferior-lisp-program "~/usr/labrepl/script/swank")
(setq inferior-octave-program "/opt/local/bin/octave")



;------------------------------
; Clojure
;------------------------------

;; Load a major mode for editing Clojure code.
(add-to-list 'load-path "~/usr/clojure/clojure-mode/")
(require 'clojure-mode)

(add-to-list 'load-path "~/usr/clojure")
(add-to-list 'load-path "~/usr/src/clj")
(add-to-list 'load-path "~/usr/src")


;------------------------------
; Emacs colors
;------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
