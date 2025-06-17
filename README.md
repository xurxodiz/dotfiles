Dotfiles
========

These are my dotfiles.

## How to get them into a new system

1. Copy `.local/bin/dotgit-replicate` somewhere locally and run it. It will set up the repo and submodules. You can delete it afterwards.

2. Install [Homebrew](brew.sh)
    1. Run `brew bundle install --file .config/brew/Brewfile` in your home.
    2. If you want to keep a log of the extra packages you install in the current system, follow these steps:
        * `brew bundle dump --file .config/brew/Brewfile.local` to create a full list of this system
        * `cat .config/brew/Brewfile | sort > .config/brew/Brewfile.o` to sort the repo file
        * `cat .config/brew/Brewfile.local | sort > .config/brew/Brewfile.local.o` to sort the system file
        * `comm -13 .config/brew/Brewfile.o .config/brew/Brewfile.local.o > .config/brew/Brewfile.delta.o` to create the diff

3. Remember to run `/usr/local/opt/fzf/install --xdg` to enable fzf-zsh integration
    1. You may need to `mkdir -p ~/.local/state/fzf` first
    2. During the installation, enable fuzzy autocompletion and key bindings, but don't ask to update the shell configuration files (they already are)

4. Run `pip3 install virtualenv virtualenvwrapper`.

5. Open `vim` and run `:PluginInstall`.

6. Go to `iTerm2 > Settings > General > Settings`. Check `Load settings from a custom folder or URL` and write `~/.config/iterm2`, then select `Save Changes Automatically`

7. If you're setting up a new machine, you might want to open Screenshot app and change the screenshot folder in the options menu (e.g. to `~/Screenshots`).

That's it!
