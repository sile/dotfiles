;;; editor config
(custom-set-variables
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

;;; font (See "https://myrica.estable.jp/" for Myrica)
(let* ((size 14)
       (asciifont "Myrica M") ; ASCII fonts
       (jpfont "Myrica M") ; Japanese fonts
       (h (* size 10))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0080 . #x024F) fontspec)
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))

;;; windoow
(if window-system (progn
    (set-background-color "Black")
    (set-foreground-color "LightGray")
    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 80)
    ))

;;; common
(setq-default indent-tabs-mode nil)
(keyboard-translate ?\C-h ?\C-?)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(prefer-coding-system 'utf-8)

;;;
;;; for eshell
;;;
(setq-default eshell-history-size 100000)
(setq-default eshell-hist-ignoredups t)

;;;
;;; for rust
;;;
(add-hook 'rust-mode-hook #'rust-enable-format-on-save)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'rust-mode-hook #'racer-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'rust-mode-hook '(lambda ()
                             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)))
(setq company-tooltip-align-annotations t)

(setq racer-rust-src-path (concat (file-name-as-directory (getenv "HOME")) "dev/rust/rust/src/"))
(setq compilation-ask-about-save nil)

;; git-gutter
(package-initialize)
(global-git-gutter-mode t)

;; helm
(helm-mode 1)
(global-set-key (kbd "C-c g") 'helm-ag-project-root)
(setq helm-ag-base-command "rg --vimgrep --no-heading -g !*~")

;; company
(global-company-mode)
(add-to-list 'company-backends '(company-dabbrev-code))
