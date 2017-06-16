

(setq compilation-scroll-output t) 
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'nil)
(setq mac-option-modifier 'meta)
(set-keyboard-coding-system nil)

;; Emacs debugging
; C-u ESC C-x = 



;; full path of file in buffer
(menu-bar-mode -1) ;;remove bar with "File, Open, Edit, Buffer..."
(defun  rename-buffer-fullpath () ;;display more than filename in buffer name
  (interactive)
  (rename-buffer
   (substring
    (abbreviate-file-name (buffer-file-name)) -40 -1)))
(global-set-key (kbd "C-x 7") 'rename-buffer-fullpath)





;;;; PDF
;(setq doc-view-ghostscript-program "/opt/local/bin/gs")
;; (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin/:"))
(setq exec-path (append exec-path '("/opt/local/bin/")))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . no-pdf))
    (defun no-pdf ()
      "Run pdftotext on the entire buffer."
      (interactive)
      (let ((modified (buffer-modified-p)))
        (erase-buffer)
        (shell-command
         (concat "pdftotext " (buffer-file-name) " -")
         (current-buffer)
         t)
        (set-buffer-modified-p modified)))

;; Terminal-emulator
(defun run-ansi-term-bash () (interactive) (ansi-term "/bin/bash"))
;(global-set-key [f1] 'run-ansi-term-bash)
(global-set-key (kbd "C-x 6") 'run-ansi-term-bash)


;; Toggle window split Hor <-> Ver
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))


(global-set-key (kbd "C-x 5") 'toggle-window-split)
(toggle-window-split)
;(define-key ctl-x-4-map "t" 'toggle-window-split)

;;;;;; Prolog

(setq auto-mode-alist
  (cons (cons "\\.pl" 'prolog-mode)
     auto-mode-alist))



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
(ido-mode 'buffers) ;; only use this line to turn off ido for file names!
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"
	       "nrepl-server vexx"
	       "*nrepl-messages*"
	       "cider-repl vexx"
	       "*cider-doc*"
	       "*scratch*"
	       "*Help*"
	       "*Disabled Command*"
	       ))
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command" "*scratch*"))


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
; Emacs colors
;------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(doc-view-continuous t)
 '(doc-view-dvipdf-program "/opt/local/bin/dvipdf")
 '(doc-view-dvipdfm-program "/opt/local/bin/dvipdf")
 '(doc-view-ghostscript-program "/opt/local/bin/gs")
 '(doc-view-pdftotext-program "/Users/kowaraj/usr/bin/pdftotext")
 '(doc-view-ps2pdf-program "/opt/local/bin/ps2pdf"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f8] 'neotree-toggle)

;; Set bigger fonts
(set-default-font "Ubuntu Mono-16")

(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")


(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)


;;(add-hook 'clojure-mode-hook 'paredit-mode)
(require 'package)

(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)

;; Set bigger fonts
(set-default-font "Ubuntu Mono-16")

(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")

;;(add-hook 'clojure-mode-hook 'paredit-mode)
(global-set-key [f8] 'neotree-toggle)

;; Show parenthesis mode
(show-paren-mode 1)
