(defun 文件操作测试 ()
  (format t "正在进行文件操作测试...~%")

  ;; 测试文件创建和写入
  (format t "测试文件创建和写入...~%")

  (let ((文件名 "test-file.txt")
        (内容 "这是一个测试文件。"))
    (with-open-file (流 文件名 :direction :output :if-exists :overwrite :if-does-not-exist :create)
      (format 流 "~a~%" 内容))

    ;; 确保文件已经被创建并写入
    (assert (probe-file 文件名) "测试失败：文件没有被创建。")
    (format t "文件已创建并写入内容。~%"))

  ;; 测试文件读取
  (format t "测试文件读取...~%")

  (let ((文件名 "test-file.txt"))
    (with-open-file (流 文件名 :direction :input)
      (let ((读取内容 (read-line 流)))
        (assert (string= 读取内容 "这是一个测试文件。") "测试失败：读取的内容与写入的内容不符。")
        (format t "读取内容：~a~%" 读取内容)))

    ;; 确保文件仍然存在
    (assert (probe-file 文件名) "测试失败：文件丢失。"))

  ;; 测试文件删除
  (format t "测试文件删除...~%")

  (let ((文件名 "test-file.txt"))
    (delete-file 文件名)

    ;; 确保文件已经被删除
    (assert (not (probe-file 文件名)) "测试失败：文件没有被删除。")
    (format t "文件已删除。~%"))

  (format t "所有文件操作测试通过！~%"))

;; 运行文件操作测试
(文件操作测试)
