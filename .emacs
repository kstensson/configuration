
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(flycheck-python-flake8-executable "python3")
 '(flycheck-python-pycompile-executable "python3")
 '(package-selected-packages
   (quote
    (linum-relative evil-magit magit evil-smartparens smartparens evil-nerd-commenter projectile web-mode ac-html ac-html-bootstrap evil-surround helm evil-leader nov jedi py-autopep8 flycheck auto-complete emms evil xclip)))
 '(python-shell-interpreter "python3"))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Ivy settings

(require 'ivy)
(ivy-mode 1)

 ;; Evil settings
(global-evil-leader-mode)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "t" 'ansi-term)

(require 'evil)
(evil-mode 1)
 ;; End of evil settings


 ;; Auto complete configurations
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-set-trigger-key "TAB")
 ;; End of Auto complete settings


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

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
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
