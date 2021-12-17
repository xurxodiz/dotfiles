Dotfiles
========

These are my dotfiles.

## How to get them into a new system

1. Copy `.local/bin/dotgit-replicate` somewhere locally and run it. It will set up the repo and submodules. You can delete it afterwards.

2. Install [Homebrew](brew.sh)
    1. Run `brew bundle install --file .config/brew/Brewfile` in your home.
    2. You will probably install extra packages beyond that; run `brew bundle dump --file .config/brew/Brewfile.local` to track the actual list. If any of those packages you think it's useful to keep around across machine, move the relevant line into `.config/brew/Brewfile` as you please.

3. Remember to run `/usr/local/opt/fzf/install --xdg` to enable fzf-zsh integration
    1. You may need to `mkdir -p ~/.local/state/fzf` first
    2. During the installation, enable fuzzy autocompletion and key bindings, but don't ask to update the shell configuration files (they already are)

4. Run `pip3 install virtualenv virtualenvwrapper`.

5. Open `vim` and run `:PluginInstall`.

6. If you're setting up a new machine:
    1. You might want to open Screenshot app and change the screenshot folder in the options menu (e.g. to `~/Screenshots`).
    2. You might want to go to `iTerm2 > Preferences > Profiles > Keys > Mappings > Presets > Natural Text Editing`, it will enable you to move through words with `Alt+Left/Right arrow`, and delete them with `Alt+Backspace`.

That's it!

