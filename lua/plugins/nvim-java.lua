return {
  {
    "nvim-java/nvim-java",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require('java').setup({
        root_markers = {
          'settings.gradle',
          'settings.gradle.kts',
          'pom.xml',
          'build.gradle',
          'mvnw',
          'gradlew',
          'build.gradle',
          'build.gradle.kts',
          '.git',
        },
        java_test = {
          enable = true,
        },
        java_debug_adapter = {
          enable = true,
        },
        spring_boot_tools = {
          enable = true,
        },
        jdk = {
          auto_install = true,
        },
        notifications = {
          dap = true,
        },
      })

      vim.lsp.config("jdtls", {})
      vim.lsp.enable("jdtls")
    end,
  },
}
