;;; editor config
(custom-set-variables
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

;;; window
(if window-system (progn
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

    (set-background-color "Black")
    (set-foreground-color "LightGray")
`    (set-cursor-color "Gray")
    (set-frame-parameter nil 'alpha 80)
    ))

;;; common
(setq-default indent-tabs-mode nil)
(keyboard-translate ?\C-h ?\C-?)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(prefer-coding-system 'utf-8)

;;; misc
(defun win-open (path)
  (w32-shell-execute "open" path))

;;;
;;; for eshell
;;;
(setq-default eshell-history-size 100000)
(setq-default eshell-hist-ignoredups t)

(add-hook
 'eshell-mode-hook
 '(lambda ()
    (require 'em-glob)
    (let ((lib-pathes
           (apply
            'concat
            (mapcar (lambda (p) (concat path-separator p))
                    (eshell-extended-glob
                     (concat (getenv "HOME") "dev/lib/*/bin"))))))
      (setq eshell-path-env (concat eshell-path-env lib-pathes)))
    ))

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

(setq racer-rust-src-path
      (concat (file-name-as-directory (getenv "HOME")) 
              ".multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"))
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

;; quickrun
(setq-default quickrun-timeout-seconds 120)

(global-set-key
 (kbd "C-c C-c C-q")
 '(lambda ()
    (interactive)
    (quickrun :source
              '((:command . "evalrs")
                (:exec . ("cat %s | %c %a"))))))

;; google-translate
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ja") ("ja" . "en")))
