--[[
time_translator: 将 `osj` 翻译为当前时间
--]] local function translator(input, seg)
    if (input == "sj") then
        yield(Candidate("sj", seg.start, seg._end, os.date("%H:%M:%S"), ""))
    end
    if (input == "ors") then
        yield(Candidate("ors", seg.start, seg._end, os.date("%Y年%m月%d日%H:%M:%S"), ""))
    end
    if (input == "orq") then
        yield(Candidate("orq", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("orq", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    end
end

return translator
