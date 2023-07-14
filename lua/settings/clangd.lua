return {
  capabilities = {
    offsetEncoding = "utf-16",
  },
  args = {
    "-xc++",
    "--background-index",
    "-std=c++2b",
    "--pch-storage=memory",
    "--clang-tidy",
    "--suggest-missing-includes",
  },
}

