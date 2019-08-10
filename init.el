(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" "4aa183d57d30044180d5be743c9bd5bf1dde686859b1ba607b2eea26fe63f491" default)))
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(package-selected-packages
   (quote
    (systemd helm-make company-ycmd function-args helm-gtags ggtags company-irony irony jedi which-key evil-magit magit evil-smartparens smartparens evil-nerd-commenter projectile web-mode ac-html ac-html-bootstrap evil-surround helm evil-leader nov py-autopep8 flycheck auto-complete emms evil xclip)))
 '(python-shell-interpreter "python3")
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/home/kevin/Documents/c++/stone_note/tui/src/")
     (flycheck-gcc-language-standard . c++11)))))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(defun open-init-file ()
  (interactive)
  (find-file user-init-file))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)


(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)
;; Ivy settings

; (require 'ivy)
; (ivy-mode 1)

 ;; Evil settings
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
  "b s" 'bookmark-set)

(define-key evil-ex-map "b" 'helm-mini)
(define-key evil-ex-map "e" 'helm-find-files)

(require 'evil)
(evil-mode 1)
 ;; End of evil settings


; (ac-config-default)

(require 'semantic)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

(setq company-backends (delete 'company-semantic company-backends))

(add-to-list 'company-backends 'company-c-headers)


 ;; All python settings
(elpy-enable)

 ;; Flycheck for python configuration
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
 ;; End

 ;; Automatic pep 8 styling for python
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook #'(lambda () (setq flycheck-checker 'python-pylint)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
 ;; End of python settings

 
 ;; Epub settings
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
 ;; End of epub settings
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Web mode settings
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
;; End of web mode

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; End of projectile

;; Smartparens
(require 'smartparens-config)
(require 'evil-smartparens)
(add-hook 'elpy-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'smartparens-mode)
;; End of smartparens

;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Remove annoying GUI stuff
;(menu-bar-mode -1)
(tool-bar-mode -1)

;; Annoying
(blink-cursor-mode 1)

;; Which key stuff
(require 'which-key)
(which-key-mode)

;; electric-pair
(define-globalized-minor-mode my-global-pair-mode electric-pair-mode
  (lambda () (electric-pair-mode 1)))

(my-global-pair-mode 1)

(require 'cc-mode)
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(setq
 c-default-style "linux" ;; set style to "linux"
 )
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(global-flycheck-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)
