vim.api.nvim_create_user_command("OnionFun", function()
  local ctx = vim.uv.new_work(function()
    local ffi = require("ffi")
    ffi.cdef([[
    void InitWindow(int width, int height, const char *title);
    bool WindowShouldClose();
    void CloseWindow();
    void BeginDrawing();
    void EndDrawing();
    void SetTraceLogLevel(int logLevel);
    ]])
    local raylib = ffi.load("raylib")
    raylib.SetTraceLogLevel(7)
    raylib.InitWindow(800, 600, "urmom")
    while not raylib.WindowShouldClose() do
      raylib.BeginDrawing()
      raylib.EndDrawing()
    end
    raylib.CloseWindow()
  end, function() end)
  vim.uv.queue_work(ctx)
end, {})
