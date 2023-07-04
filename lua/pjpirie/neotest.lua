require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test",
      --[[ jestConfigFile = "custom.jest.config.ts", ]]
      dap = { justMyCode = false },
      env = { CI = true },
      cwd = function(path)
        return (vim.fn.getcwd() .. "/source/")
      end,
    }),
    --[[ require("neotest-plenary"), ]]
    --[[ require("neotest-vim-test")({ ]]
    --[[   ignore_file_types = { "python", "vim", "lua" }, ]]
    --[[ }), ]]
  },
})
