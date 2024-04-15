-- Name: label_to_comment.lua
-- 名称: 声笔标签转注释过滤器
-- Version: 20230328
-- Author: Daniel Dai 戴石麟
-- 适用于声笔飞码、声笔飞讯、声笔简码、声笔双拼
-- 参照飞讯配方加个开关和滤镜即可

local function label_to_comment(input, env)
  local enabled = env.engine.context:get_option("label_to_comment")
  local labels = { [0] = " ", "a", "e", "u", "i", "o" }
  local i = 0
  for cand in input:iter() do
    if enabled and string.len(cand.preedit) >= 4 then
      cand:get_genuine().comment = labels[i % 6] .. cand.comment
	end
    i = i + 1
    yield(cand)
  end
end

return label_to_comment