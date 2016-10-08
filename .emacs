;;; editor config
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

(set-default-font "7x13bold")

(setq-default indent-tabs-mode nil)

(keyboard-translate ?\C-h ?\C-?)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;
;;; for lisp
;;;
(setq inferior-lisp-program "sbcl --noinform --dynamic-space-size 2048")
(setq initial-major-mode 'lisp-mode)

(defun split-and-run ()
  (interactive)
  (let ((sel-w (selected-window))
  (new-w (split-window)))
    (select-window new-w)
    (run-lisp inferior-lisp-program)
    (select-window sel-w)))
(global-set-key "\C-c\C-x" 'split-and-run)

;; tab extension
(defun backtab ()
  (interactive)
  (let ((old (progn (forward-line 0) (point)))
  (end (progn (backward-up-list) (point)))
  (beg (progn (forward-line 0) (point))))
    (goto-char old)
    (let ((ts (thing-at-point 'whitespace)))
      (unless (and (= (length ts) 1)
      	            (char-equal ?\n (aref ts 0)))
		    (delete-char (length ts))))
    (while (< beg end)
      (let ((c (char-after beg)))
(setq helm-ag-base-command "rg --vimgrep --no-heading")      (insert-char (if (char-equal c ?\t) ?\t ?  ) 1))
      (setq beg (+ beg 1)))
    (insert-char ?  2)))
(global-set-key [backtab] 'backtab)

;;;
;;; for erlang
;;;
(require 'em-glob)
(setq load-path (cons (car (eshell-extended-glob "/usr/lib/erlang/lib/tools-*/emacs")) load-path))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-hook 'erlang-mode-hook '(lambda  () (setq compile-command "cd ../ && make")))

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

;;;
;;; misc
;;;
(package-initialize)

;; git-gutter
(global-git-gutter-mode t)

;; helm
(helm-mode 1)

;; heml-ag
(global-set-key (kbd "C-c g") 'helm-ag-project-root)
(setq helm-ag-base-command "rg --vimgrep --no-heading")
