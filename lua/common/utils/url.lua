exports = {}

---@param url string | nil
---@return string | nil
exports.urldecode = function(url)
    if url == nil then
        return
    end
    url = url:gsub("+", " ")
    url = url:gsub("%%(%x%x)", function(x)
        return string.char(tonumber(x, 16))
    end)
    return url
end

return exports
