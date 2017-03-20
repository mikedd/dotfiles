k8s_prompt() {
    local ctx
    local color
    ctx=$(kubectl config current-context)
    if [[ ${ctx} == *"dev"* ]]; then
        color='green'
    elif [[ ${ctx} == *"stage"* ]]; then
        color='yellow'
    else 
        color='magenta'
    fi

    print -n %{$fg[${color}]%}${ctx}%{$reset_color%} 

}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

PROMPT='${ret_status} %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%} $(k8s_prompt) $(git_prompt_info) '
