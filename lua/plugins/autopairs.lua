return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      opts = {
        enable_close_on_slash = true,
      },
    },
  },
}
