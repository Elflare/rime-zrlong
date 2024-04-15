-- exp_instant_select_processor: 字詞模式立即選擇
-- ⚠️ 僅供實驗。<del>須與 exp_instant_select_filter 聯用。</del>
-- 若當前輸入已達 4 碼，在新的按鍵事件發生時：
-- 1. 只有唯一候選：立即上屏
-- 2. 有多個候選，後續一個按鍵視作輔助碼
--    若可唯一確定候選，則立即上屏；
--    若仍有重碼，直接選中第一個匹配的候選 <del>則該字母進入輸入區</del>
--    若不能選中任何候選，則頂上首選。
-- 若當前輸入已達 5 碼，在新的按鍵事件發生時，直接頂上首選。
local Top = {}

function Top.init(env)
    Top.load_aux_file(env)
end

local kReject = 0
local kAccepted = 1
local kNoop = 2

function Top.func(key_event, env)
    local context = env.engine.context
    local input = context.input
    local input_len = utf8.len(context.input)

    -- 沒有候選時什麼都不做
    if not context:has_menu() then
        return kNoop
    end

    -- 只處理字母按鍵
    if key_event.keycode < 97 or key_event.keycode > 122 or key_event:release() then
        return kNoop
    end

    -- 只處理輸入長度爲 4 或 5 的情況
    if input_len ~= 4 and input_len ~= 5 then
        return kNoop
    end

    local aux_key = string.char(key_event.keycode)
    return Top.HandleAuxKey(env, aux_key, input_len == 5)
end

-- 依據「立即上屏」邏輯處理輔助碼按鍵。
-- @param env:
-- @param key (string): 當前
-- @param full (bool): 是否已經達到最大碼長；若已達最大碼長，則立即上屏當前首選，清空輸入，再把按鍵加入輸入。
-- @return kNoop (添加到輸入), kAccepted (吞掉按鍵)
function Top.HandleAuxKey(env, auxchar, full)
    local context = env.engine.context
    local composition = env.engine.context.composition

    if composition:empty() then
        return kNoop
    end

    local segment = composition:back()
    local menu = segment.menu

    if menu:candidate_count() == 1 then
        context:select(0)
        context:commit()
        return kNoop
    end

    -- 遍歷所有選項，判定是否匹配末字
    local matched = {} -- 匹配 auxchar 的*詞語*

    -- log.error(tostring(menu:candidate_count()) .. "candidates:")
    for i = 2, menu:candidate_count() do
        local c = menu:get_candidate_at(i - 1)
        -- log.error("Looking at " .. c.text)
        if utf8.len(c.text) <= 1 then
            goto continue
        end
        local last_char = utf8.char(utf8.codepoint(c.text, utf8.offset(c.text, -1)))
        local last_char_aux = env.aux_table[last_char]
        if #last_char_aux > 0 and string.sub(last_char_aux[1], 1, 1) == auxchar then
            table.insert(matched, i - 1)
        end
        ::continue::
    end

    if #matched == 0 then
        -- 無匹配候選
        context:select(0)
        context:commit()
        context:clear()
        return kNoop
    elseif #matched == 1 then
        -- 存在唯一候選
        context:select(matched[1])
        context:commit()
        return kAccepted
    else
        -- 存在多個候選
        if not full then
            -- return kNoop
            -- 暫時屏蔽 5 碼情形，直接選中首選。
            context:select(matched[1])
            context:commit()
            return kAccepted
        else
            context:select(0)
            context:commit()
            return kNoop
        end
    end
end

function Top.fini(env)
end

function Top.load_aux_file(env)
    env.aux_table = {}
    local path = rime_api.get_user_data_dir() .. "/fuzhuma.yaml"
    local file = io.open(path, 'r')
    for line in file:lines() do
       key, value = line:match("^(" .. utf8.charpattern .. ")\t[a-z][a-z]([a-z])[a-z]?(.*)$")
       if key and value  then
          if env.aux_table[key] == nil then
             env.aux_table[key] = { value }
          end
       end
    end
    file:close()
end
return Top
