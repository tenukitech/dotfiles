;; Basic setup
(setq user-full-name "Patrick Narkinsky")
(setq user-mail-address "patrick@narkinsky.com")

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(transient-mark-mode -1)
(menu-bar-mode -1)
(delete-selection-mode t)
(transient-mark-mode t)

(setq x-select-enable-clipboard t)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 2
      indent-tabs-mode nil)

(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq column-number-mode t)

;;(set-face-attribute 'default nil :font "Consolas 10")
;;(require 'autopair)

;;(require 'auto-complete-config)
;;(ac-config-default)

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\|\·*\n" "\W*|\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (visual-line-mode t)))
(setq markdown-command "pandoc --smart -f markdown -t html")


;; Setup revive to manage window placement
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)


;; ;; Setup package manager.
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))                       
(package-initialize)

;; Setup tramp
(require 'tramp)
(setq tramp-default-method "plinkx")
(setq tramp-debug-buffer t) 

(cd "~")

(defun rh6 ()
  (interactive)
  (dired "/rh6:/usr/local/src")
  )

(defun ups ()
  (interactive)
  (kill-some-buffers)
)

;; Code to deal with DOS line-endings and drive a stake through their hearts
(defun dos-file-endings-p ()
     (string-match "dos" (symbol-name buffer-file-coding-system)))
(defun find-file-check-line-endings ()
  (when (dos-file-endings-p)
    (set-buffer-file-coding-system 'undecided-unix)
    (set-buffer-modified-p nil)))
(add-hook 'find-file-hook 'find-file-check-line-endings)





;; Next code work with Emacs 21.4, 22.3, 23.1.
(when window-system
  (let (
        (px (display-pixel-width))
        (py (display-pixel-height))
        (fx (frame-char-width))
        (fy (frame-char-height))
        tx ty
        )
    ;; Next formulas discovered empiric on Windows host with default font.
    (setq tx (- (/ px fx) 7))
    (setq ty (- (/ py fy) 4))
    (setq initial-frame-alist '((top . 2) (left . 2)))
    (add-to-list 'initial-frame-alist (cons 'width tx))
    (add-to-list 'initial-frame-alist (cons 'height ty))
    ) )

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))


;; Workspace functions
(defun ups ()
  (interactive)
  ;;(kill-some-buffers)
  (resume) ;; restore 4-pane configuration
  (dired "/rh6:/usr/local/src")
  (set-window-dedicated-p (selected-window) 1)
  (next-multiframe-window)
  (cd "/rh6:/usr/local/src/lib/python")
  (find-file "ups/main.py")
  (next-multiframe-window)
  (find-file "ups/main.py")
  (next-multiframe-window)
  (python-shell-switch-to-shell)
  (set-window-dedicated-p (selected-window) 1)
  )
