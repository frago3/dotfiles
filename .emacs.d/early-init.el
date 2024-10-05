;; EARLY
(fset 'display-startup-echo-area-message 'ignore)
(setq inhibit-x-resources t
      frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      frame-title-format '("%b - emacs")
      use-short-answers t
      inhibit-splash-screen t
      initial-scratch-message nil)

(add-to-list 'default-frame-alist '(height . 56))
(add-to-list 'default-frame-alist '(width . 120)) 
;; Turn off graphical toolbars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (setq-default mode-line-format nil)

;; THEME
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(set-fringe-mode 11)
