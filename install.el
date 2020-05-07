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
(package-install 'toml-mode)
(package-install 'racer)
(package-install 'company-racer)

;; helm
(package-install 'helm)
(package-install 'helm-git-grep)
(package-install 'helm-ls-git)
(package-install 'helm-ag)

;; erlang
(package-install 'erlang)

;; fish
(package-install 'fish-mode)

;; python
(package-install 'python-black)
(package-install 'jedi-core)
(package-install 'company-jedi)
(package-install 'pytest)
(jedi:install-server)

;; others
(package-install 'google-translate)
