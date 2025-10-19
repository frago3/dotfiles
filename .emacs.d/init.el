;; FONT
(set-face-attribute 'default nil :family "monospace")
(set-face-attribute 'fixed-pitch nil :family "monospac")
(set-face-attribute 'variable-pitch nil :family "Roboto SemiCondensed" :height 120)
; (set-face-attribute 'minibuffer-prompt nil :font "PragmataPro Mono" :height 100)

(set-face-background 'default "#f2f2f2")
(setq-default line-spacing 1)
(setq text-scale-mode-step 1.1)

;; CONFIG
(blink-cursor-mode -1)
(electric-pair-mode 1)
(setq auto-save-default nil
      create-lockfiles nil
      make-backup-files nil
      completion-show-help nil)

;; MODES
(savehist-mode 1)
(save-place-mode 1)
(global-visual-line-mode 1)
(delete-selection-mode 1)

;; KEYS
(global-set-key (kbd "C-<next>") 'next-buffer)
(global-set-key (kbd "C-<prior>") 'previous-buffer)

;; ORG
(setq org-startup-folded 'overview)

;; HOOKS
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)


