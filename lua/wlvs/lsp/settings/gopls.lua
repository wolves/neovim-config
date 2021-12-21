local opts = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unreachable = true,
      },
      codelenses = {
        gc_details = true,
        test = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  }
}

return opts
