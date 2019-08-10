;;; package -- summary
;;; commentary:
;;; all my evil settings

;;; code:
(global-evil-leader-mode)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ; general
  "<SPC>" 'helm-M-x
  "f" 'helm-find-files
  "t" 'eshell
  "m" 'helm-make
  "d" 'open-init-file
  ; Window managment
  "s v" 'split-window-right
  "s h" 'split-window-below
  "s d" 'delete-window
  "s o" 'delete-other-windows
  ; Bookmarks
  "b S" 'bookmark-save
  "b s" 'bookmark-set
  "b j" 'bookmark-jump)

(define-key evil-ex-map "b " 'helm-mini)
(define-key evil-ex-map "e " 'helm-find-files)

(require 'evil)
(evil-mode 1)

(require 'evil-smartparens)

(provide 'module)
;;; module.el ends here
