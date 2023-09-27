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
(add-hook 'before-save-hook 'lsp-format-buffer)
(prefer-coding-system 'utf-8)
(setq ring-bell-function 'ignore)

;;;
;;; for rust
;;;
(add-hook 'rust-mode-hook #'rust-enable-format-on-save)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(use-package lsp-mode
             :ensure t
             :hook (rust-mode . lsp)
             :bind ("C-c h" . lsp-describe-thing-at-point)
             :bind-keymap ("C-c C-l" . lsp-command-map)
             :custom (lsp-rust-server 'rust-analyzer)
                     (lsp-rust-all-features t))

(add-hook 'rust-mode-hook #'(lambda ()
                              (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))
(setq company-tooltip-align-annotations t)

(setq compilation-ask-about-save nil)
(setq cargo-process--command-bench "build --release --target wasm32-unknown-unknown")
(setq cargo-process--command-clippy "clippy --all-features")
(setq cargo-process--command-test "test --all-features")
(setq cargo-process--command-doc "doc --all-features")

;; git-gutter
(global-git-gutter-mode t)

;; helm
(global-set-key (kbd "C-c g") 'helm-ag-project-root)
(setq helm-ag-base-command "rg --vimgrep --no-heading -g !*~")

;; company
(global-company-mode)

;; erlang
(add-hook 'erlang-mode-hook #'lsp)

;; lsp
;; see: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
(setq lsp-headerline-breadcrumb-enable nil)

(use-package lsp-ui
  :ensure t)

;; flaymake
(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)
(use-package lsp-treemacs
  :ensure t)

;; icomplete
(icomplete-vertical-mode)

;; flymake
(global-set-key (kbd "M-p") 'flymake-goto-next-error)
(global-set-key (kbd "M-n") 'flymake-goto-next-error)
