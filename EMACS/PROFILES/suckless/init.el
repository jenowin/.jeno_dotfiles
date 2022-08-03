;;(org-babel-load-file
;; (expand-file-name
;;  "config.org"
;;  user-emacs-directory))

(defvar jeno-emacs-configuration-generic-file "generic-emacs"
  "Base name of generic configuration file.")

(defvar jeno-emacs-configuration-main-file "jeno-emacs"
  "Base name of the main configuration file.")

;; THIS IS EXPERIMENTAL.  Basically I want to test how we can let users
;; include their own customisations in addition to my own.  Those will
;; be stored in a separate Org file.
(defvar jeno-emacs-configuration-user-file "user-emacs"
  "Base name of user-specific configuration file.")


(defun jeno-emacs--expand-file-name (file extension)
  "Return canonical path to FILE to Emacs config with EXTENSION."
  (locate-user-emacs-file
   (concat file extension)))

(defun jeno-emacs-load-config ()
  "Load main Emacs configurations, either '.el' or '.org' file."
  (let* ((generic-init jeno-emacs-configuration-generic-file)
	 (generic-init-el "~/EMACS/PROFILES/generic-config/generic-emacs.el")
	 (generic-init-org "~/EMACS/PROFILES/generic-config/generic-emacs.org")

	 (main-init jeno-emacs-configuration-main-file)
	 (main-init-el (jeno-emacs--expand-file-name main-init ".el"))
	 (main-init-org (jeno-emacs--expand-file-name main-init ".org"))

	 (user-init jeno-emacs-configuration-user-file)
	 (user-init-el (jeno-emacs--expand-file-name user-init ".el"))
	 (user-init-org (jeno-emacs--expand-file-name user-init ".org"))
	 )
    ;;(jeno-emacs-basic-init-setup)
    (require 'org)
    (cond
     ((file-exists-p generic-init-el)
      (load-file generic-init-el))
     ((file-exists-p generic-init-org)
      (org-babel-load-file generic-init-org)))

    (cond
     ((file-exists-p main-init-el)
      (load-file main-init-el))
     ((file-exists-p main-init-org)
      (org-babel-load-file main-init-org)))

    (cond
     ((file-exists-p user-init-el)
      (load-file user-init-el))
     ((file-exists-p user-init-org)
      (org-babel-load-file user-init-org)))
    ))

;; Load configurations.
(jeno-emacs-load-config)

;; The following as for when we close the Emacs session.
(declare-function org-babel-tangle-file "ob-tangle")

(defun jeno-emacs-build-config ()
  "Produce Elisp init from my Org dotemacs.
Add this to `kill-emacs-hook', to use the newest file in the next
session.  The idea is to reduce startup time, though just by
rolling it over to the end of a session rather than the beginning
of it."
  (interactive)
  (let* ((generic-init jeno-emacs-configuration-generic-file)
	 (generic-init-el "~/EMACS/PROFILES/generic-config/generic-emacs.el")
	 (generic-init-org "~/EMACS/PROFILES/generic-config/generic-emacs.org")

	 (main-init jeno-emacs-configuration-main-file)
	 (main-init-el (jeno-emacs--expand-file-name main-init ".el"))
	 (main-init-org (jeno-emacs--expand-file-name main-init ".org"))

	 (user-init jeno-emacs-configuration-user-file)
	 (user-init-el (jeno-emacs--expand-file-name user-init ".el"))
	 (user-init-org (jeno-emacs--expand-file-name user-init ".org"))
	 )

    (when (file-exists-p generic-init-el)
      (delete-file generic-init-el))
    (when (file-exists-p main-init-el)
      (delete-file main-init-el))
    (when (file-exists-p user-init-el)
      (delete-file user-init-el))

    (require 'org)
    (when (file-exists-p generic-init-org)
      (org-babel-tangle-file generic-init-org generic-init-el))

    (when (file-exists-p main-init-org)
      (org-babel-tangle-file main-init-org main-init-el))

    (when (file-exists-p user-init-org)
      (org-babel-tangle-file user-init-org user-init-el))
    ))

(add-hook 'kill-emacs-hook #'jeno-emacs-build-config)
