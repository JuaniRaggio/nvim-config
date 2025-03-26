return {
  {
    "nvim-java/nvim-java",

    config = function()
      require('java').setup()
    end,

    require('lspconfig').jdtls.setup({
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "/opt/jdk-21",
                {
                  --  list of file that exists in root of the project
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

                  jdtls = {
                    version = 'v1.43.0',
                  },

                  lombok = {
                    version = 'nightly',
                  },

                  -- load java test plugins
                  java_test = {
                    enable = true,
                    version = '0.40.1',
                  },

                  -- load java debugger plugins
                  java_debug_adapter = {
                    enable = true,
                    version = '0.58.1',
                  },

                  spring_boot_tools = {
                    enable = true,
                    version = '1.55.1',
                  },

                  jdk = {
                    -- install jdk using mason.nvim
                    auto_install = true,
                    version = '17.0.2',
                  },

                  notifications = {
                    -- enable 'Configuring DAP' & 'DAP configured' messages on start up
                    dap = true,
                  },

                  -- We do multiple verifications to make sure things are in place to run this
                  -- plugin
                  verification = {
                    -- nvim-java checks for the order of execution of following
                    -- * require('java').setup()
                    -- * require('lspconfig').jdtls.setup()
                    -- IF they are not executed in the correct order, you will see a error
                    -- notification.
                    -- Set following to false to disable the notification if you know what you
                    -- are doing
                    invalid_order = true,

                    -- nvim-java checks if the require('java').setup() is called multiple
                    -- times.
                    -- IF there are multiple setup calls are executed, an error will be shown
                    -- Set following property value to false to disable the notification if
                    -- you know what you are doing
                    duplicate_setup_calls = true,

                    -- nvim-java checks if nvim-java/mason-registry is added correctly to
                    -- mason.nvim plugin.
                    -- IF it's not registered correctly, an error will be thrown and nvim-java
                    -- will stop setup
                    invalid_mason_registry = false,
                  },

                  mason = {
                    -- These mason registries will be prepended to the existing mason
                    -- configuration
                    registries = {
                      'github:nvim-java/mason-registry',
                    },
                  },
                }
              }
            }
          }
        }
      }
    }),
  },
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    require("lsp_signature").setup({
      bind = true,
      floating_window = true,
      hint_enable = true,
      hi_parameter = "Search",
    }),

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Opcional: Mapea comandos LSP para el buffer actual
          require("lsp_signature").on_attach({
            bind = true,
            floating_window = true,
            hint_enable = true,
          }, bufnr)
        end,
      })
      -- Pyright para Python
      lspconfig.pyright.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
}
