-- closes all nvchad tabs except current one
local close_all_but_this = function()
  local current_bufnr = vim.api.nvim_get_current_buf()
  for _, bufnr in ipairs(vim.t.bufs) do
    if bufnr ~= current_bufnr then
      require("nvchad.tabufline").close_buffer(bufnr)
    end
  end
end

-- close all nvchad tabs to the right
local close_buffers_to_right = function()
  local current_bufnr = vim.api.nvim_get_current_buf()
  local current_index = nil

  for i, bufnr in ipairs(vim.t.bufs) do
    if bufnr == current_bufnr then
      current_index = i
      break
    end
  end

  if current_index then
    for i = #vim.t.bufs, current_index + 1, -1 do
      require("nvchad.tabufline").close_buffer(vim.t.bufs[i])
    end
  end
end

-- close all nvchad tabs to the left
local close_buffers_to_left = function()
  local current_bufnr = vim.api.nvim_get_current_buf()
  local current_index = nil

  for i, bufnr in ipairs(vim.t.bufs) do
    if bufnr == current_bufnr then
      current_index = i
      break
    end
  end

  if current_index then
    for i = current_index - 1, 1, -1 do
      require("nvchad.tabufline").close_buffer(vim.t.bufs[i])
    end
  end
end

return {
  close_all_but_this = close_all_but_this,
  close_buffers_to_left = close_buffers_to_left,
  close_buffers_to_right = close_buffers_to_right,
}
