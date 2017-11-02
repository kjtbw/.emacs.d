;; *.~ とかのバックアップファイルをbackupsに保存
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups/"))
;; .#* とかのバックアップファイルをbackupsに保存
(setq auto-save-file-name-transforms
	  '((".*" "~/.emacs.d/backups/" t)))
;; *.~ とかのバックアップファイルを作らない
;; (setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
;; (setq auto-save-default nil)

;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))


;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; 保存前に行末の空白削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)



;; for Org-mode
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/org-mode/lisp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/org-mode/contlib/lisp") t)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/Dropbox/org/TODO.org" "Inbox")
         "*** TODO %?\n    CAPTURED_AT: %a\n    %i")
		("o" "OrgMemo" entry (file+headline "~/Dropbox/org/techmemo.org" "Org-Mode")
		 "**  %?\n")
		("e" "EmacsMemo" entry (file+headline "~/Dropbox/org/techmemo.org" "Emacs")
		 "**  %?\n")
		("m" "OtherMemo" entry (file+headline "~/Dropbox/org/memo.org" "Other")
		 "**  %?\n")))
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-custom-commands
      '(("o" . "Original agenda view") ; description for "o" prefix
        ("ot" todo "TODO")
        ))
(global-set-key "\C-cb" 'org-iswitchb)
(transient-mark-mode 1)

;; for TODOList
(setq org-agenda-files (list "~/Dropbox/org"))

;; for markdownmode
(setq markdown-command "multimarkdown")
