(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; git
(package-install 'magit)
(package-install 'git-gutter)

;; markdown
(package-install 'markdown-mode)

;; rust
(package-install 'rust-mode)
(package-install 'cargo)

;; helm
(package-install 'helm)
(package-install 'helm-git-grep)
(package-install 'helm-ls-git)
(package-install 'helm-ag)

;; erlang
(package-install 'erlang)

;; fish
(package-install 'fish-mode)

;; emacs
(package-install 'use-package)

;; lsp
(package-install 'lsp-mode)
(package-install 'lsp-ui)
(package-install 'lsp-treemacs)

;; TOML/YAML
(package-install 'toml-mode)
(package-install 'yaml-mode)
