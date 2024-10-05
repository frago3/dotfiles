;; FONT
(set-face-attribute 'default nil :font "Iosevka Aile")
(set-face-attribute 'tab-bar nil :font "Iosevka Aile")
(setq-default line-spacing 4)

;; CONFIG
(set-face-attribute 'fringe nil :background nil)
(global-visual-line-mode t)
(setq text-scale-mode-step 1.05)
(setq auto-save-default nil
      create-lockfiles nil
      make-backup-files nil)

(savehist-mode 1)
(save-place-mode 1)
(setq-default indent-tabs-mode nil)
(setq completion-show-help nil)

;; HOOKS
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'text-mode-hook (lambda () (text-scale-set 3)))
(add-hook 'prog-mode-hook (lambda () (text-scale-set 3)))

;;; PACKAGES
;;; Set up package.el to work with MELPA
;(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)
;;; Download Evil
;(unless (package-installed-p 'evil) (package-install 'evil))

;; EVIL MODE
(require 'evil)
(evil-mode 1)

(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)
(evil-define-key 'normal 'global (kbd "C-s") 'save-buffer)
(evil-define-key 'normal 'global (kbd "C-<next>") 'tab-bar-switch-to-next-tab)
(evil-define-key 'normal 'global (kbd "C-<prior>") 'tab-bar-switch-to-prev-tab)

(evil-set-leader nil (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>tt") 'tab-bar-new-tab)
