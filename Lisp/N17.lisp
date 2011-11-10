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
(defun r-write (lst &optional (accuracy 1))
(let ((last (format nil "~~d/~~~d,~df" (+ accuracy 2) accuracy)) (mid (format nil "~~d/~~~d,~df, ~~a" (+ accuracy 2) accuracy)))
  (if (cdr lst)
      (format nil mid (caar lst) (cdar lst) (r-write (cdr lst) accuracy)) 
      (format nil last (caar lst) (cdar lst) ))))

(defun i-write (lst &optional (accuracy 1))
  (let ((str (format nil (format nil "~~d/~~~d,~df" (+ accuracy 2) accuracy) (caar lst) (cdar lst))) (mid (format nil "~~a, ~~d/~~~d,~df" (+ accuracy 2) accuracy)) )
    (dolist (i (cdr lst))
      (setq str (format nil mid str (car i) (cdr i))))
    str))

;;use:
;(write-list <list>)
;(write-list <list> #'r-write)
;(write-list <list> #'i-write)
(defun write-list (lst &optional (how #'r-write))
  (format nil "{~a}" (funcall how lst)))
;END; Data output

(defun r-contains (lst item)
  (if lst
      (or (= (caar lst) item) (contains (cdr lst) item))
      nil))

(defun i-contains (lst item)
  (dolist (i lst)
    (if (eq (car i) item) (return-from i-contains t) nil)))
   
(defun r-probability (lst item)
  (if lst
      (if (eq (caar lst) item)
	  (cdar lst)
	  (probability (cdr lst) item))
      nil))

(defun i-probability (lst item)
  (dolist (i lst)
    (if (eq (car i) item) (return-from i-probability (cdr i)) nil)))


(defun dintersection (lst1 lst2 &key (content #'i-contains) (probability #'r-probability))
  (cond
    ((eq lst1 nil) nil)
    ((funcall content lst2 (caar lst1))
     (cons
      (cons
       (caar lst1)
       (*
	(cdar lst1)
	(funcall probability lst2 (caar lst1))))
       (dintersection (cdr lst1) lst2 :content content :probability probability)))
     (t (dintersection (cdr lst1) lst2 :content content :probability probability))))

(defun dunity (lst1 lst2 &key (content #'i-contains) (probability #'r-probability))
  (let ((result nil))
    (if lst1
	(dolist (i lst1)
	  (if (funcall content lst2 (car i))
	      (setq result
	       (cons 
		(cons
		 (car i)
		 (-
		  (+
		   (cdr i)
		   (funcall probability lst2 (car i)))
		  (*
		   (cdr i)
		   (funcall probability lst2 (car i)))))
		result))
	      (setq result (cons i result)))))
    (if lst2
	(dolist (i lst2)
	  (if (funcall content lst1 (car i))
	      (setq result (cons i result)))))
    result))


#| good idea bad knowladge: list isn't modified
(defun dunity (lst1 lst2 &key (content #'i-contains) (probability #'r-probability))
  (let ((result lst1) (i 0) (length (list-length lst2)))
    (if lst2
	(loop while (< i length) do
	  (if (funcall content result (car (nth i lst2)))
	      (setf (nth i lst2)
		    (cons
		     (car (nth i lst2))
		     (-
		      (+
		       (cdr (nth i lst2))
		       (funcall probability lst2 (car (nth i lst2))))
		      (*
		       (cdr (nth i lst2))
		       (funcall probability lst2 (car (nth i lst2)))))))
	      (setq result (cons (nth i lst2) result) ))
	     (setq i (+ i 1))))
    result))
|#
