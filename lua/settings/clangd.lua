local bin_path = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

return {
  capabilities = {
    offsetEncoding = "utf-16",
  },
  cmd = { bin_path .. "clangd" },
  args = {
    "-xc++",
    "--background-index",
    "-std=c++2b",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
  },
}

