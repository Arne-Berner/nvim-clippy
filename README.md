# Clippy Telescope.nvim

`Clippy Telescope.nvim` is a Neovim plugin that integrates with Rust's `cargo clippy` to show diagnostics in an organized and user-friendly way. It allows users to examine Clippy results within Telescope or Quickfix, clean up caches, and navigate diagnostics for their Rust projects easily.

## Features

- Show `cargo clippy` output in Telescope for better searching and filtering.
- Add Clippy diagnostics directly to the Quickfix list.
- Caches Clippy results to avoid redundant runs, improving performance.
- Easily clean project-specific or global caches.

## Prerequisites

- [Neovim](https://neovim.io) v0.10.0+
- Rust tools installed:
  - [Rust Analyzer](https://rust-analyzer.github.io)
  - `cargo clippy`
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) (optional for Telescope integration)


## Installation

You can install this plugin with your favorite package manager.

### Using `lazy.nvim`

```lua
require("lazy").setup({
  {
    "your-username/nvim-clippy-telescope", -- Replace with your actual GitHub repo path
    config = function()
      require("nvim-clippy.clippy") -- Load the module
    end,
  },
})
```

## Commands / Examples

The plugin defines several user commands to interact with Clippy:

### 1. `:Clip` (Telescope Diagnostics)
Run `cargo clippy` and display diagnostics in Telescope.

#### Example Usage:
- Run without forcing a `clippy` refresh:
  ```
  :Clip
  ```
- Force Clippy to rerun:
  ```
  :Clip!
  ```


### 2. `:ClipQF` (Quickfix Diagnostics)
Run `cargo clippy` and send diagnostics to the Quickfix list.

#### Example Usage:
- Without forcing a `clippy` refresh:
  ```
  :ClipQF
  ```
- Force Clippy to rerun:
  ```
  :ClipQF!
  ```


### 3. `:CleanClip` (Clean Cache for Current Project)
Remove the cached Clippy diagnostics for the current project.

#### Example:
```vim
:CleanClip
```


### 4. `:CleanClipWhole` (Clean Entire Cache Directory)
Remove **all** cached Clippy results across projects stored in the cache directory.

#### Example:
```vim
:CleanClipWhole
```


## How It Works

### Command Flow:
1. **`:Clip` and `:ClipQF`**:
   - Runs `cargo clippy` and either loads cached results (if available) or reruns Clippy as needed.
   - `:Clip` sends diagnostics to Telescope, pressing enter will copy the suggested replacement for that line
   - `:ClipQF` populates the Neovim Quickfix list with the results.

2. **Caching**:
   - Results are saved to a cache directory (`~/.local/state/nvim/clippy_results`).
   - Cached diagnostics are reused where possible to avoid rerunning Clippy unnecessarily.

3. **Caching Cleanup**:
   - `:CleanClip`: Deletes cache for the current project.
   - `:CleanClipWhole`: Deletes all cached Clippy results.

For this to work, you need to set your current directory to a rust one.


## Contributing

Contributions are welcome! If you encounter a bug, have a feature request, or want to improve the code, feel free to open an issue or pull request on GitHub.
This is an especially easy project to get involved in.


## Acknowledgments

- This plugin integrates with [Telescope](https://github.com/nvim-telescope/telescope.nvim) and Quickfix for enhanced navigation.
- Inspired by the Rust development experience and the need for simple Clippy integration in Neovim.


## License
Except where noted (below and/or in individual files), all code in this repository is dual-licensed under either:

MIT License (LICENSE-MIT or http://opensource.org/licenses/MIT)
Apache License, Version 2.0 (LICENSE-APACHE or http://www.apache.org/licenses/LICENSE-2.0)
at your option. This means you can select the license you prefer! This dual-licensing approach is the de-facto standard in the Rust ecosystem and there are very good reasons to include both.
