(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; markdown
(package-install 'markdown-mode)

;; rust
(package-install 'rust-mode)
(package-install 'cargo)

;; helm
(package-install 'helm)
(package-install 'helm-ls-git)

;; erlang
(package-install 'erlang)

;; fish
(package-install 'fish-mode)

;; emacs
(package-install 'use-package)
(package-install 'company)

;; lsp
(package-install 'lsp-mode)
(package-install 'lsp-ui)

;; TOML/YAML
(package-install 'toml-mode)
(package-install 'yaml-mode)

;; SKK
(package-install 'ddskk)
;; (skk-get)
