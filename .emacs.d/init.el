(setq make-backup-files nil
      auto-save-default nil
      backup-inhibited nil
      create-lockfiles nil)

(blink-cursor-mode -1)
(set-face-background 'default "#f2f2f2")

; (let ((mono "monospace")
;       (proportional "Roboto Condensed"))
;   (set-face-attribute 'default nil :family mono :height 1.0)
;   (set-face-attribute 'tab-bar nil :family mono :height 1.0)
;   (set-face-attribute 'variable-pitch nil :family proportional :height 1.0)
;   (set-face-attribute 'fixed-pitch nil :family mono :height 1.0))
(let ((mono "monospace")
      (proportional "Roboto Condensed"))
  (set-face-attribute 'default nil :family mono)
  (set-face-attribute 'tab-bar nil :family mono)
  (set-face-attribute 'variable-pitch nil :family proportional)
  (set-face-attribute 'fixed-pitch nil :family mono))

; (setq text-scale-mode-step 1.1)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

;; HOOKS
; (add-hook 'org-mode-hook
;           (lambda ()
;             (variable-pitch-mode 1)
;             (text-scale-increase 1)))

;; MODES
(savehist-mode 1)
(global-visual-line-mode 1)


