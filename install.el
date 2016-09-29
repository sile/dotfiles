(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(package-install 'magit)
(package-install 'rust-mode)
(package-install 'cargo)
(package-install 'toml-mode)
(package-install 'racer)
(package-install 'company-racer)
(package-install 'markdown-mode)
