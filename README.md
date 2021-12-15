Dotfiles
========

These are my dotfiles.

### How to get them into a new system

1. Copy `bin/dotgit-replicate` somewhere locally and run it. It will set up the repo and submodules. You can delete it afterwards.

2. Install [homebrew](brew.sh) and run `brew bundle install --file .config/brew/Brewfile` in your home.
2.1 You will probably install extra packages beyond that; run `brew bundle dump --file .config/brew/Brewfile.local` to track the actual list. If any of those packages you think it's useful to keep around across machine, move the relevant line into `.config/brew/Brewfile` as you please.

3. Run `pip3 install virtualenv virtualenvwrapper`.

4. Open vim and run `:PluginInstall`.

That's it!

