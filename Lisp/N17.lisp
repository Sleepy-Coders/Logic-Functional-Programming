;START; Data loading
(defun r-load (in)
  (if (listen in)
      (cons (cons (read in nil) (read in nil)) (r-load in)) 
      nil))

(defun i-load (in)
  (let ((vect `()))
    (loop while (listen in) do
	 (setq vect (append vect (list (cons (read in) (read in))))))
    vect))

;;use:
;(list-from-file "filename")
;(list-from-file "filename" #'r-load)
;(list-from-file "filename" #'i-load)
(defun list-from-file (what &optional (how #'r-load))
  (with-open-file (in what)
    (funcall how in)))
;END; Data loading

;START Data output
(defun r-write (lst)
  (if (cdr lst)
      (format nil "~d/~3,1f, ~a" (caar lst) (cdar lst) (r-write (cdr lst))) 
      (format nil "~d/~3,1f" (caar lst) (cdar lst) )))

(defun i-write (lst)
  (let ((str (format nil "~d/~3,1f" (caar lst) (cdar lst))))
    (dolist (i (cdr lst))
      (setq str (format nil "~a, ~d/~3,1f" str (car i) (cdr i))))
    str))

;;use:
;(write-list <list>)
;(write-list <list> #'r-write)
;(write-list <list> #'i-write)
(defun write-list (lst &optional (how #'r-write))
  (format nil "{~a}" (funcall how lst)))
;END; Data output

(defun contains (lst item)
  (if lst
      (or (= (caar lst) item) (contains (cdr lst) item))
      nil))

(defun probability (lst item)
  (if lst
      (if (= (caar lst) item)
	  (cdar lst)
	  (probability (cdr lst) item))
      nil))

#|(defun probability-i (lst item)
  (if lst
      (let ((i 0))
	(loop while (and (< i (list-length lst)) (eq item (car (nth i lst))))
			 do (setq i (+ i 1)))
	(cdr (nth i lst))|#

#|(defun probability-i (lst item)
  (if lst
      (dolist (i lst)
	(if (= item )|#

(defun dintersection (lst1 lst2)
  (cond
    ((eq lst1 nil) nil)
    ((probability lst2 (caar lst1)) (cons
				     (cons
				      (caar lst1)
				      (-
				       (+
					(cdar lst1)
					(probability lst2 (caar lst1)))
				       (*
					(cdar lst1)
					(probability lst2 (caar lst1)))))
				     (dintersection (cdr lst1) lst2)))
    (t (dintersection (cdr lst1) lst2))))

