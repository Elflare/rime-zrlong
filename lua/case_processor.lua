-- 首字母大写时，按 Enter 变成首字母小写，上屏
-- 首字母大写时，按 space 首字母还是dixc，上屏
-- 大于等于5码时，按 space 上屏
local enter = 0xff0d
local space = 32
local function is_upper(ch)
    -- ch >= 'A' and ch <= 'Z'
    return ch >= 0x41 and ch <= 0x5a
end
local function func(key_event, env)
    local context = env.engine.context
    local input = context.input
    if input == nil or input == '' then
        return 2
    end
    local schema = env.engine.schema
    if is_upper(input:byte(1)) then
        if key_event.keycode == enter then
            env.engine:commit_text(input:sub(1, 1):lower() .. input:sub(2))
        elseif key_event.keycode == space then
            env.engine:commit_text(input)
        else
            return 2
        end
        context:clear()
        return 1
    elseif string.len(input) > 4 then
        schema.select_keys = "123456"
    else
        schema.select_keys = " 12345"
        return 2
    end
end
return func
