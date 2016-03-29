;; Translate C-h to DEL
(keyboard-translate ?\C-h ?\C-?)
;; Define M-h to help  ---  please don't add an extra ' after help!
;; TEMPORARY (global-set-key "\M-h" 'help)

(menu-bar-mode -1)
(tool-bar-mode -1)

;; (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;; 		       '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;;       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
;;	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(setq standard-indent 8)
;;; (setq standard-indent 4)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq tab-stop-list (number-sequence 8 200 8))

(setq-default indent-tabs-mode 8) 
;;;(setq-default indent-tabs-mode nil)

(setq-default tab-width 8)

(setq c-default-style "bsd"
      c-basic-offset 8)

(setq inhibit-startup-message t)

(global-hl-line-mode 1)

;; set font for windows only (no dual frame with error on terminal)
(cond (window-system
	   (set-face-attribute 'default nil :font "DejaVu Sans Mono-10")
	   )) 

(setq initial-frame-alist
      `((left . 200) (top . 30)
        (width . 120) (height . 80)))

(setq column-number-mode t)

(add-to-list 'load-path "~/.emacs.d/")

(add-hook 'emacs-lisp-mode-hook '(lambda () (highlight-lines-matching-regexp ".\{81\}" "hi-green-b")))

(require 'color-theme)

;;; http://stackoverflow.com/questions/11690980/why-cant-i-use-old-theme-style-file-under-emacs-24-1
(defun plist-to-alist (the-plist)
  (defun get-tuple-from-plist (the-plist)
    (when the-plist
      (cons (car the-plist) (cadr the-plist))))

  (let ((alist '()))
    (while the-plist
      (add-to-list 'alist (get-tuple-from-plist the-plist))
      (setq the-plist (cddr the-plist)))
  alist))

;;; Color theme based on Tango Palette. Created by danranx@gmail.com
(defun color-theme-tango ()
  (interactive)
  (color-theme-install
   '(color-theme-tango
     ((background-color . "#2e3436")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "grey10"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#555753"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-constant-face ((t (:foreground "#8ae234"))))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf" :bold t))))
     (font-lock-string-face ((t (:foreground "#ad7fa8" :italic t))))
     (font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (font-lock-warning-face ((t (:bold t :foreground "#f57900"))))
     (font-lock-function-name-face ((t (:foreground "#edd400" :bold t :italic t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     )))

(provide 'color-theme-tango)

(cond (window-system
	   (color-theme-tango)
 	   )) 

(setq color-theme-is-global t)

;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
(setq delete-old-versions t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))) t)
 '(diff-removed ((t (:foreground "Red"))) t)
 '(hl-line ((t (:inherit highlight :background "dim gray")))))

;; matches parentheses
(show-paren-mode t)

(require 'ifdef)

(defun my-c-mode-common-hook ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; CEDET
;; (load-file "~/Software/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(ede-project-directories (quote ("/home/workspaces/jpalider/nzfault/main/src/nde"))))

(require 'saveplace)
(setq-default save-place t)

;;(desktop-save-mode t)
;; (require 'desktop)
 
;;disable the version control
;;
(setq vc-handled-backends nil) 

(desktop-save-mode 0)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

;; ;; saving and restoring files
;; (require 'windows)
;; (require 'recentf)
;; ;; -- load the saved windows automatically on boot
;; (add-hook 'window-setup-hook 'resume-windows)
;; ;; -- save place in file
;; (setq-default save-place t)
;; ;; --  use this command to quit and save your setup
;; (define-key ctl-x-map "C" 'see-you-again)

;; ;; -- set up window saving !! Place at end of .emacs file
;; (win:startup-with-window)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-auto-revert-mode t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(send-mail-function (quote smtpmail-send-it))
 '(session-use-package t nil (session)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(which-function-mode 1)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
