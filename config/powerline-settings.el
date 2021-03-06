;; Powerline
;(require 'powerline)
;(powerline-default)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)

(setq powerline-arrow-shape 'arrow)

;; Setup colors
;(setq powerline-color1 "#598559"
;     powerline-color2 "#383838")
(set-face-foreground 'mode-line "#030303")
;(set-face-background 'mode-line "#f0dfaf")

;; Setup modeline items
(defun gcs-propertized-evil-mode-tag ()
  (propertize evil-mode-line-tag 'font-lock-face
    ;; Don't propertize if we're not in the selected buffer
    (cond ((not (eq (current-buffer) (car (buffer-list)))) '())
          ((evil-emacs-state-p)  '(:background "red"))
          ((evil-motion-state-p) '(:background "orange"))
          ((evil-visual-state-p) '(:background "IndianRed3" :foreground "white"))
          ((evil-insert-state-p) '(:background "cornflower blue"))
          (t '()))))

(setq-default mode-line-format
  (list "%e"
    '(:eval (concat
             (gcs-propertized-evil-mode-tag)
             (powerline-rmw         'left   nil)
             (powerline-buffer-id   'left   nil powerline-color1)
             (powerline-major-mode  'left   powerline-color1)
             (powerline-make-text   " :"   powerline-color1)
             (powerline-minor-modes 'left   powerline-color1)
             (powerline-narrow      'left   powerline-color1 powerline-color2)
             (powerline-vc          'center powerline-color2)
             (powerline-make-fill           powerline-color2)
             (powerline-row         'right  powerline-color1 powerline-color2)
             (powerline-make-text   ":"     powerline-color1)
             (powerline-column      'right  powerline-color1)
             (powerline-percent     'right  nil powerline-color1)
             (powerline-make-text   "  "    nil)))))

(provide 'powerline-settings)