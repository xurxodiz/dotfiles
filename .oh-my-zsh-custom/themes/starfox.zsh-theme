# Based upon:
# - 'pygmalion' oh-my-zsh theme
# - https://stackoverflow.com/questions/16147173/command-prompt-directory-styling

directory_name() {

    local BASE_PROMPT=""
    local PATH_PROMPT=""
    local CURRENT_PROMPT=""

    if [[ $PWD = / ]]; then
        BASE_PROMPT="🌲"
        PATH_PROMPT=""
        CURRENT_PROMPT=""

    elif [[ $PWD = $HOME ]]; then
        BASE_PROMPT="🏠"
        PATH_PROMPT=""
        CURRENT_PROMPT=""

    else
        if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
            # We're in a git repo.
            local GIT_ROOT=$(git rev-parse --show-toplevel)
            BASE_PROMPT=$(basename ${GIT_ROOT})
            if [[ $PWD = $GIT_ROOT ]]; then
                # We're in the root: display only this folder
                PATH_PROMPT=""
                CURRENT_PROMPT=""
            else
                # We're not in the root: display root and also path from it
                local PATH_TO_CURRENT="${PWD#$GIT_ROOT}"

                PATH_PROMPT="${PATH_TO_CURRENT%/*}/"
                CURRENT_PROMPT="%1~"
            fi
        else
            # We're not in a git repo: display full path
            local PATH_TO_CURRENT=$(print -P %~)
            local CURRENT=$(print -P %1~)

            BASE_PROMPT=""
            PATH_PROMPT="${PATH_TO_CURRENT%/*}/"
            CURRENT_PROMPT="${CURRENT#/}"
        fi
    fi
    # base folder in magenta, intermediate path in cyan, current folder in yellow
    echo "%{$fg[magenta]%}${BASE_PROMPT}%{$reset_color%}%{$fg[cyan]%}${PATH_PROMPT}%{$reset_color%}%{$fg[yellow]%}${CURRENT_PROMPT}%{$reset_color%}"
}


prompt_starfox() {
    ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%}(%{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_VIRTUALENV_PREFIX="(%{$fg[green]%}"
    ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}) "

    local virtualenv=$(virtualenv_prompt_info) # provided by plugin
    local base_prompt="[$(directory_name)]" # see function above
    local gitinfo=$(git_prompt_info) # provided by plugin
    local post_prompt='%{$fg[cyan]%}⇒%{$reset_color%}  '

    local base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
    local post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

    local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")
    local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
    local prompt_length=${#exp_nocolor}

    local nl=" "

    if [[ $prompt_length -gt 80 ]]; then
        nl=$'\n%{\r%}';
    fi
    PROMPT="$virtualenv$base_prompt$gitinfo$nl$post_prompt"
}

precmd_functions+=(prompt_starfox)


