# toolbox.nvim

Assortment of everyday functionality that I consider to be quality-of-life improvements for development in Neovim.

## Installation

To install the plugin using Lazy package manager add the following configuration:

```lua
require('lazy').setup({
  {
    'andriusm/toolbox.nvim',
    config = function()
      require('toolbox').setup()
    end
  }
})
```

If you're using another package manager hopefully you can figure it out from the above.

## Keybindings

These are the default keybindings for the functionality provided by this plugin.

```lua
vim.keymap.set('n', '<leader>fi', require('toolbox').file_info)
vim.keymap.set('n', '<leader>fo', require('toolbox').find_owners_of_current_file)
vim.keymap.set('n', '<leader>xo', require('toolbox').find_pr_of_current_line)
```

## Functionality

Once the plugin is installed and the keybindings are set up, you can use the following functions:

`<leader>fo` displays a modal with the file's owners (from CODEOWNERS file in root of project) and public status.

`<leader>fi` displays a modal with the current file’s name.

`<leader>xo` finds and opens (in web browser) the pull request associated with the current line in your Git repository.
