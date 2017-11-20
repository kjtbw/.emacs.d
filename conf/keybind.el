;; まだpackageなし
;; (define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; 途中
(defun make-itemize (n)
  (interactive "nCount:")
  (insert "\\begin{itemize}\n")
  ;; (while n==0
  ;; 	((insert "\item")
  ;; 	 (n=n+1))
  (insert "\\end{itemize}\n")
  )


;; "C-x C-]"で関数のインデントを揃える
(require 'point-undo)
(defun all-indent ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (region-beginning)(region-end))
  (point-undo))
(global-set-key (kbd  "C-x C-]") 'all-indent)


;; C-x C-c でEmacs終了時に質問する.
;; 正確には，そのウィンドウのEmacsがプロセスを保持している場合にのみ質問する．
(setq confirm-kill-emacs 'y-or-n-p)

;; "C-t"でウインドウがひとつならウインドウを上下に分割する
;; ウインドウが２つ以上ならウインドウを正順に切り替える, 初期値はtranspose-words;;
(defun other-window-or-split-below ()
  (interactive)
  (when (one-window-p)
    (split-window-below))
  (other-window 1))
(define-key global-map (kbd "C-t") 'other-window-or-split-below)

;; "M-t"でウインドウがひとつならウインドウを左右に分割する
;; ウインドウが２つ以上ならウインドウを逆順に切り替える, 初期値はtranspose-words
(defun other-window-or-split-right ()
  (interactive)
  (when (one-window-p)
    (split-window-right))
  (other-window -1))
(define-key global-map (kbd "M-t") 'other-window-or-split-right)

;; "C-0"で現在のウインドウを削除，初期値はdigit-argument
;; "M-0"はdigit argument
(define-key global-map (kbd "C-0") 'delete-window)

;; "C-1"で現在以外のウインドウを削除，初期値はdigit-argument
;; "M-1"はdigit argument
(define-key global-map (kbd "C-1") 'delete-other-windows)

;; "M-k"で行コピー，初期値はkill-sentence
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

(global-set-key (kbd "M-k") 'copy-whole-line)

;; undo, default undo is "Ctrl_x u, default "Ctrl_u" is universal-argument"
;; redo はM-u，init.elに記述
(define-key global-map (kbd "C-u") 'undo)

;; "C_hでバックスペース, カーソル前の一文字を削除，初期値はhelp-command"
;; (define-key key-translation-map [?\C-h] [?\C-?])

;; C-zh to help
;; (global-unset-key "\C-z")
;; (global-set-key "\C-zh" 'help)
;; (global-set-key "\C-z\C-z" 'suspend-emacs)

;; IJKLをwasdみたいに矢印配置
;; 使いにくいのでやめる
;;(define-key global-map (kbd "C-I") 'previous-line)
;;(define-key global-map (kbd "C-J") 'backward-char)
;;(define-key global-map (kbd "C-K") 'next-line)
;;(define-key global-map (kbd "C-L") 'forward-char)
