;; EARLY

(setq inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil
      inhibit-splash-screen t
      use-short-answers t
      frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      frame-title-format '("%b - Emacs"))

;; (add-to-list 'default-frame-alist '(width . 122))
(add-to-list 'default-frame-alist '(height . 58))

;; Turn off graphical toolbars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

