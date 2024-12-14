local tabufline = require("nvchad.tabufline")
return {
  close_all_but_this = function()
    tabufline.closeAllBufs(false)
  end,
  close_buffers_to_left = function()
    tabufline.closeBufs_at_direction("left")
  end,
  close_buffers_to_right = function()
    tabufline.closeBufs_at_direction("right")
  end,
}
