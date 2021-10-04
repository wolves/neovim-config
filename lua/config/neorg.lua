local neorg = require("neorg")

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>o",
      }
    },
    ["core.norg.concealer"] = {},
    ["core.integrations.telescope"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          sunbird = "~/.neorg/sunbird",
          wlvs    = "~/.neorg/wlvs"
        }
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
  }
})
