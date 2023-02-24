(setf inhibit-startup-screen t) ; disable welcome screen

(show-paren-mode 1) ; highlight matching parens

;; store all backup and autosave files outside the working directory,
;; in the temporary-file-directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-display-line-numbers-mode)
