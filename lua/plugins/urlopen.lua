return {
  "JuaniRaggio/openurl-nvim",
    config = function()
        require("openurl-nvim").setup({
            detection_mode = "cursor"
        })
    end,
}
