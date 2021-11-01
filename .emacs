(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(eval-when-compile
   (require 'use-package))
(setq use-package-always-ensure t)

;;; editor config
(custom-set-variables
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

;;; common
(setq-default indent-tabs-mode nil)
(keyboard-translate ?\C-h ?\C-?)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(prefer-coding-system 'utf-8)

;;;
;;; for rust
;;;
(add-hook 'rust-mode-hook #'rust-enable-format-on-save)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(use-package lsp-mode
             :ensure t
             :hook (rust-mode . lsp)
             :bind ("C-c h" . lsp-describe-thing-at-point)
             :custom (lsp-rust-server 'rust-analyzer))

(use-package lsp-ui
  :ensure t)

(add-hook 'rust-mode-hook '(lambda ()
                             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))
(setq company-tooltip-align-annotations t)

(setq compilation-ask-about-save nil)
(setq cargo-process--command-bench "+nightly bench")
(setq cargo-process--command-clippy "clippy --all-features")
(setq cargo-process--command-test "test --all-features")
(setq cargo-process--command-doc "doc --all-features")

;; git-gutter
(global-git-gutter-mode t)

;; helm
(helm-mode 1)
(global-set-key (kbd "C-c g") 'helm-ag-project-root)
(setq helm-ag-base-command "rg --vimgrep --no-heading -g !*~")

;; company
(global-company-mode)

;; erlang
(add-hook 'erlang-mode-hook #'lsp)

;; lsp
;; see: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-headerline-breadcrumb-enable nil)
