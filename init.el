;;;;;;;;;;;;;plus content
;display filename on title var
(setq frame-title-format (format "%%b - %s-%s@%s" invocation-name emacs-version system-name))
;=> "%b - emacs-23.3.1@HOST-PC"

;; %b : バッファ名を表示する
;; invocation-name : 起動したEmacsのプログラム名
;; emacs-version : emacsのバージョン名
;; system-name : マシン名(ホスト名)

;====================================
;フレーム位置設定(ウィンドウ）
;====================================
( setq initial-frame-alist
       (append
        '(;(top . 22)    ; フレームの Y 位置(ピクセル数)
		  ;(left . 45)    ; フレームの X 位置(ピクセル数)
		  (width . 82)    ; フレーム幅(文字数)
		  (height . 41)   ; フレーム高(文字数)
		  ) initial-frame-alist))
;; スクリーンの最大化
;(set-frame-parameter nil 'fullscreen 'maximized)

;key bind
;(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;"C-t"でウインドウを切り替える, 初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)
;undo, default undo is "Ctrl_x u, default "Ctrl_u" is none"
(define-key global-map (kbd "C-u") 'undo)

;; *.~ とかのバックアップファイルをbackupsに保存
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups/"))
;; .#* とかのバックアップファイルをbackupsに保存
(setq auto-save-file-name-transforms
	  '((".*" "~/.emacs.d/backups/" t)))
;; *.~ とかのバックアップファイルを作らない
;(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
;(setq auto-save-default nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/plugins/markdown-mode")
        )
       load-path))

;;for Org-mode
										;(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/org-mode/lisp"))
										;(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/org-mode/contlib/lisp") t)
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

;;for TODOList
(setq org-agenda-files (list "~/Dropbox/org"))

;;from ext
;;C-\\でブロックを折り畳む(C言語のみ)
(add-hook 'c-mode-hook
		  '(lambda()
			 (hs-minor-mode 1)))
(define-key global-map(kbd"C-\\") 'hs-toggle-hidding)
;;タブ幅4
(setq default-tab-width 4)
;;cuamode(矩形編集)
;;範囲選択中に，C-<enter>で矩形選択モードになる．
(cua-mode t)
;;そのままだとC-xが切り取りになってしまったりするので無効化
(setq cua-enable-cua-keys nil)

;; 言語設定
(set-language-environment 'Japanese)

;; UTF-8を使用
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; 対応括弧ハイライト
(show-paren-mode t)

;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; カーソル位置の桁数をモードライン行に表示する
(column-number-mode 1)

;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)

;; オープニングメッセージ消去
(setq inhibit-startup-message -1)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを隠す
(tool-bar-mode -1)

;; 行番号表示
(global-linum-mode t)

;;テーマの読み込み
										;(load-theme 'adwaita t)

;; マウス・スクロールを滑らかにする
										;(setq mac-mouse-wheel-smooth-scroll t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; 現在行ハイライト
(global-hl-line-mode t)

;; Fonts
(let* ((size 14)
       (asciifont "Ricty")
       (jpfont "Ricty")
       (h (* size 10))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
										;  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0080 . #x024F) fontspec)
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))

;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 行末空白のハイライト
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "cyan")

;; 保存前に行末の空白削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun all-indent ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (region-beginning)(region-end)))

(global-set-key (kbd  "C-x C-]") 'all-indent)
