(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages '(clingo-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun org-babel-execute:clingo (body params)
  "Execute a block of Clingo code with org-babel.
This function is called by `org-babel-execute-src-block'."
  (let ((tmp-src-file (org-babel-temp-file "clingo-"))
        (tmp-out-file (org-babel-temp-file "clingo-out-")))
    (with-temp-file tmp-src-file (insert body))
    (org-babel-eval
     (format "clingo --verbose=0 %s > %s" tmp-src-file tmp-out-file) "")
    (with-temp-buffer
      (insert-file-contents tmp-out-file)
      (buffer-string))))

;;(unless (package-installed-p 'clingo-mode)
;;  (package-refresh-contents)
;;  (package-install 'clingo-mode))

;;(add-to-list 'org-babel-load-languages '(clingo . t))
