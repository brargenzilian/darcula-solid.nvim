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

Huge thanks to [@rorystephenson](https://github.com/rorystephenson) for suggesting this amazing idea and the developers of [lush.nvim](https://github.com/rktjmp/lush.nvim) for their work that made this possible. 
