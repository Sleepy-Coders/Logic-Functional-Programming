(defun load-recursively (in)
  (if (listen in)
      (cons (cons (read in nil) (read in nil)) (load-iteratively in)) 
      nil))

(defun load-iteratively (in)
  (let ((vect `()))
    (loop while (listen in) do
	 (setq vect (append vect (list (cons (read in) (read in))))))
    vect))

;;use:
;;(data "filename" #'load-iteratively)
;;(data "filename" #'load-recursively)
(defun data (what how)
  (with-open-file (in what)
    (funcall how in)))

