(require 'parse-csv)
(require 's)

(defun gen-col (row)
  (let* ((begin-idx (- (string-to-number (aref row 3))
		       1))
	 (col-len (string-to-number (aref row 4)))
	 (end-idx (+ begin-idx col-len))
	 (cmd (s-lower-camel-case (concat "set "
					  (aref row 1)))))
    (insert (format "row.%s(line.substring(%d, %d));\n"
		    cmd begin-idx end-idx))))

(defun generate-parser ()
  (interactive)
  (let ((rows (mapcar (lambda (row)
			(apply 'vector row))
		      (parse-csv-string-rows (buffer-string)
					     ?\, ?\" "\n"))))
    (switch-to-buffer-other-window "*codegen*")
    (erase-buffer)
    (mapc 'gen-col rows)
    (other-window 1)))
