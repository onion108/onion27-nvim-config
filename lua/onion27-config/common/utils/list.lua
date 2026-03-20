local M = {}

--- @generic T
--- @param lists T[][]
--- @return T[]
M.synthesize_list = function(lists)
  local result = {}
  for _, list in ipairs(lists) do
    for _, el in ipairs(list) do
      table.insert(result, el)
    end
  end
  return result
end

return M
