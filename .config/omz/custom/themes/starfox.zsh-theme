# Based upon:
# - 'pygmalion' oh-my-zsh theme
# - https://stackoverflow.com/questions/16147173/command-prompt-directory-styling
# - get_unpushed_commits from egarcia (adapted)

directory_name() {

    local BASE_PROMPT=""
    local PATH_PROMPT=""
    local CURRENT_PROMPT=""

    local REALPWD=$(realpath $PWD)

    if [[ $REALPWD = / ]]; then
        BASE_PROMPT="🌲"
        PATH_PROMPT=""
        CURRENT_PROMPT=""

    elif [[ $REALPWD = $HOME ]]; then
        BASE_PROMPT="🏠"
        PATH_PROMPT=""
        CURRENT_PROMPT=""

    else
        if [[ -d $(git rev-parse --show-toplevel 2>/dev/null) ]]; then
            # We're in a git repo.
            local GIT_ROOT=$(git rev-parse --show-toplevel)
            BASE_PROMPT=$(basename ${GIT_ROOT})
            if [[ $REALPWD -ef $GIT_ROOT ]]; then
                # We're in the root: display only this folder
                PATH_PROMPT=""
                CURRENT_PROMPT=""
            else
                # We're not in the root: display root and also path from it
                local PATH_TO_CURRENT="${REALPWD#$GIT_ROOT}"

                PATH_PROMPT="${PATH_TO_CURRENT%/*}/"
                CURRENT_PROMPT="%1~"
            fi
        else
            # We're not in a git repo: display full path
            local PATH_TO_CURRENT="$(print -P %~)"
            local CURRENT="$(print -P %1~)"

            BASE_PROMPT=""
            PATH_PROMPT="${PATH_TO_CURRENT%/*}/"
            CURRENT_PROMPT="${CURRENT#/}"
        fi
    fi
    # base folder in magenta, intermediate path in cyan, current folder in yellow
    echo "%{$fg[magenta]%}${BASE_PROMPT}%{$reset_color%}%{$fg[cyan]%}${PATH_PROMPT}%{$reset_color%}%{$fg[yellow]%}${CURRENT_PROMPT}%{$reset_color%}"
}

get_unpushed_commits () {
    no_remote_branch="no-remote-branch"

    is_git_repo=$(git rev-parse --is-inside-work-tree 2> /dev/null || echo false)
    unpushed_commits="git cherry -vv 2> /dev/null"
    if "$is_git_repo"; then
        output_unpushed=`eval $unpushed_commits || echo $no_remote_branch`
        if [ "$output_unpushed" = "$no_remote_branch" ]; then
            output="🔼";
        else
            quantity=`eval $unpushed_commits | wc -l | tr -d '[:space:]'`
            case $quantity in
                "0")  output="";;
                *)    output="⬆️ ";;
            esac
        fi;
    else
        output=""
    fi;
    echo $output
}

exit_color() {
    local LAST_EXIT_CODE=$?
    if [[ $LAST_EXIT_CODE -ne 0 ]]; then
        color="red"
    else
        color="cyan"
    fi;
    echo $color
}

kerl_prompt() {
    local pmpt=`kerl prompt || echo ""`

    if [ -n "$pmpt" ]; then
        local pmpt_clean=`echo $pmpt | tr -d ' ()'`
        echo " (%{$fg[blue]%}$pmpt_clean%{$reset_color%})"
    else
        echo ""
    fi;
}

prompt_starfox() {
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=""
    MY_GIT_PREFIX=" %{$reset_color%}(%{$fg[green]%}"
    MY_GIT_SUFIX="%{$reset_color%})"

    ZSH_THEME_VIRTUALENV_PREFIX=" (%{$fg[blue]%}"
    ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%})"

    local virtualenv=$(virtualenv_prompt_info) # provided by plugin

    local kerlprompt=$(kerl_prompt) # kerl only works with PS1

    local base_prompt="[$(directory_name)]" # see function above

    # git_prompt_info provided by zsh
    gitpromptinfo=$(git_prompt_info)
    if [ -n "$gitpromptinfo" ]; then
        local gitinfo="$MY_GIT_PREFIX$gitpromptinfo$(get_unpushed_commits)$MY_GIT_SUFIX"
    else
        local gitinfo=""
    fi;

    local post_prompt='%{$fg[$(exit_color)]%}❯%{$reset_color%} '

    local time="[%{$fg[yellow]%}$(date +%H:%M:%S)%{$reset_color%}] "
    local nl=$'\n%{\r%}'

    PROMPT="$time$base_prompt$virtualenv$kerlprompt$gitinfo$nl$post_prompt"
}

precmd_functions+=(prompt_starfox)


