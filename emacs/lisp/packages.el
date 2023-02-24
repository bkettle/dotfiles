;; inspired by https://github.com/anishathalye/dotfiles/blob/master/emacs.d/lisp/personal/packages.el
(add-to-list 'load-path "~/.config/emacs/pkg/use-package")
(require 'use-package)

;; this needs to be loaded before evil
(use-package goto-chg
  :load-path "pkg/goto-chg")

(use-package evil
  :load-path "pkg/evil"
	:config
	(evil-mode 1)
	(evil-set-leader 'normal (kbd "\\"))
	(evil-define-key 'normal 'global
			(kbd "<leader>m") 'menu-bar-open
			(kbd "<leader>n") 'neotree-toggle
			(kbd "<leader>f") 'neotree-find)
	(evil-define-key 'normal racket-mode-map
			(kbd "<leader>r") 'racket-run
			(kbd "<leader>t") 'racket-test
			(kbd "<leader>k") 'racket-repl-clear-leaving-last-prompt)
		(evil-define-key 'normal racket-repl-mode-map
			(kbd "<leader>k") 'racket-repl-clear-leaving-last-prompt))

;; this needs to be loaded before racket-mode
(use-package pos-tip
  :load-path "pkg/pos-tip")

(use-package racket-mode
  :load-path "pkg/racket-mode")

(use-package neotree
  :load-path "pkg/emacs-neotree"
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  )

(use-package projectile
  :load-path "pkg/projectile"
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package company
  :load-path "pkg/company-mode"

  :config
  (global-company-mode))

(use-package proof-site
	:load-path "pkg/PG/generic"

	:config
	(add-hook 'coq-mode-hook #'company-coq-mode)
	(setq coq-prog-name "~/.opam/default/bin/coqtop")
	(setq coq-compiler "~/.opam/default/bin/coqc")
	(setq coq-dependency-analyzer "~/.opam/default/bin/coqdep"))

(use-package math-symbol-lists
  :load-path "pkg/math-symbol-lists")

;; this needs to be loaded after company and math-symbol-lists
(use-package company-math
  :load-path "pkg/company-math")

(use-package yasnippet
  :load-path "pkg/yasnippet")

(use-package dash
  :load-path "pkg/dash.el")

;; must be loaded after company-math
(use-package company-coq
  :load-path "pkg/company-coq")

