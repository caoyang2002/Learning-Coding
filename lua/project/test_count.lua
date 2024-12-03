-- Lua 多功能测试脚本

-- 数学运算测试
local function mathTest()
    print("数学运算测试:")
    local a = 10
    local b = 5
    print("a =", a, "b =", b)
    print("a + b =", a + b)
    print("a - b =", a - b)
    print("a * b =", a * b)
    print("a / b =", a / b)
    print("a ^ b =", a ^ b)
    print("sqrt(a) =", math.sqrt(a))
    print("abs(-a) =", math.abs(-a))
    print()
end

-- 字符串处理测试
local function stringTest()
    print("字符串处理测试:")
    local str = "Hello, Lua!"
    print("原始字符串: " .. str)
    print("字符串长度: " .. #str)
    print("大写: " .. string.upper(str))
    print("小写: " .. string.lower(str))
    print("替换 'Lua' 为 'World': " .. string.gsub(str, "Lua", "World"))
    print("找到 'Lua' 的位置: " .. string.find(str, "Lua"))
    print()
end

-- 表操作测试
local function tableTest()
    print("表操作测试:")
    local tbl = {a = 1, b = 2, c = 3}
    print("表的内容:")
    for k, v in pairs(tbl) do
        print(k, v)
    end

    print("向表中添加元素:")
    tbl.d = 4
    tbl.e = 5
    for k, v in pairs(tbl) do
        print(k, v)
    end

    print("删除表中的元素 'b':")
    tbl.b = nil
    for k, v in pairs(tbl) do
        print(k, v)
    end
    print()
end

-- 文件读取测试
local function fileTest()
    local filename = "test.txt"

    -- 写入测试
    local file = io.open(filename, "w")
    if file then
        file:write("Hello, Lua file I/O!\n")
        file:write("This is a test.")
        file:close()
        print("文件已创建并写入内容: " .. filename)
    else
        print("无法创建文件: " .. filename)
    end

    -- 读取测试
    file = io.open(filename, "r")
    if file then
        print("读取文件内容:")
        local content = file:read("*all")
        print(content)
        file:close()
    else
        print("无法读取文件: " .. filename)
    end

    -- 删除测试
    os.remove(filename)
    print("文件已删除: " .. filename)
    print()
end

-- 执行测试
mathTest()
stringTest()
tableTest()
fileTest()
