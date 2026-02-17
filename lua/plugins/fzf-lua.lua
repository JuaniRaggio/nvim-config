return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({
      "ivy",
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      winopts = {
        height = 1,
        preview = {
          layout = "vertical",
          vertical = "up:65%",
          winopts = {
            number = false,
          },
        },
      },
      hls = {
        preview_normal = "Normal",
        preview_border = "Normal",
      },
    })
    require("fzf-lua").register_ui_select()
  end,
}
