#|
11. Запропонуйте зображення одновимірних масивів чисел за допомогою списків.
Оголосіть функцію (рекурсивну та ітеративну), що:
a.завантажує вектор з текстового файла; (+)
b.знаходить довжину найдовшої впорядкованої за зростанням (спаданням) частини масиву; (+-)
c.обчислює середньоквадратичну норму вектора. (+)
|#

(defun read-vector-r (in)
  (if (listen in)
      (cons (read in nil) (read-vector-r in)) 
      nil))

(defun load-vector-r (filename) 
  (with-open-file (in filename)
    (read-vector-r in)))

(defun load-vector-i (filename)
  (with-open-file (in filename)
    (let ((vect `()))
      (loop while (listen in) do
	   (setq vect (append vect (list (read in)))))
;	   (push (read in) vect))
;      (reverse vect)
      vect)))

(defun sqr-summ-r (vector)
  (if (eq vector nil) nil
      (if (eq (list-length vector) 1) (expt (car vector) 2)
	  (+ (expt (car vector) 2) (sqr-summ-r (cdr vector))))))

(defun euclidean-norm-r (vector)
  (sqrt (sqr-summ-r vector)))

(defun euclidean-norm-i (vector)
  (let ((summ 0))
    (dolist (el vector) (setq summ (+ summ (expt el 2))))
    (sqrt summ)))

(defun ascendings-length-i (vector &optional (i 0))
  (let ((l (list-length vector)))
    (if (<= (- l i) 0) 0
	(if (= (- l i) 1) 1
	    (let ((k 1))
	      (setq l (- l 1))
	      (loop while (and (< i l)
			       (< (nth i vector) (nth (+ i 1) vector))) do
		   (setq i (+ i 1) k (+ k 1)))
	      k)))))

(defun longest-ascendings-length-i (vector)
  (let ((l (list-length vector)) (i 0) (k 0) tmp)
    (loop while (< i l) do
	 (setq tmp (ascendings-length-i vector i) i (+ i tmp))
	 (if (< k tmp) (setq k tmp)))
    k))

(defun lieq (list1 list2)
  (if (or (eq list1 nil) (eq list2 nil))
      t
      (when (eq (car list1) (car list2))
      (lieq (cdr list1) (cdr list2)))))

(defun test-all ()
  (and 
   "Tests whether recursive and iterative loaders load the same data."
   (lieq (load-vector-r "N11.TestData.txt") (load-vector-i "N11.TestData.txt"))
   "Tests whether euclidean norm of recursive and iterative data loading is the same."
   (= (euclidean-norm-r (load-vector-r "N11.TestData.txt"))
;       (euclidean-norm-r (load-vector-i "N11.TestData.txt"))
      (euclidean-norm-i (load-vector-i "N11.TestData.txt")))
   "Tests whether search result of longest ascending sequence search is correct."
   (= (longest-ascendings-length-i `(1 2 3 1 2 3 4 1 2 3)) 4)
  )
)