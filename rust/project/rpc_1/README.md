RPC

默认为 8080，如果被占用就 port+1

测试
```bash
echo '{"x": 5, "y": 10}' | curl -X POST -d @- http://localhost:8080
```
