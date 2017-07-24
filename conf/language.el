
;; from ext
;; C-\\でブロックを折り畳む(C言語のみ)
(add-hook 'c-mode-hook
		  '(lambda()
			 (hs-minor-mode 1)))
(define-key global-map(kbd"C-\\") 'hs-toggle-hidding)
;; タブ幅4
(setq default-tab-width 4)
;; cuamode(矩形編集)
;; 範囲選択中に，C-<enter>で矩形選択モードになる．
(cua-mode t)
;; そのままだとC-xが切り取りになってしまったりするので無効化
(setq cua-enable-cua-keys nil)

;; 言語設定
(set-language-environment 'Japanese)

;; UTF-8を使用
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; Fonts
(let* ((size 14)
       (asciifont "Ricty")
       (jpfont "Ricty")
       (h (* size 10))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
  ;; (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0080 . #x024F) fontspec)
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))

;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
