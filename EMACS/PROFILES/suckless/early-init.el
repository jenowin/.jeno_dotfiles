(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Initialise installed packages
(setq package-enable-at-startup t)

(defvar package-quickstart)

;; Allow loading from the package cache
(setq package-quickstart t)
