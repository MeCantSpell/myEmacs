;; Already There :P
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(challenger-deep))
 '(custom-safe-themes
   '("961ab0e773a65a40e1d79cea9dd2d2a1b249040c1e8c0051e4fbd0b79bf33ca4"
     "889584526e36775884a0018e70cafcd7b4c1adca1232c97653676938afb5474c"
     default))
 '(package-selected-packages '(eat magit pink-bliss-uwu-theme))
 '(warning-suppress-types '((use-package) (use-package) (use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Stop startup message
(setq inhibit-splash-screen t)

;; Monaspace Krypton
(set-face-attribute 'default nil :font "Monaspace Krypton" :height 140)

;; Disable tools
(tool-bar-mode -1)

;; Disable bell sound
(setq ring-bell-function 'ignore)

;; Start in fullscreen
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Adds lines to C programming
;; We have to add a hook here, the code of the hook executes only when the valid actions happenre
(add-hook 'c-mode-hook 'display-line-numbers-mode)

;; Adds lines to Python programming
(add-hook 'python-mode-hook 'display-line-numbers-mode)

;;Org mode settings
;;Add org mode for files ending with ".org"
;;Adds shorthand for org mode
;;Remove the emphasis markers (syntax) and the leading stars of the headings
;;Starts org mode in auto-fill
;;Sets auto-fill to 100 (the way God intended)
;;Allows alpahabetical lists in org mode
(require 'org)
(require 'org-tempo)
(setq org-hide-emphasis-markers t)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook
	  (lambda ()
	    (setq fill-column 100)))
(setq org-list-allow-alphabetical t)

;;Function that should work to restart Emacs when it is started from the taskbar instead of a CLI console
;;The lambda part runs it elevated to allow for admin privileges
(defun revive-emacs ()
  (interactive)
  (let ((cmd (expand-file-name "runemacs.exe" invocation-directory)))
    (add-hook 'kill-emacs-hook
              (lambda ()
                (call-process "powershell" nil 0 nil
                              "-Command"
                              (format "Start-Process '%s' -Verb RunAs" cmd))))
    (save-buffers-kill-emacs)))
