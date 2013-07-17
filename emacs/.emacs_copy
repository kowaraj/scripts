;------------------------------
; General
;------------------------------
(setq x-select-enable-clipboard t) ; to enable system-COPY_PASTE
(setq blink-matching-paren t)
(show-paren-mode 1)
(setq show-paren-delay 0)

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


(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

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
