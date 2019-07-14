(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" "4aa183d57d30044180d5be743c9bd5bf1dde686859b1ba607b2eea26fe63f491" default)))
 '(fci-rule-color "#010F1D")
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(highlight-changes-colors (quote ("#EF5350" "#7E57C2")))
 '(highlight-tail-colors
   (quote
    (("#010F1D" . 0)
     ("#B44322" . 20)
     ("#34A18C" . 30)
     ("#3172FC" . 50)
     ("#B49C34" . 60)
     ("#B44322" . 70)
     ("#8C46BC" . 85)
     ("#010F1D" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (function-args helm-gtags ggtags night-owl-theme company-irony irony jedi which-key linum-relative evil-magit magit evil-smartparens smartparens evil-nerd-commenter projectile web-mode ac-html ac-html-bootstrap evil-surround helm evil-leader nov py-autopep8 flycheck auto-complete emms evil xclip)))
 '(pos-tip-background-color "#FFF9DC")
 '(pos-tip-foreground-color "#011627")
 '(python-shell-interpreter "python3")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#C792EA")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#FFEB95")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#F78C6C")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#7FDBCA")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#82AAFF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#011627" "#010F1D" "#DC2E29" "#EF5350" "#D76443" "#F78C6C" "#D8C15E" "#FFEB95" "#5B8FFF" "#82AAFF" "#AB69D7" "#C792EA" "#AFEFE2" "#7FDBCA" "#D6DEEB" "#FFFFFF"))))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

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
  "f" 'find-file
  "t" 'eshell)

(require 'evil)
(evil-mode 1)
 ;; End of evil settings


; (ac-config-default)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

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
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Relative line numbers
(require 'linum-relative)
(linum-relative-global-mode 1)

;; Annoying
(blink-cursor-mode 1)

;; Which key stuff
(require 'which-key)
(which-key-mode)

;; electric-pair
(define-globalized-minor-mode my-global-pair-mode electric-pair-mode
  (lambda () (electric-pair-mode 1)))

(my-global-pair-mode 1)


(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
