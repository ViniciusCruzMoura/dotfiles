(package-initialize)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'smex)
  (package-install 'smex))

(global-set-key (kbd "M-x") 'smex)

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-show-dot-for-dired t)
(set-frame-font "Ubuntu Mono 18" nil t)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(setq tramp-auto-save-directory "/tmp")
(setq make-backup-files nil)

(setq display-line-numbers-type 'relative) 
(global-display-line-numbers-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-set-style "k&r")
(setq c-basic-offset 4)

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (smex))))
(custom-set-faces
 )
