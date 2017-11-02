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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(package-selected-packages
   (quote
	(yasnippet web-mode volatile-highlights use-package smooth-scroll smex smartparens rainbow-delimiters projectile prodigy popwin point-undo pallet nyan-mode multiple-cursors mhc magit init-loader idle-highlight-mode htmlize helm flycheck-cask expand-region exec-path-from-shell drag-stuff auto-install auto-complete anzu))))

;; volatile-highlights
(require 'volatile-highlights)
(volatile-highlights-mode t)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める
;; transient-mark-modeが nilでは動作しませんので注意
(transient-mark-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
