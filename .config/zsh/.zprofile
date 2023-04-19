# Each new shell auto-imports all environment variables.
# Hence exporting needs to be done only once.
# Also, all non-login shells are descendants of a login shell.
# Ergo, exports need to be done in the login shell only.
# Hence, we put exports in .zprofile

# Only vars needed by external commands should be exported.
# Note that you can export vars w/out assigning a value to them.
export XDG_CONFIG_HOME
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID
export EDITOR=vim
export VISUAL=vim

# These are used by Apple in /etc/zshrc, which is sourced _before_ .zshrc
# Wouldn't have to go in .zprofile otherwise.
# We could put them in .zshenv, but that file is best kept as small as possible.
export SHELL_SESSION_DIR=$XDG_STATE_HOME/zsh/sessions
export SHELL_SESSION_FILE=$SHELL_SESSION_DIR/$TERM_SESSION_ID
