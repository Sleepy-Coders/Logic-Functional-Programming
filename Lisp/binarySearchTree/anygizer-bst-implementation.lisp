(defun tree (&optional &key key val left right)
  (cons (cons key val) (cons left right)))

(defun insert-into-tree (x tree)
  (if (null tree)
      (tree :key x :val 1)
      (if (null (caar tree))
	  (progn
	    (setf (caar tree) x)
	    (setf (cdar tree) 1)
	    tree)
	  (if (equalp x (caar tree))
	      (progn
		(incf (cdar tree))
		tree)
	      (if (< x (caar tree))
		  (progn
		    (setf (cadr tree) (insert-into-tree x (cadr tree)))
		    tree)
		  (progn
		    (setf (cddr tree) (insert-into-tree x (cddr tree)))
		    tree))))))

(defun tree-from-stream (stream)
  (if (listen stream)
      (insert-into-tree (read stream) (tree-from-stream stream))
      (tree)))

(defun tree-from-file (filename)
  (with-open-file (in filename)
    (tree-from-stream in)))

(defun left-branch (tree)
  (if (null tree)
      nil
      (cadr tree)))

(defun right-branch (tree)
  (if (null tree)
      nil
      (cddr tree)))

(defun tree-key (tree)
  (if (null tree)
      nil
      (caar tree)))

(defun tree-val (tree)
  (if (null tree)
      nil
      (cdar tree)))

(defun inorder-tree-format (tree)
  (if (null tree)
      nil
      (concatenate 'string
	(inorder-tree-format (left-branch tree))
	(format nil "~A:~A~4A" (tree-key tree) (tree-val tree) #\space)
	(inorder-tree-format (right-branch tree))
	)))

(defun side-tree-format (tree &optional (step ""))
  (if (null tree)
      nil
      (concatenate 'string
	(side-tree-format (left-branch tree) (concatenate 'string "   " step))
	(format nil "~A~A:~A~%" step (tree-key tree) (tree-val tree))
	(side-tree-format (right-branch tree) (concatenate 'string "   " step))
	)))