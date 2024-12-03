(defun run-tests ()
  (format t "Running Common Lisp Feature Tests...~%")

  ;; Test data types
  (format t "Testing data types...~%")

  (assert (numberp 123) "Test failed: 123 should be a number.")
  (assert (stringp "Hello") "Test failed: \"Hello\" should be a string.")
  (assert (listp '(1 2 3)) "Test failed: (1 2 3) should be a list.")
  (assert (symbolp 'foo) "Test failed: 'foo should be a symbol.")
  (assert (consp '(a . b)) "Test failed: (a . b) should be a cons cell.")

  ;; Test control structures
  (format t "Testing control structures...~%")

  (let ((x 5))
    (assert (= x 5) "Test failed: x should be 5.")
    (assert (null (if nil nil t)) "Test failed: (if nil nil t) should be t.")
    (assert (zerop (mod 10 3)) "Test failed: (mod 10 3) should be 1."))

  ;; Test functions
  (format t "Testing functions...~%")

  (defun add (a b) (+ a b))
  (assert (= (add 2 3) 5) "Test failed: (add 2 3) should be 5.")

  ;; Test macros
  (format t "Testing macros...~%")

  (defmacro square (x)
    `(* ,x ,x))

  (assert (= (eval (square 4)) 16) "Test failed: (square 4) should be 16.")

  ;; Test error handling
  (format t "Testing error handling...~%")

  (handler-bind ((error (lambda (c) (format t "Caught an error: ~A~%" (error-message-string c)))))
    (assert (catch 'test
              (throw 'test nil)
              nil)
            "Test failed: catch should work."))

  ;; Test dynamic variables
  (format t "Testing dynamic variables...~%")

  (defvar *dynamic-var* 10)
  (let ((*dynamic-var* 20))
    (assert (= *dynamic-var* 20) "Test failed: *dynamic-var* should be 20."))

  ;; Test special forms
  (format t "Testing special forms...~%")

  (defun test-special-forms ()
    (let ((x 10))
      (assert (= (progn (setq x 15) x) 15) "Test failed: progn should return last form value.")))

  (test-special-forms)

  ;; Test built-in functions
  (format t "Testing built-in functions...~%")

  (assert (equal (length '(1 2 3)) 3) "Test failed: (length '(1 2 3)) should be 3.")
  (assert (equal (reverse '(1 2 3)) '(3 2 1)) "Test failed: (reverse '(1 2 3)) should be '(3 2 1)'.")
  (assert (equal (concatenate 'string "Hello, " "World!") "Hello, World!") "Test failed: (concatenate 'string \"Hello, \" \"World!\") should be \"Hello, World!\".")

  (format t "All tests passed!~%"))

;; Run the tests
(run-tests)
