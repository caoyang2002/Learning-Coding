(defun 运行测试 ()
  (format t "正在运行 Common Lisp 功能测试...~%")

  ;; 测试数据类型
  (format t "测试数据类型...~%")

  (assert (numberp 123) "测试失败：123 应该是一个数字。")
  (assert (stringp "你好") "测试失败：\"你好\" 应该是一个字符串。")
  (assert (listp '(1 2 3)) "测试失败：(1 2 3) 应该是一个列表。")
  (assert (symbolp 'foo) "测试失败：'foo 应该是一个符号。")
  (assert (consp '(a . b)) "测试失败：(a . b) 应该是一个 cons 单元。")

  ;; 测试控制结构
  (format t "测试控制结构...~%")

  (let ((x 5))
    (assert (= x 5) "测试失败：x 应该是 5。")
    (assert (null (if nil nil t)) "测试失败：(if nil nil t) 应该是 t。")
    (assert (zerop (mod 10 3)) "测试失败：(mod 10 3) 应该是 1。"))

  ;; 测试函数
  (format t "测试函数...~%")

  (defun 加法 (a b) (+ a b))
  (assert (= (加法 2 3) 5) "测试失败：(加法 2 3) 应该是 5。")

  ;; 测试宏
  (format t "测试宏...~%")

  (defmacro 平方 (x)
    `(* ,x ,x))

  (assert (= (eval (平方 4)) 16) "测试失败：(平方 4) 应该是 16。")

  ;; 测试错误处理
  (format t "测试错误处理...~%")

  (handler-bind ((error (lambda (c) (format t "捕获到错误: ~A~%" (error-message-string c)))))
    (assert (catch 'test
              (throw 'test nil)
              nil)
            "测试失败：catch 应该能正常工作。"))

  ;; 测试动态变量
  (format t "测试动态变量...~%")

  (defvar *动态变量* 10)
  (let ((*动态变量* 20))
    (assert (= *动态变量* 20) "测试失败：*动态变量* 应该是 20。"))

  ;; 测试特殊形式
  (format t "测试特殊形式...~%")

  (defun 测试特殊形式 ()
    (let ((x 10))
      (assert (= (progn (setq x 15) x) 15) "测试失败：progn 应该返回最后一个表单的值。")))

  (测试特殊形式)

  ;; 测试内置函数
  (format t "测试内置函数...~%")

  (assert (equal (length '(1 2 3)) 3) "测试失败：(length '(1 2 3)) 应该是 3。")
  (assert (equal (reverse '(1 2 3)) '(3 2 1)) "测试失败：(reverse '(1 2 3)) 应该是 '(3 2 1)'。")
  (assert (equal (concatenate 'string "你好，" "世界！") "你好，世界！") "测试失败：(concatenate 'string \"你好，\" \"世界！\") 应该是 \"你好，世界！\"。")

  (format t "所有测试通过！~%"))

;; 运行测试
(运行测试)
