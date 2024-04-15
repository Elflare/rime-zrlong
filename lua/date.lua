--[[
date_translator: 将 `orq` 翻译为当前日期
--]] local function translator(input, seg)
    if (input == "orq") then
        yield(Candidate("orq", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("orq", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    end
end

return translator
