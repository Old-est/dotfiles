(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-log-types '((elpaca core stale 30.2.50))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (defun lsp-booster--advice-json-parse (old-fn &rest args)
;;   "Try to parse bytecode instead of json."
;;   (or
;;    (when (equal (following-char) ?#)
;;      (let ((bytecode (read (current-buffer))))
;;        (when (byte-code-function-p bytecode)
;;          (funcall bytecode))))
;;    (apply old-fn args)))
;; (advice-add (if (progn (require 'json)
;;                        (fboundp 'json-parse-buffer))
;;                 'json-parse-buffer
;;               'json-read)
;;             :around
;;             #'lsp-booster--advice-json-parse)
;;
;; (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
;;   "Prepend emacs-lsp-booster command to lsp CMD."
;;   (let ((orig-result (funcall old-fn cmd test?)))
;;     (if (and (not test?)                             ;; for check lsp-server-present?
;;              (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
;;              lsp-use-plists
;;              (not (functionp 'json-rpc-connection))  ;; native json-rpc
;;              (executable-find "emacs-lsp-booster"))
;;         (progn
;;           (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
;;             (setcar orig-result command-from-exec-path))
;;           (message "Using emacs-lsp-booster for %s!" orig-result)
;;           (cons "emacs-lsp-booster" orig-result))
;;       orig-result)))
;; (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)
