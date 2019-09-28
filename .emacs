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
(add-hook 'rust-mode-hook #'racer-mode)

(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'racer-mode-hook
          (lambda ()
            (setq-local eldoc-documentation-function #'ignore)))

(add-hook 'rust-mode-hook '(lambda ()
                             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))
(setq company-tooltip-align-annotations t)

(setq racer-rust-src-path
      (concat (file-name-as-directory (getenv "HOME"))
              ".multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"))
(setq compilation-ask-about-save nil)
(setq cargo-process--command-bench "+nightly bench")
(setq cargo-process--command-clippy "clippy --all-features")
(setq cargo-process--command-test "test --all-features")
(setq cargo-process--command-doc "doc --all-features")

;; git-gutter
(package-initialize)
(global-git-gutter-mode t)

;; helm
(helm-mode 1)
(global-set-key (kbd "C-c g") 'helm-ag-project-root)
(setq helm-ag-base-command "rg --vimgrep --no-heading -g !*~")

;; company
(global-company-mode)

;; google-translate
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ja") ("ja" . "en")))

;; python
(require 'python)
(defun python-shell-parse-command () "python3 -i")

(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(setq jedi:environment-virtualenv
      (append python-environment-virtualenv
              '("--python" "/usr/bin/python3")))
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
