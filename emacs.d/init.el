;;	fundamental settings
;;
(display-time)
(line-number-mode 1)
(blink-cursor-mode 0)
(tool-bar-mode 0)
(auto-image-file-mode)
(setq kill-whole-line t)
(setq next-line-add-newlines nil)
(put 'eval-expression 'disabled nil)
(setq search-highlight t)
(setq auto-save-list-file-prefix nil)
(global-font-lock-mode t)

;;	coding settings
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

;;	key binding 
(global-set-key [?\C-h] 'delete-backward-char)
(global-unset-key [?\C-z])
(define-key global-map [?\C-z] 'scroll-down)
(global-unset-key [?\M-v])
(define-key global-map [?\M-v] 'scroll-other-window)
(global-unset-key [?\M-z])
(define-key global-map [?\M-z] 'scroll-other-window-down)
(define-key global-map [?\M-n] 'next-error)
(define-key global-map "\C-c\C-g" 'goto-line)

;;	path settings
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp" "conf")
;(add-to-load-path "elisp" "conf" "public_repos")

(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;;	font-settings
(cond
 ((fboundp 'modify-all-frames-parameters)
  (create-fontset-from-fontset-spec
   "-*-fixed-medium-r-*-*-16-*-*-*-c-*-fontset-normal,
latin-iso8859-1:-sony-fixed-medium-r-*-*-16-*-*-*-c-*-iso8859-1,
japanese-jisx0208:-bitstream-sirius-medium-r-normal--16-150-75-75-c-160-jisx0208.1983-0")
  (set-fontset-font
   "fontset-normal" 'japanese-jisx0208
   "-bitstream-sirius-medium-r-normal--16-150-75-75-c-160-jisx0208.1983-0")
  (modify-all-frames-parameters '((font . "fontset-normal")))))
;; -jis-fixed-medium-r-normal--16-*-*-*-*-*-jisx0208.1983-0

;;	elscreen
(require 'elscreen)
(setq elscreen-prefix-key "\C-t")
;(elscreen-set-prefix-key "\C-t")
 
;;	mozc
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "\C-\\") 'toggle-input-method)

;;	c-mode
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-set-style "bsd")))
