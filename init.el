(defun add-to-load-path-recompile (dir)
  (add-to-list 'load-path dir)
  (let (save-abbrevs) (byte-recompile-directory dir)))
;; load-path を追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
	(dolist (path paths paths)
	  (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

;; load-pathの追加とロード，init.elの初めに書くこと
(add-to-load-path "elisp" "conf" "elpa" "plugins")
;; filenameには拡張子はいらない
;; ファイルが増えてきたら，init-loaderを使う
(load "base")
(load "view")
(load "language")
(load "require")
(load "keybind")

;; for ini-loader
;; (init-loader-load "~/.emacs.d/conf/")

;; 初期化
;; (package-initialize)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)
(require 'cask)
(cask-initialize)
;; helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(require 'helm-config)
(helm-mode 1)
;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; mhc
(setq load-path
      (cons "~/src/mhc/emacs" load-path))
(autoload 'mhc "mhc" "Message Harmonized Calendar system." t)
;; smooth-scroll
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

;; anzu
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)
