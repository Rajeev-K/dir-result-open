;;; dir-result-open.el --- open file whose name is under point, where buffer contains output of Windows dir command

;; Copyright (C) 2019 rajeev-k

;; Author: rajeev-k
;; Maintainer:
;; Created: 6/1/2019
;; Keywords: convenience

;; This code is free; you can redistribute it and/or modify it under the
;; terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.

;;; Commentary:
;; Redirect output of Windows dir command to a file, open the file, then put cursor on a file name then run this command.
;;
;; Add these lines to your .emacs
;; (require 'dir-result-open)
;; (global-set-key [f12] 'dir-result-open)

(defun dir-result-open ()
  "Open file corresponding to dir result at point."
  (interactive)
  (let (file-path)
    (save-excursion
      ;; get file name from current line
      (let ((file-name (buffer-substring
                       (progn (beginning-of-line) (point))
                       (progn (end-of-line) (point)))))
        ;; get file name as last word on line
        (if (string-match ".* \\([^ ]+\\)$" file-name)
            (setq file-name (replace-match "\\1" t nil file-name))
          (error "No file name found on current line"))
        ;; search for directory path
        (if (re-search-backward "^ Directory of \\(.*\\)" nil t)
            (let* ((dir (match-string 1))
                   (full-name (concat dir "\\" file-name)))
              (if (file-readable-p full-name)
                  (setq file-path full-name)
                (error "File not found")))
          (error "Directory header not found"))))
    (if file-path
        (progn (find-file file-path)
               (message "Opened %s" file-path)))))

(provide 'dir-result-open)
