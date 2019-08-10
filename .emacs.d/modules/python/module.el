; All python settings
(elpy-enable)

; Flycheck for python configuration
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
; End

; Automatic pep 8 styling for python
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook #'(lambda () (setq flycheck-checker 'python-pylint)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
