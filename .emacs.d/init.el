
(setq make-backup-files nil
      auto-save-default nil
      backup-inhibited nil
      create-lockfiles nil)

(blink-cursor-mode -2)
(set-face-background 'default "#f2f2f2")

(set-face-attribute 'default nil :family "monospace")
(set-face-attribute 'tab-bar nil :family "monospace")
(set-face-attribute 'fixed-pitch nil :family "monospace")
(set-face-attribute 'variable-pitch nil :family "Roboto SemiCondensed")
(setq text-scale-mode-step 1.1)

(setq-default indent-tabs-mode nil)

;; KEY
(global-set-key (kbd "C-x b") 'electric-buffer-list)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand)
; (define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

;; MODES
(savehist-mode 1)
(global-visual-line-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)
