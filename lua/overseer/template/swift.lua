---@type overseer.TemplateFileProvider
return {
  generator = function(opts)
    if vim.fn.executable("swift") == 0 then
      return 'Command "swift" not found'
    end
    local candidates = vim.fs.find(function(name, path)
      return name == "Package.swift"
    end, { upward = true, path = opts.dir, limit = math.huge })
    if vim.tbl_isempty(candidates) then
      return "No package.swift found"
    end
    return {
      {
        name = "swift build",
        desc = "Build the swift package",
        builder = function()
          return {
            cmd = { "swift", "build" },
            cwd = vim.fs.dirname(candidates[1]),
          }
        end,
      },
      {
        name = "swift run",
        desc = "Run the swift package",
        builder = function()
          return {
            cmd = { "swift", "run" },
            cwd = vim.fs.dirname(candidates[1]),
          }
        end,
      },
    }
  end,
  condition = {
    filetype = { "swift" },
  },
}
