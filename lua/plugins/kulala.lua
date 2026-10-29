return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send Request" },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "Toggle Headers/Body" },
      { "<leader>Rp", function() require("kulala").jump_prev() end, desc = "Previous Request" },
      { "<leader>Rn", function() require("kulala").jump_next() end, desc = "Next Request" },
    },
    opts = {},
  },
}
