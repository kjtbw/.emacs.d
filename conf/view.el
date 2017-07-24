;; display filename on title var
;; => "%b - emacs-EMCAS-VERSION@HOST-PC"
;; %b : バッファ名を表示する
;; invocation-name : 起動したEmacsのプログラム名
;; emacs-version : emacsのバージョン名
;; system-name : マシン名(ホスト名)
(setq icon-title-format (format "%%b - %s-%s@%s" invocation-name emacs-version system-name))


;; ====================================
;; フレーム位置設定(ウィンドウ）
;; ====================================
( setq initial-frame-alist
       (append
        '(;; (top . 22)    ; フレームの Y 位置(ピクセル数)
		  ;; (left . 45)    ; フレームの X 位置(ピクセル数)
		  (width . 82)    ; フレーム幅(文字数)
		  (height . 41)   ; フレーム高(文字数)
		  ) initial-frame-alist))
;; スクリーンの最大化
;; (set-frame-parameter nil 'fullscreen 'maximized)


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

;; テーマの読み込み
;; (load-theme 'adwaita t)

;; マウス・スクロールを滑らかにする
;; (setq mac-mouse-wheel-smooth-scroll t)

;; 現在行ハイライト
(global-hl-line-mode t)

;; 行末空白のハイライト
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "cyan")

;; 対応括弧ハイライト
(show-paren-mode t)
