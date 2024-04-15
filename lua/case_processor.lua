-- 首字母大写时，按 Enter 变成首字母小写，上屏
-- 首字母大写时，按 space 首字母还是dixc，上屏
-- 大于等于5码时，按 space 上屏
local enter = 0xff0d
local space = 32
local function is_upper_or_not_number(input)
    -- first_ch >= 'A' and first_ch <= 'Z'
    -- second_ch is not number
    -- this is for the feature that convert Arabic numerals to traditional Chinese numerals.
    local first_ch = input:byte(1)
    if #input > 1 then
        local second_ch = input:byte(2)
        return first_ch >= 65 and first_ch <= 90 and ( second_ch < 48 or second_ch > 57)
    else
        return first_ch >= 65 and first_ch <= 90
    end
end
local function func(key_event, env)
    local context = env.engine.context
    local input = context.input
    if input == nil or input == '' then
        return 2
    end
    local schema = env.engine.schema
    if is_upper_or_not_number(input) then
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
