return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")

    -- for commenting tsx and jsx files
    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
    ---@diagnostic disable-next-line missing-fields
    comment.setup({
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
