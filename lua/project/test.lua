-- 多功能测试脚本

-- 函数：打印测试标题
local function printTestTitle(title)
    print("\n-- " .. title .. " --")
end

-- 测试数据类型
local function testDataTypes()
    printTestTitle("数据类型测试")

    -- 测试数字
    local number = 42
    print("数字:", number)

    -- 测试字符串
    local str = "Hello, Lua!"
    print("字符串:", str)

    -- 测试布尔值
    local boolTrue = true
    local boolFalse = false
    print("布尔值 true:", boolTrue)
    print("布尔值 false:", boolFalse)

    -- 测试表
    local tbl = {a = 1, b = 2, c = 3}
    print("表的内容:")
    for k, v in pairs(tbl) do
        print(k, v)
    end

    -- 测试函数
    local function add(a, b)
        return a + b
    end
    print("函数 add(5, 3):", add(5, 3))
end

-- 测试字符串操作
local function testStringOperations()
    printTestTitle("字符串操作测试")

    local str = "Lua is fun!"
    print("原始字符串:", str)

    -- 字符串长度
    print("字符串长度:", #str)

    -- 字符串连接
    local newStr = str .. " Let's test more."
    print("连接后的字符串:", newStr)

    -- 字符串匹配
    local found = string.match(str, "is")
    print("字符串匹配 'is':", found)
end

-- 测试表操作
local function testTableOperations()
    printTestTitle("表操作测试")

    local tbl = {1, 2, 3, 4, 5}

    -- 添加元素
    table.insert(tbl, 6)
    print("添加元素后的表:")
    for i, v in ipairs(tbl) do
        print(i, v)
    end

    -- 删除元素
    table.remove(tbl, 1)
    print("删除元素后的表:")
    for i, v in ipairs(tbl) do
        print(i, v)
    end
end

-- 测试函数
local function testFunctions()
    printTestTitle("函数测试")

    local function greet(name)
        return "Hello, " .. name
    end
    print("函数 greet('World'):", greet("World"))

    -- 匿名函数
    local square = function(x) return x * x end
    print("匿名函数 square(5):", square(5))
end

-- 运行所有测试
local function runTests()
    testDataTypes()
    testStringOperations()
    testTableOperations()
    testFunctions()
end

-- 执行测试
runTests()
