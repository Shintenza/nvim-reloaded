return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    opts = {
      check_ts = true
    }
  },
  {
    'windwp/nvim-ts-autotag',
    config = true,
    opts = {
      enable_close_on_slash = true
    }
  }
}
