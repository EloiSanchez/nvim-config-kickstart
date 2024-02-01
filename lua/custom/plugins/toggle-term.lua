return {
  {'akinsho/toggleterm.nvim', version = "*", opts = {
    float_opts = {
      border = "curved"
    },
    on_open = function (term)
      vim.cmd("startinsert!")
    end
  }
  }
}
