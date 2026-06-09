Dotfiles
========

These are my dotfiles.

## How to get them into a new system

1. Copy `.local/bin/dotgit-replicate` somewhere locally and run it. It will set up the repo and submodules. You can delete it afterwards.

2. Install [Homebrew](brew.sh)
    1. Run `brew bundle install --file .config/brew/Brewfile` in your home.
    2. If you want to check the packages you have installed in the current system, run `brew bundle dump --file .config/brew/Brewfile.local`

3. Open `vim` and run `:PluginInstall`.

4. Open `iTerm2`and:
    1. Go to `iTerm2 > Settings > General > Settings`. Check `Load settings from a custom folder or URL` and navigate to `~/.config/iterm2` (remember to use the shortcut Ctrl+Shift+. to view hidden folders). Then select `Save Changes Automatically` below it.
    2. Go to `iTerm2 > Settings > Profiles > Other actions… > Import JSON Profiles…` and choose `Starfox.json`.

5. If you're setting up a new machine, you might want to open Screenshot app and change the screenshot folder in the options menu (e.g. to `~/Screenshots`).

That's it!
