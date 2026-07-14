![Darcula-solid.nvim](https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-solid-logo.png)
# Darcula-solid.nvim
A color-scheme that was heavily inspired by the JetBrains IntelliJ IDEA default theme, but was carefully refined to bring a more pleasant, aesthetic, and contrasting experience.

## Requirements
* `termguicolors` enabled for true color support.

## Instalation examples
With the native [vim.pack](https://neovim.io/doc/user/pack/):
```lua
vim.pack.add({ 'https://codeberg.org/brargenzilian/darcula-solid.nvim' });
```
With [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
use { "brargenzilian/darcula-solid.nvim" }
```

## Setup
In `init.lua`:
```lua
vim.cmd('colorscheme darcula-solid')
```
Or in your `init.vim`:
```vim
colorscheme darcula-solid
```

## Preview
![darcula-solid](https://raw.githubusercontent.com/briones-gabriel/darcula-solid.nvim/main/resources/darcula-solid-example.png)

## How to contribute
1. Install the following packages in your local Neovim configuration:
    - [shipwright.nvim](https://github.com/rktjmp/shipwright.nvim) (required)
    - [lush.nvim](https://github.com/rktjmp/lush.nvim) (optional but recommended)
2. Add/Update/Remove highlight groups from the `lua/darcula-solid/groups.lua` file
3. Add/Update/Remove colors from the `lua/darcula-solid/palette.lua` file
4. Once you're done with your changes, build the colorscheme using the `lua/build.lua` file. It will update `lua/darcula-solid/init.lua` automatically. This will allow you to test the colorscheme locally by pointing towards the project from your local Neovim configuration. You can see more of how this step works [here](https://github.com/rktjmp/shipwright.nvim#shipwright-build_file) and [here](https://github.com/rktjmp/lush.nvim/blob/main/BUILD.md#exporting-a-colorscheme-to-lua)
5. Create a pull request and explain your changes

Huge thanks to [@rorystephenson](https://github.com/rorystephenson) for suggesting this amazing idea and the developers of [lush.nvim](https://github.com/rktjmp/lush.nvim) for their work that made this possible. 
