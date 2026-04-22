return {
  'greggh/claude-code.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<CR>', desc = 'Toggle Claude Code' },
  },
  config = function()
    require('claude-code').setup {
      window = {
        position = 'vertical',
        split_ratio = 0.3,
      },
    }
  end,
}
