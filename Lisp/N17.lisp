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

(defun write-recursively (lst)
  (if (cdr lst)
      (format nil "~d/~3,1f, ~a" (caar lst) (cdar lst) (write-recursively (cdr lst))) 
      (format nil "~d/~3,1f" (caar lst) (cdar lst) )))

(defun write-iteratively (lst)
  (let ((str (format nil "~d/~3,1f" (caar lst) (cdar lst))))
    (dolist (i (cdr lst))
      (setq str (format nil "~a, ~d/~3,1f" str (car i) (cdr i))))
    str))

;;use:
;;(out-set <list> #'write-iteratively)
;;(out-set <list> #'write-recursively)
(defun out-set (lst how)
  (format nil "A={~a}" (funcall how lst)))
  
